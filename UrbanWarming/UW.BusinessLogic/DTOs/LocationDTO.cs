using UW.DataAccess.Entities;

namespace UW.BusinessLogic.DTOs
{
    public class LocationDTO
    {
        public int Id { get; set; }
        public double Longitude { get; set; }
        public double Lattitude { get; set; }

        public LocationDTO(int id, double longitude, double lattitude)
        {
            Id = id;
            Longitude = longitude;
            Lattitude = lattitude;
        }

        public LocationDTO(Location location)
        {
            Id = location.Id;
            Longitude = location.Longitude;
            Lattitude = location.Lattitude;
        }
    }
}
