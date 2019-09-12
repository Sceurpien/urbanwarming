using System.Collections.Generic;
using System.Linq;
using UW.BusinessLogic.DTOs;
using UW.DataAccess.DAL;

namespace UW.BusinessLogic.Logics
{
    public partial class CityLogics
    {
        public static IEnumerable<CityDTO> GetCitiesByUserId(string userId)
        {
            try
            {
                UWDataAccess da = new UWDataAccess();

                return da.GetCitiesForUserId(userId).Select(city => new CityDTO(city));
            }
            catch
            {
                return null;
            }
        }
    }
}
