using AuctionPlatform.BLL;
using AuctionPlatform.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuctionPlatform
{
    public partial class Product : System.Web.UI.Page
    {
        private ArtworkService artworkService = new ArtworkService();
        private UserService userSercice = new UserService();
        private BidService bidService = new BidService();
        private string artCode = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            artCode = Request.QueryString["ArtCode"];

            //string ArtCode = "2019103019551234";

            Artwork artwork = artworkService.GetArtwork(artCode);

            ArtImg.ImageUrl = artwork.ArtWork_url;
            ArtInfo.Text = artwork.Artwork_name;
            CurrentPrice.Text = artwork.Price.ToString();
            BidPrice.Text = CurrentPrice.Text;
            DiffPrice.Text = (artwork.Price / 50).ToString();

            if (artwork.Auction_time.Equals(new DateTime()))
            {
                Status.Text = "预展中";
                EndTime.Text = "还未公布开拍时间";
            }
            else
            {
                TimeSpan difTime = artwork.Auction_time - DateTime.Now;

                if (difTime.Days > 1)
                {
                    Status.Text = "预展中";
                    EndTime.Text = string.Format("公布起拍时间为:{0}", artwork.Auction_time.ToString("yyyy-MM-dd"));
                }
                else if (difTime.Days >= 0)
                {
                    Status.Text = "正在拍";
                    EndTime.Text = string.Format("距结束还有{0}时{1}分{2}秒",
                        difTime.Hours + 24,
                        (difTime.Minutes + 24 * 60) % 60,
                        (difTime.Seconds + 24 * 60 * 60) % 60);
                }
                else
                {
                    Status.Text = "已结拍";
                    EndTime.Text = "";
                }
            }

        }

        protected void BidBtn_Click(object sender, EventArgs e)
        {
            if(Session["LoginCode"] != null)
            {
                string email = Session["LoginCode"].ToString();
                if (email.Equals(""))
                {
                    Response.Redirect("Login");
                }
                else
                {
                    String userID = userSercice.GetUserID(email);

                    string price = Request.QueryString["BidPrice"];

                    Response.Write(userID);

                    Bid bid = new Bid()
                    {
                        Bidder_id = userID,
                        Artwork_code = artCode,
                        Bid_price = int.Parse(price)
                    };

                    bidService.AddNewBid(bid);
                }
            }
            else
            {
                Response.Redirect("Login");
            }

           
        }
    }
}