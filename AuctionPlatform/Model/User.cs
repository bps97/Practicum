using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AuctionPlatform.Model
{
    public class User
    {
        public string User_id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Pwd { get; set; }
    }
}