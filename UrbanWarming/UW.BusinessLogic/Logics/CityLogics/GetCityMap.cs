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
                return da.GetCityMap(cityId).Select(r=> new CityMapDTO(r));
            }
            catch
            {
                return null;
            }
        }
    }
}