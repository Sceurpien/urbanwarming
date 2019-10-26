namespace UW.DataAccess.Entities
{
    public class CityFinance
    {
        public int CityId { get; set; }
        public int CityMapId { get; set; }
        public int TaxSummary { get; set; }
        public int TaxPercentage { get; set; }
        public int IndustryTaxing { get; set; }
        public int PublicServiceCost { get; set; }
        public int Summary { get; set; }

        public CityFinance(int id, int mapid, int[] values)
        {
            CityId = id;
            CityMapId = mapid;
            TaxSummary = values[0];
            TaxPercentage = values[1];
            IndustryTaxing = values[2];
            PublicServiceCost = values[3];
            Summary = values[4];
        }
    }
}
