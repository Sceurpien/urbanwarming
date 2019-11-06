using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using UW.DataAccess.Entities;

namespace UW.DataAccess.DAL
{
    public partial class UWDataAccess
    {
        public IEnumerable<CityMap> GetCityMap(int cityId)
        {
            try
            {
                List<SqlParameter> parameters = new List<SqlParameter>()
                {
                    new SqlParameter("CityId", cityId)
                };

                DataTable dt = GetDataTable("sp_GetCityMap", parameters);

                return GetCityMapFromDatatable(dt);
            }
            catch
            {
                return null;
            }
        }

        private IEnumerable<CityMap> GetCityMapFromDatatable(DataTable dt)
        {
            List<CityMap> maps = new List<CityMap>();

            foreach (DataRow row in dt.Rows)
            {
                CityMap map = GetCityMapFromDataRow(row);
                maps.Add(map);
            }

            return maps;
        }

        private CityMap GetCityMapFromDataRow(DataRow row)
        {
            // TODO: refactor
            CityMapType cityMapType = new CityMapType(
                Convert.ToInt32(row["CityMapTypeId"].ToString()),
                row["CityMapTypeName"].ToString(),
                row["CityMapTypeOfficialName"].ToString(),
                row["CityMapTypeFictionalName"].ToString()
            );

            CityMapType zoneCityMapType = new CityMapType(
                Convert.ToInt32(row["ZoneMapTypeId"].ToString()),
                row["ZoneMapTypeName"].ToString(),
                row["ZoneMapTypeOfficialName"].ToString(),
                row["ZoneMapTypeFictionaleName"].ToString()
            );

            CityMapZone cityMapZone = new CityMapZone(
                Convert.ToInt32(row["CityMapZoneId"].ToString()),
                row["CityMapZoneName"].ToString(),
                row["CityMapZoneOfficialName"].ToString(),
                row["CityMapZoneFictionalName"].ToString(),
                zoneCityMapType
            );

            CityMap city = new CityMap(
                Convert.ToInt32(row["Id"].ToString()),
                cityMapType,
                cityMapZone,
                Convert.ToInt32(row["XCoordinate"].ToString()),
                Convert.ToInt32(row["YCoordinate"].ToString()),
                row["Name"].ToString(),
                Convert.ToInt32(row["Level"].ToString())
            );

            return city;
        }
    }
}
