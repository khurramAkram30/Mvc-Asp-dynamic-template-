using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication7.Controllers
{
    public class FrontEndController : Controller
    {
        ShoppingCartEntities db = new ShoppingCartEntities();
        // GET: FrontEnd
        public ActionResult Index()
        {
            var product = db.Products.ToList();
            return View(product);
        }

        public ActionResult Getcategories()
        {
            var categories = db.Categories.ToList();
            return PartialView(categories);
        }

    }
}