using HomeshareASP.Models;
using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeshareASP.Controllers
{
    public class HomeController : Controller
    {
        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
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

        public ActionResult Homesharing(string searchString = null, int page = 1)
        {
            ViewBag.Homesharing = "active";
            HomesharingViewModel hsvm = new HomesharingViewModel();
            hsvm.paginateHomesharing(searchString, page);
            return View(hsvm );
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpGet]
        public ActionResult Homedetail(int id)
        {
            ViewBag.Message = "Your contact page.";
            ViewBag.IndexHomeDetail = id;
            HomeDetailViewModel hdvm = new HomeDetailViewModel();
            hdvm.TargetBien = uow.GetTargetBienModel(id);
            return View(hdvm);
        }

    }
}