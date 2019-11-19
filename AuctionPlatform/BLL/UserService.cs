using AuctionPlatform.DAL;
using AuctionPlatform.Model;
using System;

namespace AuctionPlatform.BLL
{


    public class UserService
    {
        private UserDAO userDao = new UserDAO();

        public string EmailMatchPwd(string Email,string Pwd)
        {
            User user = userDao.GetUserByEmail(Email);
            if (user != null)
                return user.Pwd.Equals(Pwd) ? Email : "Unmatch";
            else
                return "NULL";
        }

        public bool EmialExist(string email)
        {
            User user = userDao.GetUserByEmail(email);
            return (user == null) ? false : true;
        }

        public bool CreateNewUser(User user)
        {

            return userDao.InsertIntoUser(user);

        }
    }
}