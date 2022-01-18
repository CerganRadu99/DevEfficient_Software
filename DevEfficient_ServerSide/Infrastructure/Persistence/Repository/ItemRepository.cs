using Domain.Core;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Domain.Dtos;

namespace Infrastructure.Persistence.Repository
{
    public class ItemRepository : Repository<Item>, IItemRepository
    {
        public ItemRepository(DevEfficientDbContext dbContext) : base(dbContext) { }

        public async Task<IEnumerable<RetrievedItemDto>> GetFullItems()
        {
            return await this._dbSet.Include(it => it.State).Include(it => it.ItemType)
                .Select(item => new RetrievedItemDto
                {
                    Id = item.Id,
                    Title = item.Title,
                    Priority = item.Priority,
                    EstimatedHours = item.EstimatedHours,
                    Effort = item.Effort,
                    State = item.State.Name,
                    Type = item.ItemType.Name
                }).ToListAsync();
        }

        public async Task<ItemDetailsDto> GetFullItem(Guid itemId)
        {
            Item currentItem = await this._dbSet.Include(it => it.State).Include(it => it.ItemType).Include(it => it.TeamMember).Include(it => it.Sprint)
                .FirstOrDefaultAsync(item => item.Id.Equals(itemId));
            return new ItemDetailsDto { 
                Id = currentItem.Id,
                Title = currentItem.Title,
                EstimatedHours = currentItem.EstimatedHours,
                EstimatedEffort = currentItem.Effort,
                Priority = currentItem.Priority,
                State = currentItem.State.Name,
                Type = currentItem.ItemType.Name,
                ActualHours = currentItem.ActualHours,
                SprintName = currentItem.Sprint == null ? null : currentItem.Sprint.Title,
                AssignedName = currentItem.TeamMember == null ? null : currentItem.TeamMember.Name
            };    
        }
    }
}
