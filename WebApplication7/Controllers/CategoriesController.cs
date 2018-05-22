using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication7.Controllers
{
    public class CategoriesController : Controller
    {
        ShoppingCartEntities db = new ShoppingCartEntities();

        public ActionResult Index()
        {
            var categories = db.Categories.Where(c => c.IsDeleted == false).ToList();
            return View(categories);
        }

        public ActionResult Search(string keyword)
        {            
            //var categories = db.Categories.Where(c => c.IsDeleted == false &&
            //    c.Name.Contains(keyword)                
            //    ).ToList();

            var search_result = db.Search(keyword).ToList();
            
            List<Category> categories = new List<Category>();
            foreach (var item in search_result)
            {
                var category = new Category();
                category.Id = item.Id;
                category.Name = item.Name;
                category.IsDeleted = item.IsDeleted;
                categories.Add(category);
            }
            
            return View("Index", categories);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Add(Category category)
        {
            category.IsDeleted = false;
            db.Categories.Add(category);

            db.SaveChanges();
            TempData["Message"] = "Category has been added.";
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int Id)
        {
            var _category = db.Categories.Find(Id);

            return View(_category);
        }

        [HttpPost]
        public ActionResult Edit(Category category)
        {
            var _category = db.Categories.Find(category.Id);
            _category.Name = category.Name;

            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int Id)
        {
            var _category = db.Categories.Find(Id);
            _category.IsDeleted = true;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}