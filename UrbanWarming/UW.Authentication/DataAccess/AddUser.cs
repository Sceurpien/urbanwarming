﻿using MongoDB.Driver;
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
