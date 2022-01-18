using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class ItemType
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public virtual ICollection<Item> Items { get; set; }
    }
}
