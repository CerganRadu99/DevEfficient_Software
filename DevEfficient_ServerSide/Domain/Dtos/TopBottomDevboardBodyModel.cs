using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Dtos
{
    public class TopBottomDevboardBodyModel
    {
        public List<Guid> ItemIds { get; set; }
        public Guid ItemId { get; set; }

        public string Option { get; set; }
    }
}
