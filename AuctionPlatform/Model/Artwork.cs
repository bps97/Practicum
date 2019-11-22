using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AuctionPlatform.Model
{
    public class Artwork
    {
        public string Artwork_code { get; set; }
        public string Artwork_name { get; set; }
        public string ArtWork_url { get; set; }
        public int Price { get; set; }
        public string Provider { get; set; }
        public DateTime Arrive_time { get; set; }
        public DateTime Auction_time { get; set; }
    }
}