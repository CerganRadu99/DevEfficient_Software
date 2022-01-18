using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class Sprint
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Goal { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int? TotalWorkedHours { get; set; }
        public virtual ICollection<Item> Items { get; set; }
    }
}
