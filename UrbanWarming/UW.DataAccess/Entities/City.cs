namespace UW.DataAccess.Entities
{
    public class City
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Level { get; set; }
        public CityType CityType { get; set; }
        public Location Location { get; set; }

        public City(int id, string name, int level, CityType cityType, Location location)
        {
            Id = id;
            Name = name;
            Level = level;
            CityType = cityType;
            Location = location;
        }
    }
}
