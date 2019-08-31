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
        public async static Task<bool> DeleteUser(string id)
        {
            try
            {
                var dbContext = new DbContext();
                await dbContext.Users.DeleteOneAsync(x => x.Id == id);
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }
    }
}
