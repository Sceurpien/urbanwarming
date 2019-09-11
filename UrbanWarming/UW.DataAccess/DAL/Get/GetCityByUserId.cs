using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {

        public City GetCityByUserId(string userId)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(new SqlParameter("UserId", userId));

                DataTable dt = base.GetDataTable("sp_GetCityByUserId", parameters);

                return GetCityFromDataTable(dt);
            }
            catch
            {
                return null;
            }
        }

        private City GetCityFromDataTable(DataTable dt)
        {
            DataRow row = dt.Rows.Count > 0 ? dt.Rows[0] : null;

            if (row == null)
            {
                return null;
            }

            Location location = new Location(
                Convert.ToInt32(row["LocationId"].ToString()),
                Convert.ToDouble(row["Longitude"].ToString()),
                Convert.ToDouble(row["Lattitude"].ToString())
            );

            CityType cityType = ConvertDataRowToCityType(row, "CityTypeid");

            City city = new City(
                Convert.ToInt32(row["Id"].ToString()),
                row["Name"].ToString(),
                Convert.ToInt32(row["Level"].ToString()),
                cityType,
                location
            );

            return city;
        }
    }
}
