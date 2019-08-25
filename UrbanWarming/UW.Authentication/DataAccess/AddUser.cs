using MongoDB.Driver;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Text;
using UW.Authentication.Entities.DbContext;
using UW.Authentication.Logics;

namespace UW.Authentication
{
    public partial class DataAccess
    {
        public async static Task<string> AddUser(User user)
        {
            string salt = UwLogics.RandomString(20);
            string password = Encoding.UTF8.GetString(UwLogics.Hash(user.HashedPassword, salt));

            try
            {
                var dbContext = new DbContext();
                await dbContext.Users.InsertOneAsync(user);
            }
            catch (Exception e)
            {
                return null;
            }
            return user.Id;
        }
    }
}
