using HoiNuHoSinhHCM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HoiNuHoSinhHCM.Areas.Admin.Controllers
{
    [Authorize]
    public class NewsController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        //
        // GET: /Admin/News/
        public ActionResult GetNewsByCategoryId(int id)
        {
            var News = db.News.Where(i => i.CategoryId == id).OrderByDescending(i=>i.CreatedDate).ToList()
                        .Select(n => new {Id = n.Id, Name = n.Name, Image = n.Image, Summary = n.Summary, Content = n.Content, NewsCategoryName = n.NewsCategory.Name, CreatedDate = n.CreatedDate });
            return Json(News, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Save(News model)
        {
            if (ModelState.IsValid)
            {
                if (model.Id == 0)
                {
                    model.IsFeatured = model.IsDeleted = false;
                    model.IsDisplay = true;
                    model.CreatedDate = DateTime.Now;
                    db.News.Add(model);
                }
                else
                {
                    var News = db.News.FirstOrDefault(i => i.Id == model.Id);
                    News.Name = model.Name;
                    News.Image = model.Image;
                    News.Summary = model.Summary;
                    News.Content = model.Content;
                }
                db.SaveChanges();
                return Json("OK", JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("error", JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Delete(int id)
        {
            var model = db.News.FirstOrDefault(i => i.Id == id);
            db.News.Remove(model);
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }
	}
}