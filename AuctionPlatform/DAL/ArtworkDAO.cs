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

        public Artwork GetArtwork(String artCode)
        {
            con.Open();

            string sql = string.Format("select * from artwork where artwork_code = {0}", artCode);
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            Artwork artwork = null;
            if (sdr.Read())
            {
                artwork = GeneratorObject(sdr);
            }
            con.Close();

            return artwork;

        }

        public List<Artwork> GetArtworkList(int number,int code)
        {

            string sql = null;
            /*
             * 正在拍
                当前时间减去起拍时间小于一天的
             */  
            if(code == 2)
            {
                sql = string.Format("select top {0} * from artwork where datediff(day, auction_time, GETDATE() ) in(0,1)", number);
            }


            /*
             预展中
             */
            if(code == 3)
            {
                sql = string.Format("select top {0} * from artwork where auction_time is NULL or datediff(day, auction_time, GETDATE() ) < 0 ", number);
            }

            /*
             * 已结拍
            */

            if(code == 4)
            {
                sql = string.Format("select top {0} * from artwork where datediff(day, auction_time, GETDATE() ) > 1", number);
            }


            if (code == 1)
            {
                sql = string.Format("select top {0} * from artwork", number);
            }

            /* 按最新上架的优先排序 */
            sql = string.Format("{0} order by abs(datediff(mi, auction_time, GETDATE())) ASC,auction_time DESC", sql);


            con.Open();

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            List<Artwork> list = GenerateList(sdr);

            con.Close();

            return list;
        }

        public List<Artwork> GetArtworkList(int number)
        {
            return GetArtworkList(number, 1);
        }

        private List<Artwork> GenerateList(SqlDataReader sdr)
        {
            List<Artwork> list = new List<Artwork>();

            while (sdr.Read())
            {
                Artwork artwork = GeneratorObject(sdr);

                list.Add(artwork);

            }

            return list;
        }

        private  Artwork GeneratorObject(SqlDataReader sdr)
        {
            return new Artwork
            {
                Artwork_code = sdr.GetString(0),
                Artwork_name = sdr.GetString(1),
                ArtWork_url = sdr.GetString(2),
                Price = sdr.GetInt32(3),
                Provider = sdr.GetString(4),
                Arrive_time = sdr.GetDateTime(5),
                Auction_time = sdr.IsDBNull(6) ? new DateTime() : sdr.GetDateTime(6)
            };
        }
    }
}
 