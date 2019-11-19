using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AuctionPlatform.Common
{
    public class IDGenerator
    {
     
        public static string GetRandomUserId()
        {
           return DateTime.Now.ToFileTimeUtc().ToString();
        }

        public static string GetRandomArtWorkCode()
        {
            return DateTime.Now.ToString("yyyyMMddHHMMssffff");
        }
        
    }
}