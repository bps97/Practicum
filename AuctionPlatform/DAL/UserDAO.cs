using AuctionPlatform.Common;
using AuctionPlatform.Model;
using System;
using System.Data.SqlClient;

namespace AuctionPlatform.DAL
{

    public class UserDAO
    {
        private SqlConnection con = ConnectDB.Connect();

        public User GetUserByEmail(string Email)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from _user where email='" + Email + "'", con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    return new User()
                    {
                        User_id = sdr.GetString(0),
                        Username = sdr.GetString(1),
                        Email = Email,
                        Pwd = sdr.GetString(3)
                    };
                }
            }
            catch (SqlException e)
            {
                return null;
            }
            finally
            {
                con.Close();
            }
            return null;
        }

        public bool InsertIntoUser(User user)
        {
            try
            {
                con.Open();
                string sql = InsertSql(user);
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader sdr = cmd.ExecuteReader();
            }
            catch
            {
                return false;
            }

            return true;
        }

        private string InsertSql(User user)
        {
            return String.Format("insert into _user values('{0}','{1}','{2}','{3}')",
                IDGenerator.GetRandomId(),user.Username,user.Email,user.Pwd);
            
        }
    }
}