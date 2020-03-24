using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AuctionPlatform.DAL;
using AuctionPlatform.Model;

namespace AuctionPlatform.BLL
{
    public class BidService
    {
        private BidDAO DAO = new BidDAO();

        public void AddNewBid(Bid bid)
        {
            DAO.CreateNewBid(bid);
            return;
        }

    }
}