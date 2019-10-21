using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using UW.BusinessLogic.DTOs;
using UW.BusinessLogic.Logics;

namespace UW.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityMapController: Controller
    {
        [Route("{id}")]
        [HttpGet]
        public IEnumerable<CityMapDTO> GetCityMap(int cityId)
        {
            IEnumerable<CityMapDTO> cityMap = CityLogics.GetCityMap(cityId);

            return cityMap;
        }
    }
}
