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

        public string TimeDif
        {
            get { return EndTimeDif.Text; }
            set { EndTimeDif.Text = value; }
        }

        public string Status
        {
            get { return ArtStatus.Text; }
            set { ArtStatus.Text = value; }
        }

        public string Info
        {
            get { return ArtworkInfo.Text; }
            set { ArtworkInfo.Text = value; }
        }
        public string ImgUrl
        {
            get { return ArtImg.ImageUrl; }
            set { ArtImg.ImageUrl = value; }
        }

        public string Code
        {
            get { return ArtCode.Text; }
            set { ArtCode.Text = value; }
        }

        public string ProviderName
        {
            get { return Provider.Text; }
            set { Provider.Text = value; }
        }
    }
}