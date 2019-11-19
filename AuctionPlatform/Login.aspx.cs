using AuctionPlatform.BLL;
using AuctionPlatform.DAL;
using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace AuctionPlatform
{
    public partial class Login : System.Web.UI.Page
    {
        private UserService userServer = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            string StrEmail = Request.QueryString["Email"];
            if (StrEmail != null) Email.Text = StrEmail.ToString();
        }



        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string StrEmail = Email.Text;
            string StrPwd = Pwd.Text;

            string url = "Login.aspx?Email=" + StrEmail + "&Password=" + Pwd.Text;

            Response.Write(userServer.EmailMatchPwd(Email.Text, Pwd.Text));

            Response.Redirect("HomePage");
        }

        protected void PwdCorrect_ServerValidate(object source, ServerValidateEventArgs args)
        {
            userServer = new UserService();
            string result = userServer.EmailMatchPwd(Email.Text, Pwd.Text);

            if (result != "NULL" || result != "Unmatch") args.IsValid = true;
            args.IsValid = false;
            
        }

        

        protected void CreatePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reg.aspx");
        }
    }
}