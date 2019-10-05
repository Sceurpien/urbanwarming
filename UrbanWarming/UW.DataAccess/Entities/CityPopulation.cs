namespace UW.DataAccess.Entities
{
    public class CityPopulation
    {
        public int CityId { get; set; }
        public int CityMapId { get; set; }
        public int All { get; set; }
        public int AllIncrease { get; set; }
        public int Young { get; set; }
        public int YoungIncrease { get; set; }
        public int YoungAdult { get; set; }
        public int YoungAdultIncrease { get; set; }
        public int Adult { get; set; }
        public int AdultIncrease { get; set; }
        public int Elder { get; set; }
        public int ElderIncrease { get; set; }
        public CityPopulation(int id, int mapid, int[] values, int[] increases)
        {
            CityId = id;
            CityMapId = mapid;
            All = values[0];
            AllIncrease = increases[0];
            Young = values[1];
            YoungIncrease = increases[1];
            YoungAdult = values[2];
            YoungAdultIncrease = increases[2];
            Adult = values[3];
            AdultIncrease = increases[3];
            Elder = values[4];
            ElderIncrease = increases[4];
        }
    }
}
