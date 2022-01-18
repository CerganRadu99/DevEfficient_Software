using Application.Interfaces;
using Domain.Core;
using Domain.Dtos;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Application.Services
{
    public class TeamMemberService: ITeamMemberService
    {
        private readonly IUnitOfWork _unitOfWork;

        public TeamMemberService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IEnumerable<RetrievedTeamMemberDto>> GetAll()
        {
            return await _unitOfWork.TeamMembers.GetFullTeamMember();
        }
        public async Task<int> RegisterMember(RegisteredMemberDto registeredMemberDto)
        {
            var teamMemberRole = await _unitOfWork.TeamMemberRoles.GetRoleByName(registeredMemberDto.Role);
            TeamMember memberToRegister = new TeamMember
            {
                Id = Guid.NewGuid(),
                Name = registeredMemberDto.Name,
                Email = registeredMemberDto.Email,
                TeamMemberRoleId = teamMemberRole.Id,
                TeamId = Guid.Parse("A36E247A-94D7-481A-AF42-C5CB187935AF")
            };
            return await _unitOfWork.TeamMembers.Register(memberToRegister);
        }

    }
}
