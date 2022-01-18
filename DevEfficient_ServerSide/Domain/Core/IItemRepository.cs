using Domain.Dtos;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Core
{
    public interface IItemRepository: IRepository<Item>
    {
        public Task<IEnumerable<RetrievedItemDto>> GetFullItems();
        public Task<ItemDetailsDto> GetFullItem(Guid itemId);
    }
}
