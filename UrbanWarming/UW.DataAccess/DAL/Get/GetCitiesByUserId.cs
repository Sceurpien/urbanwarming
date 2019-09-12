using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public IEnumerable<City> GetCitiesForUserId(string userId)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>()
                {
                    new SqlParameter("UserId", userId)
                };

                DataTable dt = base.GetDataTable("sp_GetCitiesByUserId", parameters);

                return GetCitiesFromDataTable(dt);
            }
            catch
            {
                return null;
            }
        }

        private IEnumerable<City> GetCitiesFromDataTable(DataTable dt)
        {
            List<City> cities = new List<City>();

            foreach (DataRow row in dt.Rows)
            {
                City city = this.GetCityFromDataRow(row);
                cities.Add(city);
            }

            return cities;
        }
    }
}
