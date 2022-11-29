using Application.Interfaces;
using Domain.Dtos;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Dtos;
using WebApi.Validation;

namespace WebApi.Controllers
{
    public class SprintsController : BaseController
    {
        private readonly ISprintService _sprintService;
        public SprintsController(ISprintService sprintService)
        {
            _sprintService = sprintService;
        }

        [HttpGet]
        [Route("currentSprint")]
        public ActionResult<ResponseDto<RetrievedCurrentSprint>> GetCurrentActivatedSprint()
        {
            var response = _sprintService.GetCurrentActivatedSprint().Result; 
            if(response == null)
            {
                return HandleResponse(response, new List<string>() {"There is no active sprint"});
            }
            return HandleResponse(response);
        }

        [HttpPut]
        [Route("close/currentSprint")]
        public ActionResult<ResponseDto> CloseCurrentSprint()
        {
            var response = _sprintService.CloseCurrentActivatedSprint().Result;
            if (response == 0)
            {
                return HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
            return HandleResponse();
        }

        [HttpGet]
        [Route("items")]
        public ActionResult<ResponseDto<List<RetrievedItemDto>>> GetCurrentSprintItems()
        {
            var response = _sprintService.GetCurrentSprintItems();
            if(response == null)
            {
                return HandleResponse(response, new List<string>() { "There is no active sprint" });
            }
            return HandleResponse(response);
        }

        [HttpPost]
        [Route("register")]
        public ActionResult<ResponseDto<RegisteredSprintReturnModel>> RegisterSprint([FromBody] RegisteredSprintDto registeredItemDto)
        {
            var response = _sprintService.RegisterSprint(registeredItemDto).Result;
            if (response != Guid.Empty)
            {
                return HandleResponse<RegisteredSprintReturnModel>(new RegisteredSprintReturnModel { 
                    SprintId = response
                });
            }
            else
            {
                return HandleResponse<RegisteredSprintReturnModel>(null, DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }

        [HttpPost]
        [Route("activate")]
        public ActionResult<ResponseDto> ActivateSprint([FromBody] RegisteredSprintDto registeredItemDto)
        {
            var response = _sprintService.ActivateSprint(registeredItemDto).Result;
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
        [Route("delete")]
        public ActionResult<ResponseDto> DeleteCurrentSprint()
        {
            var response = _sprintService.DeleteCurrentSprint().Result;
            if (response == 1)
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
