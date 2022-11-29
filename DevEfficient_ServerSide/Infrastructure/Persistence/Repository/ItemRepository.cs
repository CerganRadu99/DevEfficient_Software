using Domain.Core;
using Domain.Dtos;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Infrastructure.Persistence.Repository
{
    public class ItemRepository : Repository<Item>, IItemRepository
    {
        public ItemRepository(DevEfficientDbContext dbContext) : base(dbContext) { }

        public async Task<IEnumerable<RetrievedItemDto>> GetFullItems(GetItemsBodyModel getItemsBodyModel)
        {
            if(getItemsBodyModel.SearchTerm == "")
            {
                if (getItemsBodyModel.FilterField == "" && getItemsBodyModel.FilterValue == "")
                {
                    return await this._dbSet.Include(it => it.State).Include(it => it.ItemType).Where(it => it.SprintId == null)
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
                else
                {
                    switch(getItemsBodyModel.FilterField)
                    {
                        case "Type":
                            return await this._dbSet.Include(it => it.State).Include(it => it.ItemType).Where(it => it.SprintId == null).Where(it => it.ItemType.Name.Equals(getItemsBodyModel.FilterValue))
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
                        case "Priority":
                            return await this._dbSet.Include(it => it.State).Include(it => it.ItemType).Where(it => it.SprintId == null).Where(it => it.Priority.Equals(getItemsBodyModel.FilterValue))
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
                        case "State":
                            return await this._dbSet.Include(it => it.State).Include(it => it.ItemType).Where(it => it.SprintId == null).Where(it => it.State.Name.Equals(getItemsBodyModel.FilterValue))
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
                        case "Effort":
                            return await this._dbSet.Include(it => it.State).Include(it => it.ItemType).Where(it => it.SprintId == null).Where(it => it.Effort.Equals(getItemsBodyModel.FilterValue))
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
                        default:
                            return null;
                    }
                }
            }
            else
            {
                if(getItemsBodyModel.FilterField == "" && getItemsBodyModel.FilterValue == "")
                {
                    return await this._dbSet.Include(it => it.State).Include(it => it.ItemType).Where(it => it.SprintId == null)
                        .Where(it => it.Title.ToLower().Contains(getItemsBodyModel.SearchTerm.ToLower()))
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
                else
                {
                    return await this._dbSet.Include(it => it.State).Include(it => it.ItemType).Where(it => it.SprintId == null)
                        .Where(it => it.GetType().GetProperty(getItemsBodyModel.FilterField).Name.Equals(getItemsBodyModel.FilterValue))
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

            }
          
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
