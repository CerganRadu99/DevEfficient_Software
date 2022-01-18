using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Core
{
    public interface IItemTypeRepository: IRepository<ItemType>
    {
        public Task<ItemType> GetItemTypeByName(string itemTypeName);
    }
}
