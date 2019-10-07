using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using UW.BusinessLogic.DTOs;
using UW.BusinessLogic.Logics;

namespace UW.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityTypeController: Controller
    {
        [HttpGet("[action]")]
        public IEnumerable<CityTypeDTO> GetAll()
        {
            IEnumerable<CityTypeDTO> cityTypes = CityTypeLogic.GetCityTypes();

            return cityTypes;
        }
    }
}
