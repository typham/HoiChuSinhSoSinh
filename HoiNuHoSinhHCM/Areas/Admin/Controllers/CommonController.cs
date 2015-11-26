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
    public class CommonController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        //
        // GET: /Admin/Common/
        public ActionResult GetBanner()
        {
            return Json(db.Common.FirstOrDefault(i=>i.GroupID == "banner"),JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetAds()
        {
            return Json(db.Common.FirstOrDefault(i => i.GroupID == "ads"), JsonRequestBehavior.AllowGet);
        }

        public ActionResult Update(Common model)
        {
            var common = db.Common.FirstOrDefault(i => i.Id == model.Id);
            common.Image = model.Image;
            db.Entry(common).State = EntityState.Modified;
            db.SaveChanges();
            return Json("OK", JsonRequestBehavior.AllowGet);
        }
	}
}