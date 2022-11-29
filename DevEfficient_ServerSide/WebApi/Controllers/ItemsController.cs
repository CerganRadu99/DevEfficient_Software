using Application.Interfaces;
using Domain.Dtos;
using Domain.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Dtos;
using WebApi.Validation;

namespace WebApi.Controllers
{
    public class ItemsController : BaseController
    {
        private readonly IItemService _itemService;

        public ItemsController(IItemService itemService)
        {
            _itemService = itemService;
        }

        [HttpPost]
        [Route("")]
        public ActionResult<ResponseDto<IEnumerable<RetrievedItemDto>>> GetItems([FromBody] GetItemsBodyModel getItemsBodyModel)
        {
            var items = _itemService.GetAll(getItemsBodyModel).Result;
            return HandleResponse(items);
        }

        [HttpPost]
        [Route("topBottomDevboard")]
        public ActionResult<ResponseDto<List<Guid>>> GetItemsTopBottomDevboard([FromBody] TopBottomDevboardBodyModel topBottomDevBodyModel)
        {
            List<Guid> itemIds = _itemService.ReorderItemsTopBottomDevboard(topBottomDevBodyModel);
            return HandleResponse(itemIds);
        }

        [HttpPost]
        [Route("itemsOrder")]
        public ActionResult<ResponseDto> ChangeItemsOrderInCache([FromBody] NewItemsOrderModel newItemsOrderModel)
        {
            var response = _itemService.ChangeItemsOrderInCache(newItemsOrderModel);
            if (response)
            {
                return HandleResponse();
            }
            else
            {
                return HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }

        [HttpPut]
        [Route("update/{itemId}")]
        public ActionResult<ResponseDto> UpdateItem([FromRoute] Guid itemId, [FromBody] ItemDetailsDto itemDetailsDto)
        {
            var response = _itemService.UpdateItem(itemDetailsDto).Result;
            if (response == 1)
            {
                return HandleResponse();
            }
            else
            {
                return HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }

        [HttpPut]
        [Route("updateState/{itemId}")]
        public ActionResult<ResponseDto> UpdateStateOfItem([FromRoute] Guid itemId, [FromBody] UpdateStateOfItemModel updateStateOfItemModel)
        {
            var response = _itemService.UpdateStateOfItem(itemId, updateStateOfItemModel.State).Result;
            if (response == 1)
            {
                return HandleResponse();
            }
            else
            {
                return HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }

        [HttpGet]
        [Route("{itemId}")]
        public ActionResult<ResponseDto<ItemDetailsDto>> GetItem([FromRoute] Guid itemId)
        {
            var item = _itemService.GetItem(itemId).Result;
            return HandleResponse(item);
        }

        [HttpPost]
        [Route("register")]
        public ActionResult<ResponseDto<RegisteredItemReturnModel>> RegisterItem([FromBody] RegisteredItemDto registeredItemDto)
        {
            var response = _itemService.RegisterItem(registeredItemDto).Result;
            if (response != Guid.Empty)
            {
                return HandleResponse<RegisteredItemReturnModel>(new RegisteredItemReturnModel { 
                    ItemId =  response
                });
            }
            else
            {
                return HandleResponse<RegisteredItemReturnModel>(null, DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }

        [HttpPut]
        [Route("setSprint/{itemId}")]
        public ActionResult<ResponseDto> SetSprintOfItem([FromRoute] Guid itemId)
        {
            var response = _itemService.SetSprintOfItem(itemId).Result;
            if (response == 1)
            {
                return HandleResponse();
            }
            else
            {
                return HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }


        [HttpPut]
        [Route("clearSprint/{itemId}")]
        public ActionResult<ResponseDto> ClearSprintOfItem([FromRoute] Guid itemId)
        {
            var response = _itemService.ClearSprintOfItem(itemId).Result;
            if (response == 1)
            {
                return HandleResponse();
            }
            else
            {
                return HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }

        [HttpDelete]
        [Route("delete/{itemId}")]
        public ActionResult<ResponseDto> DeleteItem([FromRoute] Guid itemId)
        {
            var response = _itemService.DeleteItem(itemId).Result;
            if(response == 1)
            {
                return HandleResponse();
            }
            else
            {
                return HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }
    }
}
