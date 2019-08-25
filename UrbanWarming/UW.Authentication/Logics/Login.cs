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
        public static string Login(string userName, string password)
        {
            User user = DataAccess.GetUser(userName).Result;

            if (!ConfirmPassword(password, Encoding.Unicode.GetBytes(user.HashedPassword), user.Salt))
                return null;
            return CreateJwtToken(CreateJwtForLogin(user).ToString());
        }

        public static Jwt CreateJwtForLogin(User user)
        {
            try
            {
                string refreshToken = UwLogics.RandomString(30);
                user.RefreshToken = refreshToken;
                user.Valid = DateTime.Now.AddMonths(3);
                user.LastLogin = DateTime.Now;
                var r = DataAccess.UpdateUser(user);
                var result = new Jwt
                {
                    id = user.Id,
                    refreshToken = refreshToken,
                    valid = DateTime.Now.AddMinutes(15)
                };
                return result;
            }
            catch
            {
                return null;
            }
            
        }
    }
}