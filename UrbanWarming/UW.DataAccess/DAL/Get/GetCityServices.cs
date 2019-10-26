using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public CityServices GetCityServices(int cityId)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("CityId", cityId));

                DataTable dt = base.GetDataTable("sp_GetCityServices", parameters);

                return ConvertDataRowToCityServices(dt.Rows[0]);
            }
            catch
            {
                return null;
            }
        }

        private CityServices ConvertDataRowToCityServices(DataRow row)
        {
            int[] values = new int[14];
            values[0] = Convert.ToInt32(row["Education"].ToString());
            values[1] = Convert.ToInt32(row["University"].ToString());
            values[2] = Convert.ToInt32(row["Healthcare"].ToString());
            values[3] = Convert.ToInt32(row["LocalTransport"].ToString());
            values[4] = Convert.ToInt32(row["GlobalTransport"].ToString());
            values[5] = Convert.ToInt32(row["Media"].ToString());
            values[6] = Convert.ToInt32(row["Safety"].ToString());
            values[7] = Convert.ToInt32(row["EducationFee"].ToString());
            values[8] = Convert.ToInt32(row["UniversityFee"].ToString());
            values[9] = Convert.ToInt32(row["HealthcareFee"].ToString());
            values[10] = Convert.ToInt32(row["LocalTransportFee"].ToString());
            values[11] = Convert.ToInt32(row["GlobalTransportFee"].ToString());
            values[12] = Convert.ToInt32(row["MediaFee"].ToString());
            values[13] = Convert.ToInt32(row["SafetyFee"].ToString());
            return new CityServices(Convert.ToInt32(row["CityId"].ToString()), 0, values);
        }

    }
}
