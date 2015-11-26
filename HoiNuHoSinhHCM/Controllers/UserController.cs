using AttributeRouting.Web.Mvc;
using HoiNuHoSinhHCM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace HoiNuHoSinhHCM.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        //
        // GET: /User/
        public ActionResult Index()
        {
            return View();
        }

        [GET("/thanh-vien/tra-cuu-tai-lieu")]
        public ActionResult Document()
        {
            return View(db.Document);
        }

        [GET("/thanh-vien/dang-ky-hoi-nghi")]
        public ActionResult ConferenceRegistration()
        {
            ViewBag.success = false;
            ViewBag.ConferenceId = new SelectList(db.Conference.Where(i=>i.Name != null).ToList(), "Id", "Name");
            return View(new Conference());
        }

        [POST("/thanh-vien/dang-ky-hoi-nghi")]
        public ActionResult ConferenceRegistration(Conference model)
        {
            ViewBag.ConferenceId = new SelectList(db.Conference.Where(i => i.Name != null).ToList(), "Id", "Name");
            if (ModelState.IsValid)
            {
                db.Conference.Add(model);
                db.SaveChanges();
                ViewBag.success = true;
                ModelState.Clear();
                return View(new Conference());
            }
            else
            {
                ViewBag.success = false;
                return View(model);
            }
        }

        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(LoginModel model)
        {
            try
            {
                var userlogged = db.User.Single(i => i.Username == model.Username);
                if (userlogged.Password == Exts.md5(model.Password))
                {
                    FormsAuthentication.SetAuthCookie(userlogged.Username, false);
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

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index","Home");
        }
	}
}