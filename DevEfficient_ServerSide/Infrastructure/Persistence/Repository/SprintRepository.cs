using Domain.Core;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Infrastructure.Persistence.Repository
{
    public class SprintRepository : Repository<Sprint>, ISprintRepository
    {
        public SprintRepository(DevEfficientDbContext dbContext) : base(dbContext) { }
    }
}
