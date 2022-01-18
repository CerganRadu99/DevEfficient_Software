using Domain.Core;
using Domain.Entities;
using Infrastructure.Persistence.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Text;

namespace Infrastructure.Persistence
{
    public class UnitOfWork : IUnitOfWork
    {
        public readonly DevEfficientDbContext _dbContext;
        public UnitOfWork(DevEfficientDbContext dbContext)
        {
            this._dbContext = dbContext;
            this.Items = new ItemRepository(_dbContext);
            this.ItemTypes = new ItemTypeRepository(_dbContext);
            this.TeamMemberRoles = new TeamMemberRoleRepository(_dbContext);
            this.Sprints = new SprintRepository(_dbContext);
            this.States = new StateRepository(_dbContext);
            this.Teams = new Repository<Team>(_dbContext);
            this.TeamMembers = new TeamMemberRepository(_dbContext);
        }
        public IItemRepository Items { get; }
        public IItemTypeRepository ItemTypes { get; }
        public ITeamMemberRoleRepository TeamMemberRoles { get; }
        public IRepository<Sprint> Sprints { get; }
        public IStateRepository States { get; }
        public IRepository<Team> Teams { get; }
        public ITeamMemberRepository TeamMembers { get; }

        public IDatabaseTransaction BeginTransaction()
        {
            return new EntityDatabaseTransaction(_dbContext);
        }
    }
}
