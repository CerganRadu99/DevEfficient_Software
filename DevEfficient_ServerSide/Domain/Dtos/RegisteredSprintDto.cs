using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Dtos
{
    public class RegisteredSprintDto
    {
        public string Title { get; set; }
        public string Goal { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public List<Guid> ItemIds { get; set; }
    }
}
