using HoiNuHoSinhHCM.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace HoiNuHoSinhHCM.Areas.Admin.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        //
        // GET: /Admin/User/
        public ActionResult DocumentType()
        {
            var model = db.Document.Where(i => i.ConfigGroup == 0).ToList()
                         .Select(nc => new { Id = nc.Id, Name = nc.Name, TotalNews = db.Document.Where(i=>i.ConfigGroup == nc.Id).Count() });
            return Json(model, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AddDocumentType(Document model)
        {
            if (ModelState.IsValid)
            {
                model.ConfigGroup = 0;
                model.CreatedDate = DateTime.Now;
                db.Document.Add(model);
                db.SaveChanges();

                var recentAdded = (db.Document.Where(i => i.ConfigGroup == 0).OrderByDescending(i => i.Id)
                                    .Select(nc => new { Id = nc.Id, Name = nc.Name, TotalNews = 0 })).FirstOrDefault();
                return Json(recentAdded,JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult UpdateDocumentType(Document model)
        {
            var DocumentType = db.Document.FirstOrDefault(i => i.Id == model.Id);
            DocumentType.Name = model.Name;
            db.Entry(DocumentType).State = EntityState.Modified;
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteDocumentType(int id)
        {
            var model = db.Document.FirstOrDefault(i => i.Id == id);
            db.Document.Remove(model);
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        public ActionResult DocumentTypeById(int id)
        {
            var model = db.Document.FirstOrDefault(i => i.Id == id);
            return Json(model, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DocumentByType(int id)
        {
            var model = db.Document.Where(i => i.ConfigGroup == id).ToList();
            return Json(model, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AddDocument(Document model)
        {
            if (ModelState.IsValid)
            {
                model.CreatedDate = DateTime.Now;
                db.Document.Add(model);
                db.SaveChanges();

                var recentAdded = (db.Document).OrderByDescending(i => i.Id).FirstOrDefault();
                return Json(recentAdded, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult UpdateDocument(Document model)
        {
            var Document = db.Document.FirstOrDefault(i => i.Id == model.Id);
            Document.Name = model.Name;
            Document.Note = model.Note;
            Document.LinkDownload= model.LinkDownload;
            db.Entry(Document).State = EntityState.Modified;
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        [AllowAnonymous]
        public ActionResult CheckAuthentication()
        {
            var authenticated = User.Identity.IsAuthenticated;
            return Json(authenticated, JsonRequestBehavior.AllowGet);
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (!string.IsNullOrEmpty(model.Username) && !string.IsNullOrEmpty(model.Password))
            {
                try
                {
                    var user = db.User.Single(i => i.Username == model.Username);
                    if (user.Password == Exts.md5(model.Password))
                    {
                        FormsAuthentication.SetAuthCookie(user.Username, false);
                        return Json(true, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        return Json("Sai mật khẩu!", JsonRequestBehavior.AllowGet);
                    }
                }
                catch
                {
                    return Json("User không tồn tại!", JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                return Json("Vui lòng nhập Username và password!");
            }
        }

        public ActionResult ChangePass(string OldPass, string NewPass)
        {
            if (!string.IsNullOrEmpty(OldPass) && !string.IsNullOrEmpty(NewPass))
            {
                var userlogged = db.User.Single(i => i.Username == User.Identity.Name);

                if (userlogged.Password == Exts.md5(OldPass))
                {
                    if (NewPass.Length >= 6)
                    {
                        userlogged.Password = Exts.md5(NewPass);
                        db.Entry(userlogged).State = EntityState.Modified;
                        db.SaveChanges();
                        return Json(true, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        return Json("Mật khẩu phải lớn hơn 6 kí tự", JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return Json("Sai mật khẩu cũ", JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                return Json("Vui lòng nhập mật khẩu cũ và mật khẩu mới!",JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
	}
}