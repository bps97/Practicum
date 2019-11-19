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
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       

        

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            foreach (Control ctl in control.Controls)
            {
                Response.Write(ctl);
            }
        }
    }
}