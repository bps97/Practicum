using AuctionPlatform.Common;
using AuctionPlatform.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AuctionPlatform.DAL
{
	public class ArtworkDAO
	{
        private SqlConnection con = ConnectDB.Connect();

		public List<Artwork> GetArtWorkList(int number)
        {
            List<Artwork> list = new List<Artwork>();

            con.Open();

            string sql = string.Format("select top {0} * from artwork",number);

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader sdr = cmd.ExecuteReader();

			while(sdr.Read())
            {
                //try
                //{

                Artwork artwork = new Artwork();
                artwork.Artwork_code = sdr.GetString(0);
                artwork.Artwork_name = sdr.GetString(1);
                artwork.ArtWork_url = sdr.GetString(2);
                artwork.Price = sdr.GetDouble(3);
                artwork.Arrive_time = sdr.GetDateTime(5);
                artwork.Auction_time = sdr.IsDBNull(6) ? new DateTime() : sdr.GetDateTime(6)
;

				
                //Artwork artwork = new Artwork()
                //{
                //    Artwork_code = sdr.GetString(0),
                //    Artwork_name = sdr.GetString(1),
                //    ArtWork_url = sdr.GetString(2),
                //    Price = sdr.GetDouble(3),
                //    Provider = sdr.GetString(4),
                //    Arrive_time = sdr.GetDateTime(5),
                //    Auction_time = sdr.GetDateTime(6)
                //};


                list.Add(artwork);


                //}
                //catch
                //{
                //}
                
            }
			
            return list;
        }
    }
}