namespace UW.DataAccess.Entities
{
    public class CityTourism
    {
        public int CityId { get; set; }
        public int CityMapId { get; set; }
        public int Landmark { get; set; }
        public int Party { get; set; }
        public int Leisure { get; set; }
        public int Event { get; set; }
        public int Business { get; set; }

        public CityTourism(int id, int mapid, int[] values)
        {
            CityId = id;
            CityMapId = mapid;
            Landmark = values[0];
            Party = values[1];
            Leisure = values[2];
            Event = values[3];
            Business = values[4];
        }
    }
}
