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
    public class TeamMembersController: BaseController
    {
        private readonly ITeamMemberService _teamMemberService;
        public TeamMembersController(ITeamMemberService teamMemberService)
        {
            _teamMemberService = teamMemberService;
        }

        [HttpGet]
        [Route("")]
        public ActionResult<ResponseDto<IEnumerable<RetrievedTeamMemberDto>>> GetItems()
        {
            var teamMembers = _teamMemberService.GetAll().Result;
            return HandleResponse(teamMembers);
        }

        [HttpPost]
        [Route("register")]
        public ActionResult<ResponseDto> RegisterMember([FromBody] RegisteredMemberDto registeredMemberDto)
        {
            var response = _teamMemberService.RegisterMember(registeredMemberDto).Result;
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
