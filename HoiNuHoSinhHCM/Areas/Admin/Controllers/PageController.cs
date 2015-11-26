using HoiNuHoSinhHCM.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HoiNuHoSinhHCM.Areas.Admin.Controllers
{
    [Authorize]
    public class PageController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        public ActionResult List()
        {
            return Json(db.NewsCategory.Where(i => i.GroupID == "page"), JsonRequestBehavior.AllowGet);
        }
        //
        // GET: /Admin/About/
        public ActionResult GetData(int id)
        {
            return Json(db.NewsCategory.FirstOrDefault(i=>i.GroupID == "page" && i.Id == id),JsonRequestBehavior.AllowGet);
        }

        public ActionResult Update(NewsCategory model)
        {
            var page = db.NewsCategory.FirstOrDefault(i => i.Id == model.Id);
            page.Content = model.Content;
            db.Entry(page).State = EntityState.Modified;
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Add(NewsCategory model)
        {
            if (!string.IsNullOrEmpty(model.Name))
            {
                model.GroupID = "page";
                db.NewsCategory.Add(model);
                db.SaveChanges();

                var recentAdded = (db.NewsCategory.Where(i => i.GroupID == "page").OrderByDescending(i => i.Id)).FirstOrDefault();
                return Json(recentAdded, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return HttpNotFound();
            }
        }
	}
}