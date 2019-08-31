using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public bool InsertUser(User user)
        {
            try
            {
                List<SqlParameter> parameterList = new List<SqlParameter>();
                parameterList.Add(base.GetParameter("UserId", user.Id));
                parameterList.Add(base.GetParameter("UserName", user.UserName));
                parameterList.Add(base.GetParameter("Email", user.Email));
                parameterList.Add(base.GetParameter("PictureLink", user.PictureLink));
                parameterList.Add(base.GetParameter("UserDescription", user.UserDescription));
                parameterList.Add(base.GetParameter("CreatedBy", user.Id));

                base.ExecuteScalar("sp_InsertUser", parameterList);

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
