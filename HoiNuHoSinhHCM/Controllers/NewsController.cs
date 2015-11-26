using AttributeRouting.Web.Mvc;
using HoiNuHoSinhHCM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HoiNuHoSinhHCM.Controllers
{
    public class NewsController : Controller
    {
        HoiNuHoSinhHCMContext db = new HoiNuHoSinhHCMContext();
        //
        // GET: /News/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetNewsByCategory(int CategoryId)
        {
            var news = db.News.Where(i=>i.CategoryId == CategoryId && i.IsDeleted == false && i.IsDisplay == true).OrderByDescending(i=>i.CreatedDate).Take(3);
            return PartialView("_GetNewsByCategory", news);
        }

        [GET("/tin-tuc/{CategoryName}/{Name}")]
        public ActionResult Detail(string Name)
        {
            var newsItem = new News();
            foreach (var item in db.News)
            {
                if (Exts.ToAscii(item.Name) == Name){
                    newsItem = item;
                    break;
                }
            }
            return View(newsItem);
        }
        
        [GET("/kien-thuc/{CategoryName}")]
        public ActionResult NewsByCategory(string CategoryName)
        {
            var category = new NewsCategory();
            foreach (var item in db.NewsCategory)
            {
                if (Exts.ToAscii(item.Name) == CategoryName)
                {
                    category = item;
                    break;
                }
            }
            ViewBag.categoryName = category.Name;
            return View(db.News.Where(i => i.CategoryId == category.Id));
        }
	}
}