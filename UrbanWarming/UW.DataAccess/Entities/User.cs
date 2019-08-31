
using System;
using System.Collections.Generic;
using System.Text;

namespace UW.DataAccess.Entities
{
    public class User
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string PictureLink { get; set; }
        public string UserDescription { get; set; }
        public int CountryId { get; set; }

        public User(string id, string username, string email, string picture, string description, int country)
        {
            this.Id = id;
            this.UserName = username;
            this.Email = email;
            this.PictureLink = picture;
            this.UserDescription = description;
            this.CountryId = country;
        }
    }
}
