using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class TeamMember
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public Guid TeamMemberRoleId { get; set; }
        public Guid TeamId { get; set; }

        public string Email { get; set; }
        public TeamMemberRole TeamMemberRole { get; set; }
        public Team Team { get; set; }
        public virtual ICollection<Item> Items { get; set; }
    }
}
