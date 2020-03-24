using AuctionPlatform.BLL;
using AuctionPlatform.DAL;
using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace AuctionPlatform
{
    public partial class Login : System.Web.UI.Page
    {
        private UserService userServer = null;
        private bool Ready = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["LoginCode"] == null || ((string)Session["LoginCode"]).Equals(""))
            {
                userServer = new UserService();
                if (Page.IsPostBack)
                {
                    string StrEmail = Request.QueryString["Email"];
                    if (StrEmail != null) Email.Text = StrEmail.ToString();
                }
            }
            else
            {
                Response.Redirect("HomePage");
            }
        }



        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            if (Ready)
            {
                string StrEmail = Email.Text;
                // string StrPwd = Pwd.Text;

                // string url = "Login.aspx?Email=" + StrEmail + "&Password=" + Pwd.Text;

                Session["LoginCode"] = StrEmail;
                

                Response.Redirect("HomePage");
            }
        }

        protected void PwdCorrect_ServerValidate(object source, ServerValidateEventArgs args)
        {
            
            string result = userServer.EmailMatchPwd(Email.Text, Pwd.Text);


            if (result == "Unmatch" || result == "NULL")
            {
                Ready = false;
                args.IsValid = false;
            }
            else
            {
                Ready = true;
                args.IsValid = true;
            }
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