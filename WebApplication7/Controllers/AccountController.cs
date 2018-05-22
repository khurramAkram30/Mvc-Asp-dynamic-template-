using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication7.Controllers
{
    public class AccountController : Controller
    {
        ShoppingCartEntities db = new ShoppingCartEntities();
        // GET: Account
        public ActionResult login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult login(string Email, String Password)
        {

            var user = db.Users.FirstOrDefault(u => u.Email == Email && u.Password == Password);

            if (user != null)
            {
                Session["id"] = user.Id;
                return RedirectToAction("index", "Categories");
            }
            else
            {
                TempData["message"] = "invalid email or password";
                return RedirectToAction("login");
            }

        }




        public ActionResult Register()
        {
            return View();
        }
            
        [HttpPost]
        public ActionResult Register(string Name, string Email, string Password)
        {

            var user = new User();

            user.Name = Name;

            user.Email = Email;

            user.Password = Password;

            user.UserTypeId = 1;

            db.Users.Add(user);

            db.SaveChanges();

            return RedirectToAction("login");
        }

        
    }
}