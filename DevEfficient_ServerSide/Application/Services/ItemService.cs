using Application.Interfaces;
using Domain.Core;
using Domain.Dtos;
using Domain.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class ItemService : IItemService
    {
        private readonly IUnitOfWork _unitOfWork;

        public ItemService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IEnumerable<RetrievedItemDto>> GetAll()
        {
            return await _unitOfWork.Items.GetFullItems();
        }

        public async Task<ItemDetailsDto> GetItem(Guid itemId)
        {
            return await _unitOfWork.Items.GetFullItem(itemId);
        }

        public async Task<int> RegisterItem(RegisteredItemDto registeredItemDto)
        {
            var itemType = await _unitOfWork.ItemTypes.GetItemTypeByName(registeredItemDto.Type);
            var itemState = await _unitOfWork.States.GetStateByName(registeredItemDto.State);
            Item itemToRegister = new Item
            {
                Id = Guid.NewGuid(),
                Title = registeredItemDto.Title,
                EstimatedHours = registeredItemDto.EstimatedHours,
                Effort = registeredItemDto.EffortValue,
                Priority = registeredItemDto.Priority,
                ItemTypeId = itemType.Id,
                StateId = itemState.Id
            };
            return await _unitOfWork.Items.Register(itemToRegister);
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
            Item itemToUpdate = new Item
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
            return await _unitOfWork.Items.Update(itemToUpdate);
        }
    }
}
