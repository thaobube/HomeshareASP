using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HomeshareASP.Infra
{
    public static class SessionUtils
    {
        public static bool IsLogged
        {
            get
            {
                if (HttpContext.Current.Session["Logged"] == null)
                {
                    HttpContext.Current.Session["Logged"] = false;
                }
                return (bool)HttpContext.Current.Session["Logged"];
            }
            set
            {
                HttpContext.Current.Session["Logged"] = value;
            }
        }

        public static UserModel ConnectedUser
        {
            get
            {
                return (UserModel)HttpContext.Current.Session["ConnectedUser"];
            }
            set
            {
                HttpContext.Current.Session["ConnectedUser"] = value;
            }
        }
    }
}