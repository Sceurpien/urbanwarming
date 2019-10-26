namespace UW.DataAccess.Entities
{
    public class CityMap
    {
        public int Id { get; set; }
        public City City { get; set; }
        public CityMapType CityMapType { get; set; }
        public CityMapZone CityMapZone { get; set; }
        public int XCoordinate { get; set; }
        public int YCoordinate { get; set; }
        public string Name { get; set; }
        public int Level { get; set; }

        public CityMap(int id, CityMapType cityMapType, CityMapZone cityMapZone, int xCoordinate, int yCoordinate, string name, int level, City city)
        {
            Id = id;
            CityMapType = cityMapType;
            CityMapZone = cityMapZone;
            XCoordinate = xCoordinate;
            YCoordinate = yCoordinate;
            Name = name;
            Level = level;
            City = city;
        }
    }
}
