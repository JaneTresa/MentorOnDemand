using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace user.Models
{
    public class Userhome
    {
        [Key]
        public int mid { get; set; }
        public int ms_Id { get; set; }
        public int sk_Id { get; set; }
        public string men_Name { get; set; }
        public string user_Name { get; set; }
        public string lin_url { get; set; }
        public string name_of_skill { get; set; }
        public int skill_exp { get; set; }

        public int trainings_delivered { get; set; }

    }
}
