using HomeshareASP.Infra;
using HomeshareASP.Models;
using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeshareASP.Areas.Membre.Controllers
{
    public class HomeController : Controller
    {
        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

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

        [HttpGet]
        public ActionResult MyHomesharing()
        {
            MyHomesharingViewModel mhsvm = new MyHomesharingViewModel();
            mhsvm.CurrentMembre = SessionUtils.ConnectedMembre;
            mhsvm.GetBienListOfOwner();
            return View(mhsvm);
        }        
        
        [HttpGet]
        public ActionResult AddHomesharing()
        {
            MembreAddHomesharingViewModel mahvm = new MembreAddHomesharingViewModel();
            return View(mahvm);
        }

        [HttpGet]
        public ActionResult RemoveHomesharing()
        {
            
            return View();
        }

        
    }
}