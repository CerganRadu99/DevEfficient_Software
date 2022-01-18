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


        [HttpPost]
        [Route("register")]
        public ActionResult<ResponseDto> RegisterSprint([FromBody] RegisteredSprintDto registeredItemDto)
        {
            var response = _sprintService.RegisterSprint(registeredItemDto).Result;
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
