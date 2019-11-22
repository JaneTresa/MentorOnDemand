using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using mentor.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace mentor.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class mentorController : ControllerBase
    {
        mentorContext obj = new mentorContext();

        [HttpPost]
        public void Post([FromBody] Mentor details)
        {
            obj.Database.ExecuteSqlCommand("mentor_reg '" + details.Mname+"'"+","+"'"+ details.UserName + "'" + "," + "'" + details.LinkedinUrl + "'" + "," + "'" + details.RedDatetime + "'" + "," +details.YearsOfExperience + "," + "'" + details.Password + "'");
        }

        [HttpGet("{Email}")]
        public Mentor getUser(string Email)
        {
            try
            {
                return obj.Mentor.FromSql("mentor_login'" + Email + "'").Single();
            }
            catch (Exception e)
            {
                return null;
            }
        }

       

        [HttpGet]
        [Route("GetEmails")]
        public IEnumerable<string> GetEmails()
        {
            List<Mentor> list = obj.Mentor.ToList();
            List<string> emails = new List<string>();
            foreach (Mentor user in list)
            {
                emails.Add(user.UserName);
            }
            return emails;
        }


        [HttpGet]
        [Route("GetMentorHome/{mentorid}")]
        public IEnumerable<Mentorhome> Get(int mentorid)
        {
            return obj.Mentorhome.FromSql("mentorhome "+mentorid).ToList();
        }

        [HttpPost]
        [Route("AddSkill/{mid}")]
        public void newSkill(int mid,[FromBody] MentorSkills details)
        {
            obj.Database.ExecuteSqlCommand("addskill " + mid + "," + details.SkId + "," + details.MsSelfRating + "," + details.MsYearsOfExperience + "," + details.MsTrainingDelivered + "," + "'" + details.MsFacilitiesOffered + "'");
            obj.MentorSkills.Add(details);
            
        }

        [HttpGet]
        [Route("GetSkills")]
        public IEnumerable<Skills> Get()
        {
            return obj.Skills.FromSql("getSkills ").ToList();
        }
    }
}