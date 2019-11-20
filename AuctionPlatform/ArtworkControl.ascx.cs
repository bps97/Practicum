using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuctionPlatform
{
    public partial class ArtworkControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string Info
        {
            get { return ArtworkInfo.Text; }
            set { ArtworkInfo.Text = value; }
            //set {
            //    ArtworkInfo = new Label()
            //    {
            //        Text = value
            //    };
            //}
        }
        public string ImgUrl
        {
            get { return ArtImg.ImageUrl; }
            set { ArtImg.ImageUrl = value; }
            //set { Image Img = new Image()
            //{
            //    ImageUrl = value
            //};
            //    ArtImg = Img;
            //}
        }
        public string ProviderName
        {
            get { return Provider.Text; }
            set { Provider.Text = value; }
            //set {
            //    Provider = new Label()
            //    {
            //        Text = value
            //    };
            //}
        }
    }
}