using System.Collections.Generic;
using System.Linq;
using UW.BusinessLogic.DTOs;
using UW.DataAccess.DAL;

namespace UW.BusinessLogic.Logics
{
    public partial class CityLogics
    {
        public static IEnumerable<CityMapDTO> GetCityMap(int cityId)
        {
            try
            {
                UWDataAccess da = new UWDataAccess();
                IEnumerable<CityMapDTO> cityMap = da.GetCityMap(cityId).Select(r=> new CityMapDTO(r));

                return cityMap.OrderBy(c => c.XCoordinate).ThenBy(c => c.YCoordinate);
            }
            catch
            {
                return null;
            }
        }
    }
}