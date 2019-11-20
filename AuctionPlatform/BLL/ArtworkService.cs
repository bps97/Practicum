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
        private ArtworkDAO DAO = new ArtworkDAO();

        public List<Artwork> GetArtworkList(int number)
        {
            return DAO.GetArtworkList(number);
        }

        public List<Artwork> GetArtworkList(int number,int code)
        {
            return DAO.GetArtworkList(number,code);
        }

        public Artwork GetArtwork(string artCode)
        {
            return DAO.GetArtwork(artCode);
        }
    }
}