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
        public Task<IEnumerable<RetrievedItemDto>> GetAll(GetItemsBodyModel getItemsPostModel);
        public Task<ItemDetailsDto> GetItem(Guid itemId);

        public Task<Guid> RegisterItem(RegisteredItemDto registeredItemDto);

        public Task<int> UpdateItem(ItemDetailsDto itemDetailsDto);

        public Task<int> DeleteItem(Guid itemId);

        public Task<int> UpdateStateOfItem(Guid itemId, string newState);

        public Task<int> SetSprintOfItem(Guid itemId);

        public Task<int> ClearSprintOfItem(Guid itemId);

        public List<Guid> ReorderItemsTopBottomDevboard(TopBottomDevboardBodyModel topBottomDevBodyModel);

        public bool ChangeItemsOrderInCache(NewItemsOrderModel newItemsOrderModel);
    }
}
