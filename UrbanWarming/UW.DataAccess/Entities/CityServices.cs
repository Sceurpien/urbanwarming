namespace UW.DataAccess.Entities
{
    public class CityServices
    {
        public int CityId { get; set; }
        public int CityMapId { get; set; }
        public int Education { get; set; }
        public int University { get; set; }
        public int Healthcare { get; set; }
        public int LocalTransport { get; set; }
        public int GlobalTransport { get; set; }
        public int Media { get; set; }
        public int Safety { get; set; }
        public int EducationFee { get; set; }
        public int UniversityFee { get; set; }
        public int HealthcareFee { get; set; }
        public int LocalTransportFee { get; set; }
        public int GlobalTransportFee { get; set; }
        public int MediaFee { get; set; }
        public int SafetyFee { get; set; }

        public CityServices(int id, int mapid, int[] values)
        {
            CityId = id;
            CityMapId = mapid;
            Education = values[0];
            University = values[1];
            Healthcare = values[2];
            LocalTransport = values[3];
            GlobalTransport = values[4];
            Media = values[5];
            Safety = values[6];
            EducationFee = values[7];
            UniversityFee = values[8];
            HealthcareFee = values[9];
            LocalTransportFee = values[10];
            GlobalTransportFee = values[11];
            MediaFee = values[12];
            SafetyFee = values[13];
        }
    }
}
