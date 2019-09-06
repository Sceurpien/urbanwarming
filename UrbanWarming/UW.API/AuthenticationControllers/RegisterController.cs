using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using UW.API.Models;
using UW.Authentication.Logics;

namespace UW.API.AuthenticationControllers
{
    [Route("api/[controller]")]
    public class RegisterController : Controller
    {
        [HttpPost("[action]")]
        public string Register([FromBody] RegisterModel model)
        {
            string result = UwLogics.Register(model.loginname, model.email, model.password);

            // Generate Stuff and save into this database as well

            return JsonConvert.SerializeObject(result);
        }
    }
}
