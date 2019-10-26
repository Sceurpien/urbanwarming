using UW.DataAccess.Entities;

namespace UW.BusinessLogic.DTOs
{
    public class CityMapTypeDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string OfficialName { get; set; }
        public string FictionalName { get; set; }

        public CityMapTypeDTO(CityMapType cityMapType)
        {
            Id = cityMapType.Id;
            Name = cityMapType.Name;
            OfficialName = cityMapType.OfficialName;
            FictionalName = cityMapType.FictionalName;
        }
    }
}
