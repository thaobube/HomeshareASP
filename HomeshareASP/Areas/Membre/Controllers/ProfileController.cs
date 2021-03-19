using HomeshareASP.Infra;
using HomeshareASP.Models;
using HomeshareASP.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeshareASP.Areas.Membre.Controllers
{

    public class ProfileController : Controller
    {
        UnitOfWork uow = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        private string[] validImageType = { ".png", ".jpg", ".jpeg" };

        // GET: Member/Profile
        public ActionResult EditPhoto()
        {
            return View(SessionUtils.ConnectedMembre);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPhoto(MembreModel mm, HttpPostedFileBase FilePhoto)
        {
            // 1. Check the image size > 0 and < 200Mb
            if (FilePhoto.ContentLength > 0 && FilePhoto.ContentLength < 20000)
            {
                //2. Check the image type
                string extension = Path.GetExtension(FilePhoto.FileName);
                if (validImageType.Contains(extension))
                {
                    //3. Check if the destination folder exist
                    //C:\WorkSpace_Thao\HomeshareASP\HomeshareASP\images\Membres\{IdMembre}
                    string destFolder = Path.Combine(Server.MapPath("~/images/Membres"), SessionUtils.ConnectedMembre.IdMembre.ToString());
                    if (!Directory.Exists(destFolder))
                    {
                        Directory.CreateDirectory(destFolder);
                    }
                    //4. Upload the image
                    FilePhoto.SaveAs(Path.Combine(destFolder, FilePhoto.FileName));
                    //5. Update the Photo of the Connected Membre
                    SessionUtils.ConnectedMembre.Photo = FilePhoto.FileName;
                    // 6. Save in the DB
                    uow.EditMembreProfilePhoto(SessionUtils.ConnectedMembre);

                    return RedirectToAction("Index", "Home");
                }
            }
            return View(SessionUtils.ConnectedMembre);
        }
    }
}
