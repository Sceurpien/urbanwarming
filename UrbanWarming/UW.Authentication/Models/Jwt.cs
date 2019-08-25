using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace UW.Authentication.Models
{
    public class Jwt
    {
        public string id;
        public DateTime valid;
        public string refreshToken;

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
        public string Validate()
        {
            try
            {
                if (this.valid >= DateTime.Now)
                    return this.ToString();
                else
                {
                    var user = DataAccess.GetUser(this.id).Result;
                    if (user.RefreshToken == this.refreshToken && user.Valid >= DateTime.Now)
                    {
                        this.valid = DateTime.Now.AddMinutes(15);
                        return this.ToString();
                    }
                    else
                        return null;
                }
            }
            catch
            {
                return null;
            }
        }
    }
}
