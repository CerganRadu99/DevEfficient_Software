using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class Team
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public virtual ICollection<TeamMember> TeamMembers { get; set; }
    }
}
