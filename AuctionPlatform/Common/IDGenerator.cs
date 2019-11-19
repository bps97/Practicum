using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AuctionPlatform.Common
{
    public class IDGenerator
    {
     
        public static String GetRandomId()
        {
           return DateTime.Now.ToFileTimeUtc().ToString();
        }
}
}