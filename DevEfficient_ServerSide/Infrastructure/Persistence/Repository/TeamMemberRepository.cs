using Domain.Core;
using Domain.Dtos;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Persistence.Repository
{
    public class TeamMemberRepository : Repository<TeamMember>, ITeamMemberRepository
    {
        public TeamMemberRepository(DevEfficientDbContext dbContext) : base(dbContext) { }
        public async Task<IEnumerable<RetrievedTeamMemberDto>> GetFullTeamMember()
        {
            return await this._dbSet.Include(tm => tm.TeamMemberRole)
                .Select(member => new RetrievedTeamMemberDto
                {
                    Id = member.Id,
                    Name = member.Name,
                    Email = member.Email,
                    Role = member.TeamMemberRole.Name
                }).ToListAsync();
        }
        public async Task<TeamMember> GetMemberByName(string memberName)
        {
            return await this._dbSet.FirstOrDefaultAsync(tMember => tMember.Name.ToLower().Equals(memberName.ToLower()));
        }
    }
}
