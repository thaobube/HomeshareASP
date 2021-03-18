using HomeshareASP.Infra;
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
    public class AccountController : Controller
    {

        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Logout()
        {
            Session.Abandon();

            return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel lm)
        {
            if (ModelState.IsValid)
            {
                MembreModel um = uow.MembreVefif(lm);
                if (um == null)
                {
                    ViewBag.ErrorMessage = "Login/Password Error";
                    return View();
                }
                else
                {
                    SessionUtils.IsLogged = true;
                    SessionUtils.ConnectedMembre = um;
                    return RedirectToAction("Index", "Home", new { area = "" });
                }
            }
            else
            {
                ViewBag.ErrorMessage = "Login Error";
                return View();
            }
        }

        [HttpGet]
        public ActionResult Signup()
        {
            SignupViewModel svm = new SignupViewModel();
            return View(svm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Signup(MembreModel um)
        {
            if (ModelState.IsValid)
            {
                if (uow.CreateMembre(um))
                {
                    return RedirectToAction("SignupSuccess", "Account", new { area = "" });
                }
                else
                {
                    return RedirectToAction("SignupFail", "Account", new { area = "" });
                }
            }
            else
            {
                return RedirectToAction("SignupError", "Account", new { area = "" });
            }
        }

        [HttpGet]
        public ActionResult SignupSuccess()
        {
            return View();
        }
        [HttpGet]
        public ActionResult SignupFail()
        {
            return View();
        }
        [HttpGet]
        public ActionResult SignupError()
        {
            return View();
        }
    }
}