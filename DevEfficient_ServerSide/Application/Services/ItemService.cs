using Application.Interfaces;
using Domain.Core;
using Domain.Dtos;
using Domain.Entities;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Services
{
    public class ItemService : IItemService
    {
        private const string ITEMS_ORDER_CACHE_KEY = "itemsOrderCacheKey";
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMemoryCache _memoryCache;

        public ItemService(IUnitOfWork unitOfWork, IMemoryCache memoryCache)
        {
            _unitOfWork = unitOfWork;
            _memoryCache = memoryCache;
        }

        public async Task<IEnumerable<RetrievedItemDto>> GetAll(GetItemsBodyModel getItemsBodyModel)
        {

            var items = await _unitOfWork.Items.GetFullItems(getItemsBodyModel);
            List<Guid> itemsOrder = new List<Guid>();
            if(_memoryCache.TryGetValue(ITEMS_ORDER_CACHE_KEY, out itemsOrder))
            {
                List<RetrievedItemDto> orderedItems = new List<RetrievedItemDto>();
                foreach(var itemId in itemsOrder)
                {
                    var searchedItem = ((items as List<RetrievedItemDto>).Find(item => item.Id == itemId));
                    if(searchedItem != null)
                    {
                        orderedItems.Add(searchedItem);
                    }
                }
                return orderedItems;
            }
            return items;

        }

        public async Task<ItemDetailsDto> GetItem(Guid itemId)
        {
            return await _unitOfWork.Items.GetFullItem(itemId);
        }

        public List<Guid> ReorderItemsTopBottomDevboard(TopBottomDevboardBodyModel topBottomDevBodyModel)
        {
            if(topBottomDevBodyModel.ItemIds.Contains(topBottomDevBodyModel.ItemId))
            {
                topBottomDevBodyModel.ItemIds.Remove(topBottomDevBodyModel.ItemId);
            }
            switch(topBottomDevBodyModel.Option)
            {
                case "top":
                    topBottomDevBodyModel.ItemIds.Insert(0, topBottomDevBodyModel.ItemId);
                    break;
                case "bottom":
                    topBottomDevBodyModel.ItemIds.Add(topBottomDevBodyModel.ItemId);
                    break;
            }
            _memoryCache.Set(ITEMS_ORDER_CACHE_KEY, topBottomDevBodyModel.ItemIds);
            return topBottomDevBodyModel.ItemIds;
            
        }

        public bool ChangeItemsOrderInCache(NewItemsOrderModel newItemsOrderModel)
        {
            _memoryCache.Set(ITEMS_ORDER_CACHE_KEY, newItemsOrderModel.ItemIds);
            return true;
        }

        public async Task<Guid> RegisterItem(RegisteredItemDto registeredItemDto)
        {
            var itemType = await _unitOfWork.ItemTypes.GetItemTypeByName(registeredItemDto.Type);
            var itemState = await _unitOfWork.States.GetStateByName(registeredItemDto.State);
            Guid currentItemId = Guid.NewGuid();
            Item itemToRegister = new Item
            {
                Id = currentItemId,
                Title = registeredItemDto.Title,
                EstimatedHours = registeredItemDto.EstimatedHours,
                Effort = registeredItemDto.EffortValue,
                Priority = registeredItemDto.Priority,
                ItemTypeId = itemType.Id,
                StateId = itemState.Id
            };
            var isItemRegistered = await _unitOfWork.Items.Register(itemToRegister);
            if(isItemRegistered == 1)
            {
                return await Task.FromResult(currentItemId);
            }
            return await Task.FromResult(Guid.Empty);
        }

        public async Task<int> UpdateItem(ItemDetailsDto itemDetailsDto)
        {
            var itemType = await _unitOfWork.ItemTypes.GetItemTypeByName(itemDetailsDto.Type);
            var itemState = await _unitOfWork.States.GetStateByName(itemDetailsDto.State);
            var itemMemberId = Guid.Empty;
            if(itemDetailsDto.AssignedName != null)
            {
                var itemMember = await _unitOfWork.TeamMembers.GetMemberByName(itemDetailsDto.AssignedName);
                itemMemberId = itemMember.Id;
            }
            Item itemToUpdate = null;
            if(itemDetailsDto.AssignedName != null)
            {
                itemToUpdate = new Item
                {
                    Id = itemDetailsDto.Id,
                    Title = itemDetailsDto.Title,
                    EstimatedHours = itemDetailsDto.EstimatedHours,
                    Effort = itemDetailsDto.EstimatedEffort,
                    Priority = itemDetailsDto.Priority,
                    ActualHours = itemDetailsDto.ActualHours,
                    ItemTypeId = itemType.Id,
                    StateId = itemState.Id,
                    TeamMemberId = itemMemberId
                };
            }
            else
            {
                itemToUpdate = new Item
                {
                    Id = itemDetailsDto.Id,
                    Title = itemDetailsDto.Title,
                    EstimatedHours = itemDetailsDto.EstimatedHours,
                    Effort = itemDetailsDto.EstimatedEffort,
                    Priority = itemDetailsDto.Priority,
                    ActualHours = itemDetailsDto.ActualHours,
                    ItemTypeId = itemType.Id,
                    StateId = itemState.Id,
                };
            }
            
            return await _unitOfWork.Items.Update(itemToUpdate);
        }

        public async Task<int> UpdateStateOfItem(Guid itemId, string newState)
        {
            var currentItem = await _unitOfWork.Items.GetById(itemId);
            var currentState = await _unitOfWork.States.GetStateByName(newState);
            currentItem.State = currentState;
            return await _unitOfWork.Items.Update(currentItem);
        }

        public async Task<int> SetSprintOfItem(Guid itemId)
        {
            using (var transaction = _unitOfWork.BeginTransaction())
            {
                try
                {
                    var isTransactionSucceeded = true;
                    var currentItem = await _unitOfWork.Items.GetById(itemId);
                    var currentSprint = await _unitOfWork.Sprints.GetCurrentSprint();
                    currentItem.SprintId = currentSprint.Id;
                    var isCurrentItemUpdated = await _unitOfWork.Items.Update(currentItem);
                    if(isCurrentItemUpdated == 0)
                    {
                        isTransactionSucceeded = false;
                    }
                    currentSprint.TotalEstimatedHours += currentItem.EstimatedHours;
                    var isCurrentSprintUpdated = await _unitOfWork.Sprints.Update(currentSprint);
                    if(isTransactionSucceeded == true)
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
        public async Task<int> ClearSprintOfItem(Guid itemId)
        {
            var currentItem = await _unitOfWork.Items.GetById(itemId);
            currentItem.SprintId = null;
            return await _unitOfWork.Items.Update(currentItem);
        }

        public async Task<int> DeleteItem(Guid itemId)
        {
            var currentItem = await _unitOfWork.Items.GetById(itemId);
            return await _unitOfWork.Items.Delete(currentItem);
        }
    }
}
