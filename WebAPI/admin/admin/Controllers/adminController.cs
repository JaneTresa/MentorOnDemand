using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using admin.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class adminController : ControllerBase
    {
        mentorContext obj = new mentorContext();

        [HttpGet("{Email}")]
        public Admin getUser(string Email)
        {
            try
            {
                return obj.Admin.FromSql("admin_login'" + Email + "'").Single();
            }
            catch (Exception e)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("getSkills")]
        public IEnumerable<Skills> getSkills()

        {
            try
            {
                return obj.Skills.FromSql("get_skills").ToList();
            }
            catch (Exception e)
            {
                return null;
            }
        }


    }
}