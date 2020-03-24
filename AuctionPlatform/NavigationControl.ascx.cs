using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuctionPlatform
{
    public partial class NavigationControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginCode"] == null || ((string)Session["LoginCode"]).Equals(""))
            {
                Login.Text = "登录";
                Login.NavigateUrl = "Login";
            }
            else
            {
                Login.Text = "注销";
                Login.NavigateUrl = "Logout";
            }
        }
    }
}