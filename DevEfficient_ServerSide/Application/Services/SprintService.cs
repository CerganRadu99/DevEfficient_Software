using Application.Interfaces;
using Domain.Core;
using Domain.Dtos;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Services
{
    public class SprintService: ISprintService
    {
        private readonly IUnitOfWork _unitOfWork;
        public readonly DateTime currentDateTime;

        public SprintService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            currentDateTime = DateTime.UtcNow;
        }

        public async Task<RetrievedCurrentSprint> GetCurrentActivatedSprint()
        {
            return await _unitOfWork.Sprints.GetCurrentActivatedSprint();
        }

        public List<RetrievedItemDto> GetCurrentSprintItems()
        {
            return  _unitOfWork.Sprints.GetCurrentSprintItems();
        }

        public async Task<Guid> RegisterSprint(RegisteredSprintDto registeredSprintDto)
        {
            using (var transaction = _unitOfWork.BeginTransaction())
            {
                try
                {
                    var sprintId = Guid.NewGuid();
                    Sprint sprintToRegister = new Sprint
                    {
                        Id = sprintId,
                        Title = registeredSprintDto.Title,
                        Goal = registeredSprintDto.Goal,
                        StartDate = registeredSprintDto.StartDate,
                        EndDate = registeredSprintDto.EndDate,
                        IsActive = false
                    };
                    var isTransactionSucceeded = true;
                    var isSprintRegistered = await _unitOfWork.Sprints.Register(sprintToRegister);
                    if (isSprintRegistered == 0)
                    {
                        isTransactionSucceeded = false;
                    }
                    int totalEstimatedHours = 0;
                    foreach (var itemId in registeredSprintDto.ItemIds)
                    {
                        var currentItem = await _unitOfWork.Items.GetById(itemId);
                        totalEstimatedHours += currentItem.EstimatedHours;
                        currentItem.SprintId = sprintId;
                        var isItemUpdated = await _unitOfWork.Items.Update(currentItem);
                        if (isItemUpdated == 0)
                        {
                            isTransactionSucceeded = false;
                        }
                    }
                    sprintToRegister.TotalEstimatedHours = totalEstimatedHours;
                    var isSprintUpdated = await _unitOfWork.Sprints.Update(sprintToRegister);
                    if (isSprintUpdated == 0)
                    {
                        isTransactionSucceeded = false;
                    }
                    if (isTransactionSucceeded)
                    {
                        transaction.Commit();
                        return await Task.FromResult(sprintId);
                    }
                    return await Task.FromResult(Guid.Empty);
                }
                catch(Exception ex)
                {
                    transaction.Rollback();
                    return await Task.FromResult(Guid.Empty);
                }
            }
        }

        public async Task<int> ActivateSprint(RegisteredSprintDto registeredSprintDto)
        {
            var activatedSprint = await _unitOfWork.Sprints.GetCurrentActivatedSprint();
            if(activatedSprint != null)
            {
                return await Task.FromResult(0);
            }
            var currentSprint = await _unitOfWork.Sprints.GetCurrentSprint();
            currentSprint.IsActive = true;
            currentSprint.Title = registeredSprintDto.Title;
            currentSprint.Goal = registeredSprintDto.Goal;
            currentSprint.StartDate = registeredSprintDto.StartDate;
            currentSprint.EndDate = registeredSprintDto.EndDate;
            return await _unitOfWork.Sprints.Update(currentSprint);
        }

        public async Task<int> CloseCurrentActivatedSprint()
        {
            var activatedSprint = await _unitOfWork.Sprints.GetCurrentActivatedSprint();
            if (activatedSprint == null)
            {
                return await Task.FromResult(0);
            }
            var activatedSprintModel = await _unitOfWork.Sprints.GetById((Guid)activatedSprint.Id);
            activatedSprintModel.IsActive = false;
            activatedSprintModel.IsClosed = true;
            return await _unitOfWork.Sprints.Update(activatedSprintModel);
        }

        public async Task<int> DeleteCurrentSprint()
        {
            var currentSprint = await _unitOfWork.Sprints.GetCurrentSprint();
            return await _unitOfWork.Sprints.Delete(currentSprint);
        }
    }
}
