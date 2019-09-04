using System.Collections.Generic;
using System.Linq;
using UW.BusinessLogic.DTOs;
using UW.DataAccess.DAL;

namespace UW.BusinessLogic.Logics
{
    public class CityTypeLogic
    {
        public static IEnumerable<CityTypeDTO> GetCityTypes()
        {
            try
            {
                UWDataAccess da = new UWDataAccess();

                return da.GetCityTypes().Select(t => new CityTypeDTO(t));
            }
            catch
            {
                return null;
            }
        }
    }
}
