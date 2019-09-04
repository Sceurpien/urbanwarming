using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Linq;
using UW.BusinessLogic.DTOs;
using UW.BusinessLogic.Logics;

namespace UW.BusinessLogic.Test
{
    [TestClass]
    public class GetCityTypes
    {
        [TestMethod]
        public void GetCityTypes_Success()
        {
            IEnumerable<CityTypeDTO> cityTypes = CityTypeLogic.GetCityTypes();

            Assert.AreNotEqual(0, cityTypes.Count());
        }
    }
}
