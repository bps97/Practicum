using System.Configuration;
using System.Data.SqlClient;

namespace AuctionPlatform
{
    public class ConnectDB
    {
        private static string ConnectString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ConnectionString;

        public static SqlConnection Connect()
        {
            SqlConnection con = new SqlConnection(ConnectString);
           
            return con;
        }
    }
}