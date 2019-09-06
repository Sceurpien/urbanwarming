using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using UW.AuthAPI.Models;
using UW.Authentication.Logics;

namespace UW.AuthAPI.Controllers
{
    [Route("authapi/[controller]")]
    public class LoginController : Controller
    {
        [HttpPost("[action]")]
        public string Login([FromBody] LoginModel model)
        {
            return JsonConvert.SerializeObject(UwLogics.Login(model.loginname, model.password));
        }
    }
}
