using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AuctionPlatform.Model
{
    public class Bid
    {
        public string Bidder_id { get; set; }
        public string Artwork_code { get; set; }
        public double Bid_price { get; set; }
    }
}