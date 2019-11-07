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
        public IEnumerable<CityMapRow> GetCityMap(int id)
        {
            IEnumerable<CityMapRow> cityMap = CityLogics.GetCityMap(id);

            return cityMap;
        }
    }
}
