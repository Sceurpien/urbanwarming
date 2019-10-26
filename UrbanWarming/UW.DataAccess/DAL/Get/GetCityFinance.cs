using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public CityFinance GetCityFinance(int cityId)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("CityId", cityId));

                DataTable dt = base.GetDataTable("sp_GetCityFinance", parameters);

                return ConvertDataRowToCityFinance(dt.Rows[0]);
            }
            catch
            {
                return null;
            }
        }

        private CityFinance ConvertDataRowToCityFinance(DataRow row)
        {
            int[] values = new int[5];
            values[0] = Convert.ToInt32(row["TaxSummary"].ToString());
            values[1] = Convert.ToInt32(row["TaxPercentage"].ToString());
            values[2] = Convert.ToInt32(row["IndustryTaxing"].ToString());
            values[3] = Convert.ToInt32(row["PublicServiceCost"].ToString());
            values[4] = Convert.ToInt32(row["Summary"].ToString());
            return new CityFinance(Convert.ToInt32(row["CityId"].ToString()), 0, values);
        }

    }
}
