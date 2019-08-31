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
        public static bool Delete(string id)
        {
            return DataAccess.DeleteUser(id).Result;
        }
    }
}