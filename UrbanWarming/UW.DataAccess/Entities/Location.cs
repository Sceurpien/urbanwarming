namespace UW.DataAccess.Entities
{
    public class Location
    {
        public int Id { get; set; }
        public double Longitude { get; set; }
        public double Lattitude { get; set; }

        public Location(int id, double longitude, double lattitude)
        {
            Id = id;
            Longitude = longitude;
            Lattitude = lattitude;
        }
    }
}
