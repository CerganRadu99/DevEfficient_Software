using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Core
{
    public interface ITeamMemberRoleRepository : IRepository<TeamMemberRole>
    {
        public Task<TeamMemberRole> GetRoleByName(string roleName);
    }
}
