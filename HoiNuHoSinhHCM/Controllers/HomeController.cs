using AttributeRouting.Web.Mvc;
using HoiNuHoSinhHCM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HoiNuHoSinhHCM.Controllers
{
    public class HomeController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        public ActionResult Index()
        {
            var topNews = db.News.Where(i => i.CategoryId != 5 && i.IsDeleted == false && i.IsDisplay).OrderByDescending(i => i.CreatedDate).Take(5);
            return View(topNews);
        }

        public ActionResult Banner()
        {
            return PartialView("_Banner",db.Common.FirstOrDefault(i=>i.GroupID == "banner"));
        }

        public ActionResult Menu()
        {
            return PartialView("_Menu",db.NewsCategory.Where(i=>i.GroupID == "page"));
        }

        public ActionResult Categories()
        {

            return PartialView("_Categories", db.NewsCategory.Where(i => i.GroupID == "NewsC").OrderBy(i => i.Order));
        }

        public ActionResult Sidebar()
        {
            return PartialView("_Sidebar");
        }

        public ActionResult Events()
        {
            return PartialView("_Events",db.News.Where(i=>i.CategoryId == 5).Take(5));
        }
        public ActionResult Gallery()
        {
            return PartialView("_Gallery",db.Common.FirstOrDefault(i=>i.GroupID == "gallery"));
        }

        public ActionResult Ads()
        {
            return PartialView("_Ads",db.Common.FirstOrDefault(i=>i.GroupID == "ads"));
        }

        [GET("/{PageName}.html")]
        public ActionResult Page(string PageName)
        {
            var page = new NewsCategory();
            foreach (var item in db.NewsCategory.Where(i=>i.GroupID =="page"))
            {
                if (Exts.ToAscii(item.Name) == PageName)
                {
                    page = item;
                }
            }
            return View(page);
        }
    }
}