using MongoDB.Driver;
using System;
using System.Linq;
using System.Threading.Tasks;
using UW.Authentication.Entities.DbContext;

namespace UW.Authentication
{
    public partial class DataAccess
    {
        public async static Task<User> GetUser(string id)
        {
            User returnvalue = null;
            if (id == null)
            {
                throw new Exception("Input ID can't be null.");
            }

            try
            {
                var dbContext = new DbContext();
                var users = await dbContext.Users.Find(x => x.Id == id).Limit(1).ToListAsync();
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
