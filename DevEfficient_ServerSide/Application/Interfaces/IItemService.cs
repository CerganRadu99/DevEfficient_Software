using Domain.Dtos;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface IItemService
    {
        public Task<IEnumerable<RetrievedItemDto>> GetAll();
        public Task<ItemDetailsDto> GetItem(Guid itemId);

        public Task<int> RegisterItem(RegisteredItemDto registeredItemDto);

        public Task<int> UpdateItem(ItemDetailsDto itemDetailsDto);
    }
}
