using System;
using System.Collections.Generic;

namespace admin.Models
{
    public partial class MentorSkills
    {
        public int MsId { get; set; }
        public int? Mid { get; set; }
        public int? SkId { get; set; }
        public decimal? MsSelfRating { get; set; }
        public int? MsYearsOfExperience { get; set; }
        public int? MsTrainingDelivered { get; set; }
        public string MsFacilitiesOffered { get; set; }

        public Mentor M { get; set; }
        public Skills Sk { get; set; }
    }
}
