using UW.DataAccess.Entities;

namespace UW.BusinessLogic.DTOs
{
    public class CityTypeDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string OfficialName { get; set; }
        public string FictionalName { get; set; }
        public string Region { get; set; }
        public bool SeaConnection { get; set; }
        public bool RoadConnection { get; set; }
        public string Difficulty { get; set; }
        public string Description { get; set; }

        public CityTypeDTO(int id, string name, string officialName, string fictionalName, string region, bool seaConnection, bool roadConnection, string difficulty, string description)
        {
            Id = id;
            Name = name;
            OfficialName = officialName;
            FictionalName = fictionalName;
            Region = region;
            SeaConnection = seaConnection;
            RoadConnection = roadConnection;
            Difficulty = difficulty;
            Description = description;
        }

        public CityTypeDTO(CityType cityType)
        {
            Id = cityType.Id;
            Name = cityType.Name;
            OfficialName = cityType.OfficialName;
            FictionalName = cityType.FictionalName;
            Region = cityType.Region;
            SeaConnection = cityType.SeaConnection;
            RoadConnection = cityType.RoadConnection;
            Difficulty = cityType.Difficulty;
            Description = cityType.Description;
        }

    }
}
