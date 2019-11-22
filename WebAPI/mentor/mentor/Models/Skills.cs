using System;
using System.Collections.Generic;

namespace mentor.Models
{
    public partial class Skills
    {
        public Skills()
        {
            MentorSkills = new HashSet<MentorSkills>();
            Training = new HashSet<Training>();
        }

        public int SkId { get; set; }
        public string SkName { get; set; }
        public string SkToc { get; set; }
        public int SkDuration { get; set; }
        public string SkPrerequistes { get; set; }

        public ICollection<MentorSkills> MentorSkills { get; set; }
        public ICollection<Training> Training { get; set; }
    }
}
