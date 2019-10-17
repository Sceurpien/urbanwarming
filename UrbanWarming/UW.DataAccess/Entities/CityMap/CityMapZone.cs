namespace UW.DataAccess.Entities
{
    public class CityMapZone
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string OfficialName { get; set; }
        public string FictionalName { get; set; }

        public CityMapType CityMapType { get; set; }

        public CityMapZone(int id, string name, string officialName, string fictionalName, CityMapType cityMapType)
        {
            Id = id;
            Name = name;
            OfficialName = officialName;
            FictionalName = fictionalName;
            CityMapType = cityMapType;
        }

    }
}
