using HomeshareASP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeshareASP.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Home = "active";
            HomeViewModel hvm = new HomeViewModel();
            return View(hvm);
        }

        public ActionResult About()
        {
            ViewBag.About = "active";
            return View();
        }

        public ActionResult Owners()
        {
            ViewBag.Owners = "active";
            return View();
        }

        public ActionResult Homesharing()
        {
            ViewBag.Homesharing = "active";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Homedetail()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Blogdetail()
        {
            ViewBag.Message = "Your blog page.";

            return View();
        }

        public ActionResult Buysalerent()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }


        public ActionResult Register()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}