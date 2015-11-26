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
    public class NewsCategoryController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        //
        // GET: /Admin/NewsCategory/
        public ActionResult GetList()
        {
            var model = db.NewsCategory.Where(i => i.GroupID != "page").ToList()
                        .Select(nc => new {Id= nc.Id, Name= nc.Name, TotalNews = nc.Newss.Count()});
            return Json(model, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Add(NewsCategory model)
        {
            if (ModelState.IsValid)
            {
                model.Order = db.NewsCategory.Where(i => i.GroupID == "NewsC").Max(i => i.Order) +1;
                model.GroupID = "NewsC";
                db.NewsCategory.Add(model);
                db.SaveChanges();

                var recentAdded = (db.NewsCategory.Where(i => i.GroupID == "NewsC").OrderByDescending(i => i.Id)
                                    .Select(nc => new { Id = nc.Id, Name = nc.Name, TotalNews = nc.Newss.Count() })).FirstOrDefault();
                return Json(recentAdded,JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Update(NewsCategory model)
        {
            var NewsCategory = db.NewsCategory.FirstOrDefault(i => i.Id == model.Id);
            NewsCategory.Name = model.Name;
            db.Entry(NewsCategory).State = EntityState.Modified;
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Delete(int id)
        {
            var model = db.NewsCategory.FirstOrDefault(i => i.Id == id);
            db.NewsCategory.Remove(model);
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }
	}
}