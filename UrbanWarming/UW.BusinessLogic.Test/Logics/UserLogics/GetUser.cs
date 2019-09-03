using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;
using UW.BusinessLogic.DTOs;
using UW.BusinessLogic.Logics;

namespace UW.BusinessLogic.Test
{
    [TestClass]
    public class GetUserByName
    {
        private const string userName = "1234567890qwertzuiop";
        private const string userId = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        private const string userEmail = "1234567890qwertzuiop@email.com";

        [TestInitialize]
        public void TestInitialize()
        {
            UserDTO user1 = new UserDTO(userId, userName, userEmail, "picture1", "description1", 1);
            var result1 = UserLogics.InsertUser(user1);
        }

        [TestCleanup]
        public void TestCleanup()
        {
            UserLogics.DeleteUser(userId);
        }

        [TestMethod]
        public void GetUserByName_UserExists_Success()
        {
            UserDTO result = UserLogics.GetUserByName(userName);
            Assert.AreEqual(result.UserName, userName);
        }

        [TestMethod]
        public void GetUserByName_UserNotExist_Invalid()
        {
            UserDTO result = UserLogics.GetUserByName("xxxxxxxxxxxxxxxxqqqwwwzzzzyyyyyyyyyy");
            Assert.AreEqual(null, result);
        }

        [TestMethod]
        public void GetUserByEmail_UserExists_Success()
        {
            UserDTO result = UserLogics.GetUserByEmail(userEmail);
            Assert.AreEqual(result.Id, userId);
        }

        [TestMethod]
        public void GetUserByEmail_UserNotExist_Invalid()
        {
            UserDTO result = UserLogics.GetUserByEmail("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
            Assert.AreEqual(null, result);
        }
    }
}
