using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Dtos
{
    public class RetrievedCurrentSprint
    {
        public Guid? Id { get; set; }
        public string Title { get; set; }
        public string Goal { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int TotalEstimatedHours { get; set; }
        public List<RetrievedItemDto> SprintItems {get; set;}
    }
}
