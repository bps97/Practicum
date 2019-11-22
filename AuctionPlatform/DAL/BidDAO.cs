using AuctionPlatform.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AuctionPlatform.DAL
{
    public class BidDAO
    {
        private SqlConnection con = ConnectDB.Connect();

        public void InsertNewBid(Bid bid)
        {
            con.Open();

            string sql = string.Format("insert into bid values ({0},{1},{2})", bid.Bidder_id, bid.Artwork_code, bid.Bid_price);
            SqlCommand cmd = new SqlCommand(sql,con);
            SqlDataReader sdr = cmd.ExecuteReader();


            return;

        }

        internal void CreateNewBid(Bid bid)
        {
            con.Open();
            string sql = InsertSql(bid);
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader sdr = cmd.ExecuteReader();

            return;
        }

        private string InsertSql(Bid bid)
        {
            return string.Format("" +
                "insert into bid values ({0},{1},{2})", bid.Bidder_id, bid.Artwork_code, bid.Bid_price);
        }
    }
}