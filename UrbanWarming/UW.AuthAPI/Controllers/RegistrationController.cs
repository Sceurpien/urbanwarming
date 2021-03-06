using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using UW.Authentication.Logics;

namespace UW.AuthAPI.Controllers
{
    [Route("authapi/[controller]")]
    public class RegistrationController : Controller
    {
        [HttpPost("[action]")]
        public string Registration([FromBody] string username, string email, string password)
        {
            return JsonConvert.SerializeObject(UwLogics.Register(username, email, password));
        }
    }
}
