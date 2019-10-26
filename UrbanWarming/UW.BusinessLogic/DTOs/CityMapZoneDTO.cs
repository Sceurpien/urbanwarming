using UW.DataAccess.Entities;

namespace UW.BusinessLogic.DTOs
{
    public class CityMapZoneDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string OfficialName { get; set; }
        public string FictionalName { get; set; }
        public CityMapTypeDTO CityMapType { get; set; }

        public CityMapZoneDTO(CityMapZone cityMapZone)
        {
            Id = cityMapZone.Id;
            Name = cityMapZone.Name;
            OfficialName = cityMapZone.OfficialName;
            FictionalName = cityMapZone.FictionalName;
            CityMapType = new CityMapTypeDTO(cityMapZone.CityMapType);
        }
    }
}
