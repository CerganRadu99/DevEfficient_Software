using Application.Interfaces;
using Domain.Core;
using Domain.Dtos;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class SprintService: ISprintService
    {
        private readonly IUnitOfWork _unitOfWork;

        public SprintService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<int> RegisterSprint(RegisteredSprintDto registeredSprintDto)
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
                        EndDate = registeredSprintDto.EndDate
                    };
                    var isTransactionSucceeded = true;
                    var isSprintRegistered = await _unitOfWork.Sprints.Register(sprintToRegister);
                    if (isSprintRegistered == 0)
                    {
                        isTransactionSucceeded = false;
                    }
                    foreach (var itemId in registeredSprintDto.ItemIds)
                    {
                        var currentItem = await _unitOfWork.Items.GetById(itemId);
                        currentItem.SprintId = sprintId;
                        var isItemUpdated = await _unitOfWork.Items.Update(currentItem);
                        if(isItemUpdated == 0)
                        {
                            isTransactionSucceeded = false;
                        }
                    }       
                    if(isTransactionSucceeded)
                    {
                        transaction.Commit();
                        return await Task.FromResult(1);
                    }
                    return await Task.FromResult(0);
                }
                catch(Exception ex)
                {
                    transaction.Rollback();
                    return await Task.FromResult(0);
                }
            }
        }
    }
}
