using System.Collections.Generic;
using System.Linq;
using UW.BusinessLogic.DTOs;
using UW.DataAccess.DAL;

namespace UW.BusinessLogic.Logics
{
    public partial class CityLogics
    {
        public static IEnumerable<CityMapRow> GetCityMap(int cityId)
        {
            try
            {
                UWDataAccess da = new UWDataAccess();
                IEnumerable<CityMapDTO> cityMapDtos = da.GetCityMap(cityId).Select(r=> new CityMapDTO(r)).OrderBy(c => c.XCoordinate).ThenBy(c => c.YCoordinate);

                //Dictionary<int, List<CityMapDTO>> dictionary = cityMap.GroupBy(p => p.XCoordinate)
                //     .ToDictionary(p => p.Key, p => p.ToList());

                IEnumerable<CityMapRow> citymap = cityMapDtos
                    .OrderBy(c => c.XCoordinate)
                    .GroupBy(c => c.XCoordinate)
                    .Select(c=> 
                        new CityMapRow()
                        {
                            RowNumber = c.Key,
                            CityMaps = c.ToList()
                        });

                return citymap;
                //return dictionary;
            }
            catch
            {
                return null;
            }
        }
    }
}