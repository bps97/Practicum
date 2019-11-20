using AuctionPlatform.DAL;
using AuctionPlatform.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AuctionPlatform.BLL
{

    public class ArtworkService
    {
        private ArtworkDAO ArtworkDao = new ArtworkDAO();

        public List<Artwork> GetArtWorkList(int number)
        {
            return ArtworkDao.GetArtWorkList(number);
        }

    }
}