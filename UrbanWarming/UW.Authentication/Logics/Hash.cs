using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace UW.Authentication.Logics
{
    public partial class UwLogics
    {
        public static byte[] Hash(string value, string salt)
        {
            return Hash(Encoding.Unicode.GetBytes(value), Encoding.Unicode.GetBytes(salt));
        }

        public static byte[] Hash(string value, byte[] salt)
        {
            return Hash(Encoding.Unicode.GetBytes(value), salt);
        }

        public static byte[] Hash(byte[] value, byte[] salt)
        {
            byte[] saltedValue = value.Concat(salt).ToArray();
            return new SHA256Managed().ComputeHash(saltedValue);
        }

        public static byte[] Hash(byte[] value)
        {
            return new SHA256Managed().ComputeHash(value);
        }

        public static bool ConfirmPassword(string password, byte[] comparehash, string comparesalt)
        {
            byte[] passwordHash = null;
            if (String.IsNullOrEmpty(comparesalt))
                passwordHash = Hash(Encoding.Unicode.GetBytes(password));
            else
                passwordHash = Hash(password, comparesalt);
            passwordHash = Encoding.Unicode.GetBytes(Encoding.Unicode.GetString(passwordHash));
            var testpass = Encoding.Unicode.GetString(passwordHash);
            return comparehash.SequenceEqual(passwordHash);
        }

        public static bool ConfirmToken(string token, string comparetoken, string salt)
        {
            string tokenhash = Convert.ToBase64String(Hash(token, salt));
            comparetoken = comparetoken.Replace(" ", "+");
            return (tokenhash == comparetoken);
        }
    }
}