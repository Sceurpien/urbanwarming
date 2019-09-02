using UW.BusinessLogic.DTOs;
using UW.DataAccess.DAL;

namespace UW.BusinessLogic.Logics
{
    public partial class UserLogics
    {
        public static UserDTO GetUserByName(string userName)
        {
            try
            {
                UWDataAccess da = new UWDataAccess();
                return new UserDTO(da.GetUserByName(userName));
            }
            catch
            {
                return null;
            }
        }
    }
}
