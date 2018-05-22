using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication7.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        ShoppingCartEntities db = new ShoppingCartEntities();

        public ActionResult Index()
        {
            var products = db.Products.ToList();
            return View(products);
        }

        public ActionResult Search(string keyword)
        {
            //var products = db.Products.Where(c => c.IsDeleted == false &&
            //    c.Name.Contains(keyword)                
            //    ).ToList();

            var search_result = db.Search(keyword).ToList();

            List<Product> products = new List<Product>();
            foreach (var item in search_result)
            {
                var product = new Product();
                product.Id = item.Id;
                product.Name = item.Name;
                
                products.Add(product);
            }

            return View("Index", products);
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Add(Product product)
        {
            product.CategoryId = 11;
            db.Products.Add(product);

            db.SaveChanges();
            TempData["Message"] = "Product has been added.";
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int Id)
        {
            var _product = db.Products.Find(Id);

            return View(_product);
        }

        [HttpPost]
        public ActionResult Edit(Product product)
        {
            var _product = db.Products.Find(product.Id);
            _product.Name = product.Name;
            _product.Price = product.Price;
            _product.Photo = product.Photo;
            _product.Detail = product.Detail;



            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int Id)
        {
            var _product = db.Products.Find(Id);
            db.Products.Remove(_product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}