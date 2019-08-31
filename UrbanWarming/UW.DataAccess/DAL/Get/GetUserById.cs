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
        public User GetUserById(string userid)
        {
            try
            {
                List<SqlParameter> parameterList = new List<SqlParameter>();
                parameterList.Add(base.GetParameter("UserId", userid));

                DataTable dt = base.GetDataTable("sp_GetUserById", parameterList);

                User result = null;

                foreach (DataRow dr in dt.Rows)
                {
                    result = new User(
                            dr["Id"].ToString(),
                            dr["UserName"].ToString(),
                            dr["Email"].ToString(),
                            dr["PictureLink"].ToString(),
                            dr["UserDescription"].ToString(),
                            Convert.ToInt32(dr["CountryId"].ToString())
                            );
                }

                return result;
            }
            catch
            {
                return null;
            }
        }
    }
}
