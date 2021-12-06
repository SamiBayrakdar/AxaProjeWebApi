using System;
using System.Collections.Generic;

#nullable disable

namespace AxaProje.Data.Models
{
    public partial class ActionLog
    {
        public int Id { get; set; }
        public DateTime? Date { get; set; }
        public string AcLog { get; set; }
        public string ActionInfo { get; set; }
    }
}
