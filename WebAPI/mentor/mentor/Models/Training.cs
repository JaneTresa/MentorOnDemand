using System;
using System.Collections.Generic;

namespace mentor.Models
{
    public partial class Training
    {
        public int TrId { get; set; }
        public int? TrUId { get; set; }
        public int? TrMId { get; set; }
        public int? TrSId { get; set; }
        public string TrStatus { get; set; }

        public Mentor TrM { get; set; }
        public Skills TrS { get; set; }
        public UserDetails TrU { get; set; }
    }
}
