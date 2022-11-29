using Domain.Entities;

namespace Domain.Core
{
    public interface IUnitOfWork
    {
        IItemRepository Items { get; }
        IItemTypeRepository ItemTypes { get; }
        ITeamMemberRoleRepository TeamMemberRoles { get; }
        ISprintRepository Sprints { get; }
        IStateRepository States { get; }
        IRepository<Team> Teams { get; }
        ITeamMemberRepository TeamMembers { get; }
        IDatabaseTransaction BeginTransaction();
    }
}
