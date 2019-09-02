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
        public User GetUserByName(string userName)
        {
            try
            {
                List<SqlParameter> parameterList = new List<SqlParameter>();
                parameterList.Add(base.GetParameter("UserName", userName));

                DataTable dt = base.GetDataTable("sp_GetUserByName", parameterList);

                return GetUserFromDataTable(dt);
            }
            catch
            {
                return null;
            }
        }
    }
}
