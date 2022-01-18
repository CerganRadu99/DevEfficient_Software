using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Dtos
{
    public class ItemDetailsDto
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public int EstimatedHours {get; set;}
        public string EstimatedEffort { get; set; }
        public string Priority { get; set; }
        public string State { get; set; }
        public string Type { get; set; }

        public int ActualHours { get; set; }
        public string? SprintName { get; set; }

        public string? AssignedName { get; set; }
    }
}
