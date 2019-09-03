using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public User GetUserByEmail(string email)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(base.GetParameter("Email", email));

                DataTable dt = base.GetDataTable("sp_GetUserByEmail", parameters);

                return GetUserFromDataTable(dt);
            }
            catch
            {
                return null;
            }
        }
    }
}
