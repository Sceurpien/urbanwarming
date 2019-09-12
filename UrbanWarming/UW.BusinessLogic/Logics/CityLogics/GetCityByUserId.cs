using UW.BusinessLogic.DTOs;
using UW.DataAccess.DAL;

namespace UW.BusinessLogic.Logics
{
    public partial class CityLogics
    {
        public static CityDTO GetCityByUserId(string userId)
        {
            try
            {
                UWDataAccess da = new UWDataAccess();
                return new CityDTO(da.GetCityByUserId(userId));
            }
            catch
            {
                return null;
            }
        }
    }
}
