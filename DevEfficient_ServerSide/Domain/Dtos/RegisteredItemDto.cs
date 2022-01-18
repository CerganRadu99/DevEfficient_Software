using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Dtos
{
    public class RegisteredItemDto
    {
        public string Title { get; set; }
        public int EstimatedHours { get; set; }
        public string EffortValue { get; set; }
        public string Priority { get; set; }
        public string State { get; set; }
        public string Type { get; set; }

    }
}
