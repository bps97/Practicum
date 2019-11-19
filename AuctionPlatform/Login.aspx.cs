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
        private bool Ready = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            userServer = new UserService();
            string StrEmail = Request.QueryString["Email"];
            if (StrEmail != null) Email.Text = StrEmail.ToString();
        }



        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            if (Ready)
            {
                string StrEmail = Email.Text;
                string StrPwd = Pwd.Text;

                string url = "Login.aspx?Email=" + StrEmail + "&Password=" + Pwd.Text;

                Response.Write(userServer.EmailMatchPwd(Email.Text, Pwd.Text));

                Response.Redirect("HomePage");
            }
        }

        protected void PwdCorrect_ServerValidate(object source, ServerValidateEventArgs args)
        {
            
            string result = userServer.EmailMatchPwd(Email.Text, Pwd.Text);

            Response.Write("\nresult:"+result);

            if (result == "Unmatch" || result == "NULL")
            {
                //args.IsValid = false;
                Ready = false;
            }
            else
            {
                Ready = true;
                args.IsValid = true;
                Response.Write("Ready:" + Ready);
            }
            Response.Write("2Ready:" + Ready);
        }

        

        protected void CreatePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reg.aspx");
        }

        protected void EmailExist_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = userServer.EmialExist(Email.Text);
        }
    }
}