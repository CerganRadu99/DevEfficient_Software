using Domain.Dtos;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Core
{
    public interface ITeamMemberRepository: IRepository<TeamMember>
    {
        Task<IEnumerable<RetrievedTeamMemberDto>> GetFullTeamMember();
        Task<TeamMember> GetMemberByName(string memberName);
    }
}
