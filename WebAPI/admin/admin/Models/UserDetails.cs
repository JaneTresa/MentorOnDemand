using System;
using System.Collections.Generic;

namespace admin.Models
{
    public partial class UserDetails
    {
        public UserDetails()
        {
            Training = new HashSet<Training>();
        }

        public int UserId { get; set; }
        public string Email { get; set; }
        public string Pass { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public long Contact { get; set; }
        public DateTime RegDatetime { get; set; }
        public long? RegCode { get; set; }
        public string ForceResetPassword { get; set; }
        public string Active { get; set; }

        public ICollection<Training> Training { get; set; }
    }
}
