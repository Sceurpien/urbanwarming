namespace UW.DataAccess.Entities
{
    public class CityMapType
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string OfficialName { get; set; }
        public string FictionalName { get; set; }

        public CityMapType(int id, string name, string officialName, string fictionalName)
        {
            Id = id;
            Name = name;
            OfficialName = officialName;
            FictionalName = fictionalName;
        }
    }
}
