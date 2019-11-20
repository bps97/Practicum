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
            List<Artwork> list = artworkService.GetArtWorkList(10);

            Response.Write(list.Count);

            control.Controls.Clear();

            foreach(Artwork artwork in list)
            {

                Control co = LoadControl("ArtworkControl.ascx");

                ArtworkControl artworkControl = (ArtworkControl)co;
                artworkControl.ImgUrl = artwork.ArtWork_url;
                artworkControl.Info = artwork.Artwork_name;
                artworkControl.ProviderName = artwork.Provider;

                //ArtworkControl artworkControl = new ArtworkControl()
                //{
                //    ImgUrl = artwork.ArtWork_url,
                //    Info = artwork.Artwork_name,
                //    ProviderName = artwork.Provider
                //};
                Response.Write(artworkControl);
                control.Controls.Add(artworkControl);
            }






            //int i = 0;
            //int size = list.Count;

            //foreach (Control ctl in control.Controls)
            //{
            //    if (i / 3 < size)
            //    {
            //        if (ctl.GetType() == typeof(Image))
            //        {
            //            Image img = (Image)ctl;
            //            img.ImageUrl = list.ElementAt(i / 3).ArtWork_url;
            //        }
            //        if (ctl.GetType() == typeof(Label))
            //        {
            //            Label label = (Label)ctl;
            //            if (i % 3 == 1)
            //            {
            //                label.Text = list.ElementAt(i / 3).Artwork_name;
            //            }
            //            else
            //            {
            //                label.Text = list.ElementAt(i / 3).Provider;
            //            }
            //        }
            //    }

            //    i++;

            //}


        }
     
    }
}