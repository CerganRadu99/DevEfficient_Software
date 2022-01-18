using Domain.Core;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Persistence.Repository
{
    public class ItemTypeRepository: Repository<ItemType>, IItemTypeRepository
    {
        public ItemTypeRepository(DevEfficientDbContext dbContext) : base(dbContext) { }

        public async Task<ItemType> GetItemTypeByName(string itemTypeName)
        {
            return await this._dbSet.FirstOrDefaultAsync(iType => iType.Name.ToLower().Equals(itemTypeName.ToLower()));
        }
    }
}
