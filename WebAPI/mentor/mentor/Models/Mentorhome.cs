using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace mentor.Models
{
    public class Mentorhome
    {
        [Key]
        public int training_Id { get; set; }
        public int UserId { get; set; }
        public int mentor_Id { get; set; }
        public int Skill_Id { get; set; }
        public string Status { get; set; }
        public string mentor_Name { get; set; }
        public string First_Name { get; set; }
        public string skill_Name { get; set; }
    }
}
