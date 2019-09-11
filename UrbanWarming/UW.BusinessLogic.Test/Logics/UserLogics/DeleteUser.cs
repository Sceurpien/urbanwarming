using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using UW.BusinessLogic.DTOs;
using UW.BusinessLogic.Logics;

namespace UW.BusinessLogic.Test
{
    [TestClass]
    public class DeleteUser
    {

        [TestMethod]
        public void DeleteUser_Success()
        {
            string id = DateTime.Now.ToString();
            UserDTO user = new UserDTO(id, "willbedeleted", "email", "pic", "i will be deleted soon", 1);
            UserLogics.InsertUser(user);

            bool deleteResult = UserLogics.DeleteUser(id);

            Assert.AreEqual(true, deleteResult);
        }

        [TestMethod]
        public void DeleteUser_UserNotExists()
        {
            string id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";

            bool deleteResult = UserLogics.DeleteUser(id);

            Assert.AreEqual(true, deleteResult);
        }
    }
}
