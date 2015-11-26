using HoiNuHoSinhHCM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HoiNuHoSinhHCM.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        //
        // GET: /Admin/Home/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Sidebar()
        {
            return PartialView("_Sidebar", db.NewsCategory.Where(i => i.GroupID == "page"));
        }
	}
}