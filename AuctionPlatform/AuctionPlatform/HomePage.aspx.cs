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
    public partial class HomePage : System.Web.UI.Page
    {
        private ArtworkService artworkService = new ArtworkService();

        protected void Page_Load(object sender, EventArgs e)
        {
            string Selected = SelectBtn.Value;
            int index = (Selected == "") ? 1 : Selected[Selected.Length - 1] - '0';
            //for (int i = 0; i < 100; ++i)
            //{
            //    Response.Write(new DateTime());
            //}

            List<Artwork> list = artworkService.GetArtworkList(12,index);
            GeneratorArtworkInfo(list);

            foreach(Control cnl in SelectForm.Controls)
            {
                if(cnl is LinkButton)
                {
                    LinkButton lbt = (LinkButton)cnl;
                    if (lbt.CssClass.Equals("select-active"))
                    {
                        lbt.CssClass = "";
                    }
                    if (lbt.ID.Equals(Selected))
                    {
                        lbt.CssClass = "select-active";
                    }
                }
            }

        }

        private void GeneratorArtworkInfo(List<Artwork> list)
        {
            control.Controls.Clear();
            foreach (Artwork artwork in list)
            {

                Control co = LoadControl("ArtworkControl.ascx");

                ArtworkControl artworkControl = (ArtworkControl)co;
                artworkControl.ImgUrl = artwork.ArtWork_url;
                artworkControl.Info = artwork.Artwork_name;
                artworkControl.ProviderName = artwork.Provider;
                if (artwork.Auction_time.Equals(new DateTime()))
                {
                    artworkControl.Status = "预展中";
                    artworkControl.TimeDif = "还未公布开拍时间";
                }
                else
                {
                    TimeSpan difTime = artwork.Auction_time - DateTime.Now;

                    if (difTime.Days > 1)
                    {
                        artworkControl.Status = "预展中";
                        artworkControl.TimeDif = string.Format("公布起拍时间为:{0}", artwork.Auction_time.ToString("yyyy-MM-dd"));
                    }
                    else if (difTime.Days >= 0)
                    {
                        artworkControl.Status = "正在拍";
                        artworkControl.TimeDif = string.Format("距结束还有{0}时{1}分{2}秒", 
                            difTime.Hours+24, 
                            (difTime.Minutes+24*60) % 60, 
                            (difTime.Seconds+24*60*60) % 60);
                    }
                    else
                    {
                        artworkControl.Status = "已结拍";
                        artworkControl.TimeDif = "";
                    }
                }

                artworkControl.Code = artwork.Artwork_code;

                control.Controls.Add(co);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
           
        }
    }
}