using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AuctionPlatform.Model
{
    public class Order
    {
        public string Order_code { get; set; }
        public string Artwork_code { get; set; }
        public string Buyer_id { get; set; }
        public float Final_price { get; set; }
        public DateTime Order_time { get; set; }
    }
}