using System;
using System.Collections.Generic;

namespace user.Models
{
    public partial class Mentor
    {
        public Mentor()
        {
            MentorSkills = new HashSet<MentorSkills>();
            Training = new HashSet<Training>();
        }

        public int Mid { get; set; }
        public string Mname { get; set; }
        public string UserName { get; set; }
        public string LinkedinUrl { get; set; }
        public DateTime? RedDatetime { get; set; }
        public long? RegCode { get; set; }
        public int? YearsOfExperience { get; set; }
        public string Active { get; set; }
        public string Password { get; set; }

        public ICollection<MentorSkills> MentorSkills { get; set; }
        public ICollection<Training> Training { get; set; }
    }
}
