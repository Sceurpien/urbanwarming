using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using UW.Authentication.Models;

namespace UW.Authentication.Logics
{
    public partial class UwLogics
    {
        private static string hashcode = "GreatThunberg";
        public static string CreateJwtToken(string payload)
        {
            if (payload == null)
                return null;

            string header = "{\"alg\":\"HS256\",\"typ\":\"JWT\"}";
            string basejwt = Base64UrlEncoder.Encode(header) + "." + Base64UrlEncoder.Encode(payload);
            string jwt = basejwt + "." + Convert.ToBase64String(Hash(basejwt, hashcode));
            return jwt;
        }

        public static string ValidateJwtToken(string token)
        {
            try
            {
                string[] parts = token.Split('.');
                string payload = parts[0] + "." + parts[1];
                string hash = parts[2];
                if (ConfirmToken(payload, hash, hashcode))
                {
                    Jwt basejwt = JsonConvert.DeserializeObject<Jwt>(Base64UrlEncoder.Decode(parts[1]));
                    return CreateJwtToken(basejwt.Validate());
                }
                return null;
            }
            catch
            {
                return null;
            }
        }

        public static string ValidateJwtTokenWithIdResponse(string token)
        {
            try
            {
                string[] parts = token.Split('.');
                string payload = parts[0] + "." + parts[1];
                string hash = parts[2];
                if (ConfirmToken(payload, hash, hashcode))
                {
                    Jwt basejwt = JsonConvert.DeserializeObject<Jwt>(Base64UrlEncoder.Decode(parts[1]));
                    if (basejwt.Validate() != null)
                    {
                        return basejwt.id;
                    }
                }
                return null;
            }
            catch
            {
                return null;
            }
        }
    }
}