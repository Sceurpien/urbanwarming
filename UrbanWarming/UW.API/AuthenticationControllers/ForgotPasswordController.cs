using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using UW.API.Models;
using UW.Authentication.Logics;

namespace UW.API.AuthenticationControllers
{
    [Route("api/[controller]")]
    public class ForgotPasswordController : Controller
    {
        [HttpPost("[action]")]
        [EnableCors("AllowOrigin")]
        public string ForgotPassword([FromBody] ForgotPasswordModel model)
        {
            try
            {
                //TODO Send Email
                return JsonConvert.SerializeObject(true);
            }
            catch
            {
                return JsonConvert.SerializeObject(false);
            }
        }

        [HttpPost("[action]")]
        [EnableCors("AllowOrigin")]
        public string ResetPassword([FromBody] ResetPasswordModel model)
        {
            try
            {
                //TODO Reset Password
                return JsonConvert.SerializeObject(true);
            }
            catch
            {
                return JsonConvert.SerializeObject(false);
            }
        }
    }
}
