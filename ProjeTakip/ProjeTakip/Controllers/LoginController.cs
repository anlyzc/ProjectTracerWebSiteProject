using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ProjeTakip.Model.DataContext;
using ProjeTakip.Model.Personel;

namespace ProjeTakip.Controllers
{
    public class LoginController : Controller
    {
        private ProjectTraceDBContext db = new ProjectTraceDBContext();

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(PersonelInfos admin)
        {
            var infos = db.PersonelInfos.FirstOrDefault(x => x.NameSurname == admin.NameSurname && x.Password == admin.Password);
            if (infos != null) 
            {
                FormsAuthentication.SetAuthCookie(infos.NameSurname, false);
                Session["User"] = infos.NameSurname.ToString();
                return RedirectToAction("Index","Dashboard");
            }
            else
            {
                return View();
            }
            
        }
        public ActionResult LogOut()
        {
            Session["User"] = null;
            Session.Abandon();
            return RedirectToAction("Index");
        }
    }
}
