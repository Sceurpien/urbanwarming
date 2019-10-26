namespace UW.DataAccess.Entities
{
    public class CityIndustry
    {
        public int CityId { get; set; }
        public int CityMapId { get; set; }
        public int Agriculture { get; set; }
        public int Mining { get; set; }
        public int Construction { get; set; }
        public int Manufacturing { get; set; }
        public int TradeAndWarehousing { get; set; }
        public int InformationTechnology { get; set; }
        public int FinanceAndInsurance { get; set; }
        public int SocialServices { get; set; }
        public int OtherServices { get; set; }
        public int Entertainment { get; set; }

        public int AgricultureTax { get; set; }
        public int MiningTax { get; set; }
        public int ConstructionTax { get; set; }
        public int ManufacturingTax { get; set; }
        public int TradeAndWarehousingTax { get; set; }
        public int InformationTechnologyTax { get; set; }
        public int FinanceAndInsuranceTax { get; set; }
        public int SocialServicesTax { get; set; }
        public int OtherServicesTax { get; set; }
        public int EntertainmentTax { get; set; }

        public CityIndustry(int id, int mapid, int[] values)
        {
            CityId = id;
            CityMapId = mapid;
            Agriculture = values[0];
            Mining = values[1];
            Construction = values[2];
            Manufacturing = values[3];
            TradeAndWarehousing = values[4];
            InformationTechnology = values[5];
            FinanceAndInsurance = values[6];
            SocialServices = values[7];
            OtherServices = values[8];
            Entertainment = values[9];
            AgricultureTax = values[10];
            MiningTax = values[11];
            ConstructionTax = values[12];
            ManufacturingTax = values[13];
            TradeAndWarehousingTax = values[14];
            InformationTechnologyTax = values[15];
            FinanceAndInsuranceTax = values[16];
            SocialServicesTax = values[17];
            OtherServicesTax = values[18];
            EntertainmentTax = values[19];
        }
    }
}
