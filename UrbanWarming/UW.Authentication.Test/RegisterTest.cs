using Microsoft.VisualStudio.TestTools.UnitTesting;
using UW.Authentication.Logics;

namespace UW.Authentication.Test
{
    [TestClass]
    public class Register
    {
        [TestMethod]
        public void Register_Test_Sample()
        {
            string result = UwLogics.Register("Brian","test@test.com","test");
            UwLogics.Delete(result);
            Assert.AreNotEqual(result,null);
        }

        [TestMethod]
        public void Register_Test_Duplicate()
        {
            string firstid = UwLogics.Register("Brian", "test@test.com", "test");
            string result = UwLogics.Register("Brian", "test@test.com", "test");
            UwLogics.Delete(firstid);
            Assert.AreEqual(result, null);
        }

        [TestMethod]
        public void Register_Test_EmptyUserName()
        {
            string result = UwLogics.Register("", "test@test.com", "test");
            UwLogics.Delete(result);
            Assert.AreEqual(result, null);
        }

        [TestMethod]
        public void Register_Test_NullUserName()
        {
            string result = UwLogics.Register(null, "test@test.com", "test");
            UwLogics.Delete(result);
            Assert.AreEqual(result, null);
        }

        [TestMethod]
        public void Register_Test_EmptyEmail()
        {
            string result = UwLogics.Register("Brian", "", "test");
            UwLogics.Delete(result);
            Assert.AreEqual(result, null);
        }

        [TestMethod]
        public void Register_Test_NullEmail()
        {
            string result = UwLogics.Register("Brian", null, "test");
            UwLogics.Delete(result);
            Assert.AreEqual(result, null);
        }

        [TestMethod]
        public void Register_Test_EmptyPassword()
        {
            string result = UwLogics.Register("Brian", "test@test.com", "");
            UwLogics.Delete(result);
            Assert.AreEqual(result, null);
        }

        [TestMethod]
        public void Register_Test_NullPassword()
        {
            string result = UwLogics.Register("Brian", "test@test.com", null);
            UwLogics.Delete(result);
            Assert.AreEqual(result, null);
        }
    }
}
