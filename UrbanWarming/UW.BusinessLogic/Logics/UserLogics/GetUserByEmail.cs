using UW.BusinessLogic.DTOs;
using UW.DataAccess.DAL;

namespace UW.BusinessLogic.Logics
{
    public partial class UserLogics
    {
        public static UserDTO GetUserByEmail(string email)
        {
            try
            {
                UWDataAccess dataAccess = new UWDataAccess();
                return new UserDTO(dataAccess.GetUserByEmail(email));
            }
            catch
            {
                return null;
            }
        }
    }
}
