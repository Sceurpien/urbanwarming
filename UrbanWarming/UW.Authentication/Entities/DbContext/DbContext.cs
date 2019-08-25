using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Text;

namespace UW.Authentication.Entities.DbContext
{
    class DbContext
    {
        public const string CONNECTION_STRING_NAME = "UrbanWarmingAuth";
        public const string DATABASE_NAME = "uw";
        public const string USERS_COLLECTION_NAME = "auth";

        private static readonly IMongoClient _client;
        private static readonly IMongoDatabase _database;

        static DbContext()
        {
            var connectionString = "mongodb://localhost:27017";
            connectionString = "mongodb+srv://urbanwarming:ewzfYPVlRqp8GIzW@cluster0-rcxwf.azure.mongodb.net/test?retryWrites=true&w=majority";
            _client = new MongoClient(connectionString);
            _database = _client.GetDatabase(DATABASE_NAME);
        }

        public IMongoClient Client
        {
            get { return _client; }
        }

        public IMongoCollection<User> Users
        {
            get { return _database.GetCollection<User>(USERS_COLLECTION_NAME); }
        }
    }
}
