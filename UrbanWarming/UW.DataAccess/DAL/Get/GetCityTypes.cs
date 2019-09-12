using System;
using System.Collections.Generic;
using System.Data;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public IEnumerable<CityType> GetCityTypes()
        {
            try
            {
                DataTable dt = base.GetDataTable("sp_GetCityTypes", null);

                return GetCityTypesFromDataTable(dt);
            }
            catch
            {
                return null;
            }
        }

        private IEnumerable<CityType> GetCityTypesFromDataTable(DataTable dt)
        {
            List<CityType> cityTypes = new List<CityType>();

            foreach (DataRow row in dt.Rows)
            {
                CityType type = ConvertDataRowToCityType(row, "Id");

                cityTypes.Add(type);
            }

            return cityTypes;
        }

        private CityType ConvertDataRowToCityType(DataRow row, string idColumnName)
        {
            CityType type = new CityType(
                Convert.ToInt32(row[idColumnName].ToString()),
                row["Name"].ToString(),
                row["OfficialName"].ToString(),
                row["FictionalName"].ToString(),
                row["Region"].ToString(),
                Convert.ToBoolean(row["SeaConnection"].ToString()),
                Convert.ToBoolean(row["RoadConnection"].ToString()),
                row["Difficulty"].ToString(),
                row["Description"].ToString()
            );

            return type;
        }

    }
}
