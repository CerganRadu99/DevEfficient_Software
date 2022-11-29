using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Dtos
{
    public class GetItemsBodyModel
    {
        public string SearchTerm { get; set; }
        public string FilterField { get; set; }
        public string FilterValue { get; set; }
    }
}
