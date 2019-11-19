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
    public partial class Reg : System.Web.UI.Page
    {
        private UserService userService = null;
        private bool Ready = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            userService = new UserService();
        }

        protected void EmialExist_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Ready = false == userService.EmialExist(Email.Text); 
            args.IsValid = Ready;
        }

        protected void RegBtn_Click(object sender, EventArgs e)
        {
            if (Ready)
            {
                bool result = userService.CreateNewUser(new User()
                {
                    Username = Nickname.Text,
                    Email = Email.Text,
                    Pwd = Pwd.Text,
                });

                if (result == true)
                    Response.Redirect("homepage");
                else
                    Response.Redirect("reg");
            }
        }
    }
}