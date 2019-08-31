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
        public bool DeleteUser(string userid)
        {
            try
            {
                List<SqlParameter> parameterList = new List<SqlParameter>();
                parameterList.Add(base.GetParameter("UserId", userid));

                base.ExecuteScalar("sp_DeleteUser", parameterList);

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
