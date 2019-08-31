using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;
using UW.BusinessLogic.DTOs;
using UW.BusinessLogic.Logics;

namespace UW.BusinessLogic.Test
{
    [TestClass]
    public class InsertUser
    {
        [TestMethod]
        public void InsertUser_Success()
        {
            UserDTO user = new UserDTO(DateTime.Now.ToString(),"username","email","picture","description",1);
            var result = UserLogics.InsertUser(user);
            Assert.AreEqual(true,result);
        }

        [TestMethod]
        public void InsertUser_Duplicate()
        {
            UserDTO user = new UserDTO("duplicate", "username", "email", "picture", "description", 1);
            UserLogics.InsertUser(user);
            var result = UserLogics.InsertUser(user);
            Assert.AreEqual(false, result);
        }
    }
}
