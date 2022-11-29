using Domain.Core;
using Domain.Dtos;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Persistence.Repository
{
    public class SprintRepository : Repository<Sprint>, ISprintRepository
    {
        public SprintRepository(DevEfficientDbContext dbContext) : base(dbContext) { }

        public async Task<RetrievedCurrentSprint> GetCurrentActivatedSprint()
        {
            var currentSprint = this._dbSet.Include(sprint => sprint.Items).ThenInclude(it => it.State)
                .Include(sprint => sprint.Items).ThenInclude(it => it.ItemType).FirstOrDefault(sprint => sprint.IsActive);
            if(currentSprint == null)
            {
                return await Task.FromResult<RetrievedCurrentSprint>(null);
            }
            List<RetrievedItemDto> retrievedItems = new List<RetrievedItemDto>();
            foreach(var item in currentSprint.Items)
            {
                retrievedItems.Add(new RetrievedItemDto
                {
                    Id = item.Id,
                    Title = item.Title,
                    Priority = item.Priority,
                    EstimatedHours = item.EstimatedHours,
                    Effort = item.Effort,
                    State = item.State.Name,
                    Type = item.ItemType.Name
                });
            }
            return await Task.FromResult(new RetrievedCurrentSprint
            {
                Id = currentSprint.Id,
                Title = currentSprint.Title,
                Goal = currentSprint.Goal,
                StartDate = currentSprint.StartDate,
                EndDate = currentSprint.EndDate,
                TotalEstimatedHours = currentSprint.TotalEstimatedHours,
                SprintItems = retrievedItems
            });
        }

        public async Task<Sprint> GetCurrentSprint()
        {
            var currentSprint = this._dbSet.Include(sprint => sprint.Items).ThenInclude(it => it.State).Include(sprint => sprint.Items).ThenInclude(it => it.ItemType).FirstOrDefault(sprint => sprint.IsActive == false && sprint.IsClosed == false);
            if (currentSprint == null)
            {
                return await Task.FromResult<Sprint>(null);
            }
            return await Task.FromResult(currentSprint);
        }
        public List<RetrievedItemDto> GetCurrentSprintItems()
        {
            var currentSprint = this._dbSet.Include(sprint => sprint.Items).ThenInclude(it => it.State).Include(sprint => sprint.Items).ThenInclude(it => it.ItemType).FirstOrDefault(sprint => sprint.IsActive == false && sprint.IsClosed == false);
            if (currentSprint == null)
            {
                return null;
            }
            List<RetrievedItemDto> retrievedItems = new List<RetrievedItemDto>();
            foreach (var item in currentSprint.Items)
            {
                retrievedItems.Add(new RetrievedItemDto
                {
                    Id = item.Id,
                    Title = item.Title,
                    Priority = item.Priority,
                    EstimatedHours = item.EstimatedHours,
                    Effort = item.Effort,
                    State = item.State.Name,
                    Type = item.ItemType.Name
                });
            }
            return retrievedItems;
        }
    }
}
