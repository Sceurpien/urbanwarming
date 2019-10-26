using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public CityTourism GetCityTourism(int cityId)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("CityId", cityId));

                DataTable dt = base.GetDataTable("sp_GetCityTourism", parameters);

                return ConvertDataRowToCityTourism(dt.Rows[0]);
            }
            catch
            {
                return null;
            }
        }

        private CityTourism ConvertDataRowToCityTourism(DataRow row)
        {
            int[] values = new int[5];
            values[0] = Convert.ToInt32(row["Landmark"].ToString());
            values[1] = Convert.ToInt32(row["Party"].ToString());
            values[2] = Convert.ToInt32(row["Leisure"].ToString());
            values[3] = Convert.ToInt32(row["Event"].ToString());
            values[4] = Convert.ToInt32(row["Business"].ToString());
            return new CityTourism(Convert.ToInt32(row["CityId"].ToString()), 0, values);
        }

    }
}
