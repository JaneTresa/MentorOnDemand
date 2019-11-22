using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using user.Models;

namespace user.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class userController : ControllerBase
    {
        mentorContext obj = new mentorContext();

        [HttpPost]
        public void Post([FromBody] UserDetails details)
        {
            obj.Database.ExecuteSqlCommand("user_reg '" + details.Email + "'" + "," + "'" + details.Pass + "'" + "," + "'" + details.FirstName + "'" + "," + "'" + details.LastName + "'" + "," + "'" + details.Contact + "'" + "," + "'" + details.RegDatetime + "'");
        }

        [HttpGet("{Email}")]
        public UserDetails getUser(string Email)
        {
            try
            {
                return obj.UserDetails.FromSql("user_login'" + Email + "'").Single();
            }
            catch (Exception e)
            {
                return null;
            }
        }

        //[HttpGet]
        //public IEnumerable<UserDetails> get()
        //{
        //    return obj.UserDetails.FromSql("userDetails").ToList();
        //}

        [HttpGet]
        [Route("GetEmails")]
        public IEnumerable<string> GetEmails()
        {
            List<UserDetails> list = obj.UserDetails.ToList();
            List<string> emails = new List<string>();
            foreach (UserDetails user in list)
            {
                emails.Add(user.Email);
            }
            return emails;
        }

        [HttpGet]
        [Route("GetContact")]
        public IEnumerable<long> GetContact()
        {
            List<UserDetails> list = obj.UserDetails.ToList();
            List<long> contact = new List<long>();
            foreach (UserDetails user in list)
            {
                contact.Add(user.Contact);
            }
            return contact;
        }

        [HttpGet]
        public IEnumerable<Training> get()
        {
            return obj.Training.FromSql("Details").ToList();
        }

        [HttpGet]
        [Route("GetMentorDetails")]
        public IEnumerable<Userhome> Get()
        {
            try
            {
                return obj.Userhome.FromSql("userhome").ToList();
            }
            catch (Exception e)
            {
                return null;
            }
        }

        [HttpPost("{tr_uId}/{tr_mId}/{tr_sId}")]
        public void Post(int tr_uId,int tr_mId, int tr_sId)
        {
            obj.Database.ExecuteSqlCommand("changeStatus "+ tr_uId+","+ tr_mId+","+ tr_sId);
        }
    }
}