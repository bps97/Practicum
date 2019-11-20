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
        private ArtworkService service = new ArtworkService();

        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request.QueryString["ArtCode"];

            //string ArtCode = "2019103019551234";

            Artwork artwork = service.GetArtwork(code);

            ArtImg.ImageUrl = artwork.ArtWork_url;
            ArtInfo.Text = artwork.Artwork_name;

        }
    }
}