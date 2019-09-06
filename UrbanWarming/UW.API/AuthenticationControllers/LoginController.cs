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
    public class LoginController : Controller
    {
        [HttpPost("[action]")]
        public string Login([FromBody] LoginModel model)
        {
            return JsonConvert.SerializeObject(UwLogics.Login(model.loginname, model.password));
        }
    }
}
