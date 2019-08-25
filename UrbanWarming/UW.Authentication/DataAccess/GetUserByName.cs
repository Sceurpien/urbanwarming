using MongoDB.Driver;
using System;
using System.Linq;
using System.Threading.Tasks;
using UW.Authentication.Entities.DbContext;

namespace UW.Authentication
{
    public partial class DataAccess
    {
        public async static Task<User> GetUserByName(string userName)
        {
            User returnvalue = null;
            if (userName == null)
            {
                throw new Exception("Input ID can't be null.");
            }

            try
            {
                var dbContext = new DbContext();
                var users = await dbContext.Users.Find(x => x.Name == userName).Limit(1).ToListAsync();
                var user = users.Single();

                returnvalue = user;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }

            return returnvalue;
        }
    }
}
