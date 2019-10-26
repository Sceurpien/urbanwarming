using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public CityPopulation GetCityPopulation(int cityId)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("CityId", cityId));

                DataTable dt = base.GetDataTable("sp_GetCityPopulation", parameters);

                return ConvertDataRowToCityPopulation(dt.Rows[0]);
            }
            catch
            {
                return null;
            }
        }

        private CityPopulation ConvertDataRowToCityPopulation(DataRow row)
        {
            int[] values = new int[5];
            int[] incs = new int[5];
            values[0] = Convert.ToInt32(row["All"].ToString());
            values[1] = Convert.ToInt32(row["Young"].ToString());
            values[2] = Convert.ToInt32(row["YoungAdult"].ToString());
            values[3] = Convert.ToInt32(row["Adult"].ToString());
            values[4] = Convert.ToInt32(row["Elder"].ToString());
            incs[0] = Convert.ToInt32(row["AllIncrease"].ToString());
            incs[1] = Convert.ToInt32(row["YoungIncrease"].ToString());
            incs[2] = Convert.ToInt32(row["YoungAdultIncrease"].ToString());
            incs[3] = Convert.ToInt32(row["AdultIncrease"].ToString());
            incs[4] = Convert.ToInt32(row["ElderIncrease"].ToString());
            return new CityPopulation(Convert.ToInt32(row["CityId"].ToString()), 0, values, incs);
        }

    }
}
