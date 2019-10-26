using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public CityIndustry GetCityIndustry(int cityId)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("CityId", cityId));

                DataTable dt = base.GetDataTable("sp_GetCityIndustry", parameters);

                return ConvertDataRowToCityIndustry(dt.Rows[0]);
            }
            catch
            {
                return null;
            }
        }

        private CityIndustry ConvertDataRowToCityIndustry(DataRow row)
        {
            int[] values = new int[20];
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
            values[10] = Convert.ToInt32(row["AgricultureTax"].ToString());
            values[11] = Convert.ToInt32(row["MiningTax"].ToString());
            values[12] = Convert.ToInt32(row["ConstructionTax"].ToString());
            values[13] = Convert.ToInt32(row["ManufacturingTax"].ToString());
            values[14] = Convert.ToInt32(row["TradeAndWarehousingTax"].ToString());
            values[15] = Convert.ToInt32(row["InformationTechnologyTax"].ToString());
            values[16] = Convert.ToInt32(row["FinanceAndInsuranceTax"].ToString());
            values[17] = Convert.ToInt32(row["SocialServicesTax"].ToString());
            values[18] = Convert.ToInt32(row["OtherServicesTax"].ToString());
            values[19] = Convert.ToInt32(row["EntertainmentTax"].ToString());
            return new CityIndustry(Convert.ToInt32(row["CityId"].ToString()), 0, values);
        }

    }
}
