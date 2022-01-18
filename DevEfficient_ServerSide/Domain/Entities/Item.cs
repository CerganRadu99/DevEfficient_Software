using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class Item
    {
        public Guid Id { get; set; }

        public string Title { get; set; }
        public int ActualHours { get; set; }
        public int EstimatedHours { get; set; }
        public string Effort { get; set; }
        public string Priority { get; set; }
        public Guid? SprintId { get; set; }
        public Guid StateId { get; set; }
        public Guid ItemTypeId { get; set; }
        public Guid? TeamMemberId { get; set; }
        public Sprint Sprint { get; set; }
        public State State { get; set; }
        public ItemType ItemType { get; set; }
        public TeamMember TeamMember { get; set; }
    }
}
