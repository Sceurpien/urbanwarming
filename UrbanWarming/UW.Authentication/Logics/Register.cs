using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using UW.Authentication.Models;

namespace UW.Authentication.Logics
{
    public partial class UwLogics
    {
        public static string Register(string userName, string email, string password)
        {
            if (userName == null)
                return null;
            if (userName.Length == 0)
                return null;
            if (email == null)
                return null;
            if (email.Length < 5)
                return null;
            if (password == null)
                return null;
            if (password.Length < 4)
                return null;

            var check = DataAccess.GetUserByName(userName).Result;
            if (check == null)
            {
                User user = new User();
                user.Salt = UwLogics.RandomString(20);
                user.Name = userName;
                user.Email = email;
                user.HashedPassword = Encoding.UTF8.GetString(UwLogics.Hash(password, user.Salt));
                user.Created = DateTime.Now;
                string id = DataAccess.AddUser(user).Result;
                return id;
            }

            return null;
        }
    }
}