using mentor.Controllers;
using mentor.Models;
using NUnit.Framework;
using System.Collections.Generic;

namespace Tests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void GetAllSkillsCorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new mentorController();

            var result = controller.Get() as List<Skills>;
            Assert.AreEqual(3, result.Count);
        }
        [Test]
        public void GetAllSkillsIncorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new mentorController();

            var result = controller.Get() as List<Skills>;
            Assert.AreEqual(6, result.Count);
        }
    }
}
