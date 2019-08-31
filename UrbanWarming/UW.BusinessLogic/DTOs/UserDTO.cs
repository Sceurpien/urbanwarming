
using System;
using System.Collections.Generic;
using System.Text;
using UW.DataAccess.Entities;

namespace UW.BusinessLogic.DTOs
{
    public class UserDTO
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string PictureLink { get; set; }
        public string UserDescription { get; set; }
        public int CountryId { get; set; }

        public UserDTO(User user)
        {
            this.Id = user.Id;
            this.UserName = user.UserName;
            this.Email = user.Email;
            this.PictureLink = user.PictureLink;
            this.UserDescription = user.UserDescription;
            this.CountryId = user.CountryId;
        }

        public UserDTO(string id, string username, string email, string picture, string description, int country)
        {
            this.Id = id;
            this.UserName = username;
            this.Email = email;
            this.PictureLink = picture;
            this.UserDescription = description;
            this.CountryId = country;
        }

        public User ToUser()
        {
            return new User(this.Id, this.UserName, this.Email, this.PictureLink, this.UserDescription, this.CountryId);
        }
    }
}
