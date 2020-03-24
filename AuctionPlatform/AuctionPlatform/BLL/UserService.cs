using AuctionPlatform.DAL;
using AuctionPlatform.Model;
using System;

namespace AuctionPlatform.BLL
{


    public class UserService
    {
        private UserDAO DAO = new UserDAO();

        public string EmailMatchPwd(string Email,string Pwd)
        {
            User user = DAO.GetUserByEmail(Email);
            if (user != null)
                return user.Pwd.Equals(Pwd) ? Email : "Unmatch";
            else
                return "NULL";
        }

        public bool EmialExist(string email)
        {
            User user = DAO.GetUserByEmail(email);
            return (user == null) ? false : true;
        }

        public bool CreateNewUser(User user)
        {

            return DAO.InsertIntoUser(user);

        }

        public string GetUserID(string email)
        {
            return DAO.GetUserID(email);
        }
    }
}