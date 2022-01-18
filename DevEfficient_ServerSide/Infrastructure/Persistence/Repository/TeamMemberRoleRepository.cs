using Domain.Core;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Persistence.Repository
{
    public class TeamMemberRoleRepository : Repository<TeamMemberRole>, ITeamMemberRoleRepository
    {
        public TeamMemberRoleRepository(DevEfficientDbContext dbContext) : base(dbContext) { }

        public async Task<TeamMemberRole> GetRoleByName(string roleName)
        {
            return await this._dbSet.FirstOrDefaultAsync(tRole => tRole.Name.ToLower().Equals(roleName.ToLower()));
        }
    }
}
