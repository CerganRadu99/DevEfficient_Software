using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Dtos
{
    public class RetrievedItemDto
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Priority { get; set; }
        public int EstimatedHours { get; set; }
        public string Effort { get; set; }
        public string State { get; set; }
        public string Type { get; set; }
    }
}
