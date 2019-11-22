//using AuctionPlatform.Model;
//using System;
//using System.Collections.Generic;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Web;

//namespace AuctionPlatform.DAL
//{
//    public class BidDAO
//    {
//        private SqlConnection con = ConnectDB.Connect();

//        public double InsertNewBid(Bid bid)
//        {
//            con.Open();

//            SqlCommand cmd = new SqlCommand("insert into bid values, con);
//            SqlDataReader sdr = cmd.ExecuteReader();
//            if (sdr.Read())
//            {
//                return new User()
//                {
//                    User_id = sdr.GetString(0),
//                    Username = sdr.GetString(1),
//                    Email = Email,
//                    Pwd = sdr.GetString(3)
//                };
//            }

//            return 0.0;

//        }

//    }
//}