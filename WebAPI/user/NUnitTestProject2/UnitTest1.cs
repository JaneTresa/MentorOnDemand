using NUnit.Framework;
using System.Collections.Generic;
using user.Controllers;
using user.Models;

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
            var controller = new userController();

            var result = controller.get() as List<Training>;
            Assert.AreEqual(8, result.Count);
        }
        [Test]
        public void GetAllSkillsIncorrect()
        {
            //var testProducts = GetTestProducts();
            var controller = new userController();

            var result = controller.get() as List<Training>;
            Assert.AreEqual(8, result.Count);
        }
    }
}
