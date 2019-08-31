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
        public static bool DeleteUser(string id)
        {
            try
            {
                UWDataAccess da = new UWDataAccess();
                return da.DeleteUser(id);
            }
            catch
            {
                return false;
            }
        }
    }
}
