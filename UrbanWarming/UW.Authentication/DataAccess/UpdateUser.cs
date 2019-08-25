using MongoDB.Driver;
using System;
using System.Linq;
using System.Threading.Tasks;
using UW.Authentication.Entities.DbContext;

namespace UW.Authentication
{
    public partial class DataAccess
    {
        public async static Task<bool> UpdateUser(User user)
        {
            try
            {
                var dbContext = new DbContext();
                var filter = Builders<User>.Filter.Eq(s => s.Id, user.Id);
                await dbContext.Users.ReplaceOneAsync(filter, user);
            }
            catch (Exception e)
            {
                return false;
            }

            return true;
        }
    }
}
