using Domain.Core;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Persistence.Repository
{
    public class StateRepository : Repository<State>, IStateRepository
    {
        public StateRepository(DevEfficientDbContext dbContext) : base(dbContext) { }

        public async Task<State> GetStateByName(string stateName)
        {
            return await this._dbSet.FirstOrDefaultAsync(state => state.Name.ToLower().Equals(stateName.ToLower()));
        }
    }
}
