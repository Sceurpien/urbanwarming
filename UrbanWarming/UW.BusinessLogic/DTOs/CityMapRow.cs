using System.Collections.Generic;

namespace UW.BusinessLogic.DTOs
{
    public class CityMapRow
    {
        public int RowNumber { get; set; }
        public IEnumerable<CityMapDTO> CityMaps { get; set; }
    }
}
