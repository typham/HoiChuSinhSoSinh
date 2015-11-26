using HoiNuHoSinhHCM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Text;

namespace HoiNuHoSinhHCM.Areas.Admin.Controllers
{
    [Authorize]
    public class ConferenceController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        //
        // GET: /Admin/Conference/
        public ActionResult GetList()
        {
            var model = db.Conference.Where(i => i.Name != null).ToList();
            return Json(model, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Add(Conference model)
        {
            if(!string.IsNullOrEmpty(model.Name) && model.Date != null){
                db.Conference.Add(model);
                db.Configuration.ValidateOnSaveEnabled = false;
                db.SaveChanges();
                var recentAdded = (db.Conference.Where(i => i.Name != null)).OrderByDescending(i => i.Id).FirstOrDefault();
                return Json(recentAdded, JsonRequestBehavior.AllowGet);
            }else{
                return Json("Error",JsonRequestBehavior.AllowGet);
            }
            
        }

        public ActionResult ConferenceById(int id)
        {
            var model = db.Conference.FirstOrDefault(i => i.Id == id);
            return Json(model, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Update(Conference model)
        {
            var Conference = db.Conference.FirstOrDefault(i => i.Id == model.Id);
            Conference.Name = model.Name;
            Conference.Date = model.Date;
            Conference.Note = model.Note;
            db.Entry(Conference).State = EntityState.Modified;
            db.Configuration.ValidateOnSaveEnabled = false;
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Delete(int id)
        {
            var model = db.Conference.FirstOrDefault(i => i.Id == id);
            db.Conference.Remove(model);
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }
	}
}