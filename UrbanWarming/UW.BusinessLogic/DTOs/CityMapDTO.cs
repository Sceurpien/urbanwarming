using UW.DataAccess.Entities;

namespace UW.BusinessLogic.DTOs
{
    public class CityMapDTO
    {
        public int Id { get; set; }
        public CityDTO City { get; set; }
        public CityMapTypeDTO CityMapType { get; set; }
        public CityMapZoneDTO CityMapZone { get; set; }
        public int XCoordinate { get; set; }
        public int YCoordinate { get; set; }
        public string Name { get; set; }
        public int Level { get; set; }

        public CityMapDTO(CityMap cityMap)
        {
            Id = cityMap.Id;
            CityMapType = new CityMapTypeDTO(cityMap.CityMapType);
            CityMapZone = new CityMapZoneDTO(cityMap.CityMapZone);
            XCoordinate = cityMap.XCoordinate;
            YCoordinate = cityMap.YCoordinate;
            Name = cityMap.Name;
            Level = cityMap.Level;
            City = cityMap.City != null ? new CityDTO(cityMap.City) : null;
        }

    }
}
