using System;
using System.Collections.Generic;
using System.Text;
using UW.DataAccess.Entities;
using UW.BusinessLogic.DTOs;
using UW.DataAccess.DAL;

namespace UW.BusinessLogic.Logics
{
    public partial class UserLogics
    {
        public static bool InsertUser(UserDTO user)
        {
            try
            {
                UWDataAccess da = new UWDataAccess();
                return da.InsertUser(user.ToUser());
            }
            catch
            {
                return false;
            }
        }
    }
}
