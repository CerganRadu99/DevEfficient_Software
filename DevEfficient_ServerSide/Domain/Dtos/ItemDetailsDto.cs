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
#pragma warning disable CS8632 // The annotation for nullable reference types should only be used in code within a '#nullable' annotations context.
        public string? SprintName { get; set; }
#pragma warning restore CS8632 // The annotation for nullable reference types should only be used in code within a '#nullable' annotations context.

#pragma warning disable CS8632 // The annotation for nullable reference types should only be used in code within a '#nullable' annotations context.
        public string? AssignedName { get; set; }
#pragma warning restore CS8632 // The annotation for nullable reference types should only be used in code within a '#nullable' annotations context.
    }
}
