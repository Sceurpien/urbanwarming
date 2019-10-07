using System;
using System.Collections.Generic;
using System.Data;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public CityIndustry GetCityIndustry()
        {
            try
            {
                DataTable dt = base.GetDataTable("sp_GetCityIndustry", null);

                return ConvertDataRowToCityIndustry(dt.Rows[0]);
            }
            catch
            {
                return null;
            }
        }

        private CityIndustry ConvertDataRowToCityIndustry(DataRow row)
        {
            int[] values = new int[10];
            values[0] = Convert.ToInt32(row["Agriculture"].ToString());
            values[1] = Convert.ToInt32(row["Mining"].ToString());
            values[2] = Convert.ToInt32(row["Construction"].ToString());
            values[3] = Convert.ToInt32(row["Manufacturing"].ToString());
            values[4] = Convert.ToInt32(row["TradeAndWarehousing"].ToString());
            values[5] = Convert.ToInt32(row["InformationTechnology"].ToString());
            values[6] = Convert.ToInt32(row["FinanceAndInsurance"].ToString());
            values[7] = Convert.ToInt32(row["SocialServices"].ToString());
            values[8] = Convert.ToInt32(row["OtherServices"].ToString());
            values[9] = Convert.ToInt32(row["Entertainment"].ToString());
            return new CityIndustry(Convert.ToInt32(row["CityId"].ToString()), 0, values);
        }

    }
}
