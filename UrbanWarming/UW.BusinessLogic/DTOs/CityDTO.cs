using System;
using System.Collections.Generic;
using System.Text;
using UW.DataAccess.Entities;

namespace UW.BusinessLogic.DTOs
{
    public class CityDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Level { get; set; }
        public CityTypeDTO CityType { get; set; }
        public LocationDTO Location { get; set; }

        public CityDTO(int id, string name, int level, CityType cityType, Location location)
        {
            Id = id;
            Name = name;
            Level = level;
            CityType = new CityTypeDTO(cityType);
            Location = new LocationDTO(location);
        }

        public CityDTO(City city)
        {
            Id = city.Id;
            Name = city.Name;
            Level = city.Level;
            CityType = new CityTypeDTO(city.CityType);
            Location = new LocationDTO(city.Location);
        }
    }
}
