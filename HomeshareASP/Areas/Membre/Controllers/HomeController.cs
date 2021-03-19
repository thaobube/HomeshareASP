using HomeshareASP.Infra;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeshareASP.Areas.Membre.Controllers
{
    public class HomeController : Controller
    {
        // GET: Member/Home
        public ActionResult Index()
        {
            if (!SessionUtils.IsLogged)
            {
                return RedirectToAction("Login", "Account", new { area = "" });
            }
            else
            {
                return View(SessionUtils.ConnectedMembre);
            }
        }

        [HttpGet]
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home", new { area = "" });
        }
    }
}