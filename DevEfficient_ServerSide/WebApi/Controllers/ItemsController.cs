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
        [HttpGet]
        [Route("")]
        public ActionResult<ResponseDto<IEnumerable<RetrievedItemDto>>> GetItems()
        {
            var items = _itemService.GetAll().Result;
            return HandleResponse(items);
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

        [HttpGet]
        [Route("{itemId}")]
        public ActionResult<ResponseDto<ItemDetailsDto>> GetItem([FromRoute] Guid itemId)
        {
            var item = _itemService.GetItem(itemId).Result;
            return HandleResponse(item);
        }

        [HttpPost]
        [Route("register")]
        public ActionResult<ResponseDto> RegisterItem([FromBody] RegisteredItemDto registeredItemDto)
        {
            var response = _itemService.RegisterItem(registeredItemDto).Result;
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
