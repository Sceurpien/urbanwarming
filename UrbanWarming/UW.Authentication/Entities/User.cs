using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using UW.Authentication.Logics;
using UW.Authentication.Models;

namespace UW.Authentication
{
    public class User
    {
        [BsonRepresentation(BsonType.ObjectId)]
        [BsonElement("_id")]
        public string Id { get; set; }

        [BsonElement("username")]
        public string Name { get; set; }

        [BsonElement("email")]
        public string Email { get; set; }

        [BsonElement("password")]
        public string HashedPassword { get; set; }

        [BsonElement("salt")]
        public string Salt { get; set; }

        [BsonElement("validToken")]
        public DateTime? Valid { get; set; }

        [BsonElement("refreshtoken")]
        public string RefreshToken { get; set; }

        [BsonElement("created")]
        public DateTime Created { get; set; }

        [BsonElement("lastlogin")]
        public DateTime? LastLogin { get; set; }
    }
}
