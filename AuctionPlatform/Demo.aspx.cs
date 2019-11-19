using System;
using System.Data.SqlClient;

namespace AuctionPlatform
{
    public partial class Demo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = ConnectDB.Connect();
            con.Open();
            //构造Command对象，设置CommandText 
            SqlCommand cmd = new SqlCommand("select * from _user", con);
            //执行Command命令，并将结果指向SqlDataReader对象
            SqlDataReader sdr = cmd.ExecuteReader();
            //关闭连接
  

            try
            {
                if (sdr.Read())
                {
                    Response.Write("数据库连接成功" + sdr[1]);
                }

            }
            catch
            {
                Response.Write("连接失败");
            }
            finally
            {
                con.Close();
            }


        }
    }
}