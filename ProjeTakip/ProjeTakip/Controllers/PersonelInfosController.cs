using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjeTakip.Model.DataContext;
using ProjeTakip.Model.Personel;

namespace ProjeTakip.Controllers
{
    public class PersonelInfosController : Controller
    {
        private ProjectTraceDBContext db = new ProjectTraceDBContext();

        public ActionResult Index()
        {
            return View(db.PersonelInfos.ToList());
        }

        public ActionResult PersonelCard()
        {
            return View(db.PersonelInfos.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonelInfos personelInfos = db.PersonelInfos.Find(id);
            if (personelInfos == null)
            {
                return HttpNotFound();
            }
            return View(personelInfos);
        }


        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PersonelInfos personelInfos)
        {
            if (ModelState.IsValid)
            {
                db.PersonelInfos.Add(personelInfos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(personelInfos);
        }

        // GET: PersonelInfos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonelInfos personelInfos = db.PersonelInfos.Find(id);
            if (personelInfos == null)
            {
                return HttpNotFound();
            }
            return View(personelInfos);
        }

        // POST: PersonelInfos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(PersonelInfos personelInfos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(personelInfos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(personelInfos);
        }

        //// GET: PersonelInfos/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    PersonelInfos personelInfos = db.PersonelInfos.Find(id);
        //    if (personelInfos == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(personelInfos);
        //}

        // POST: PersonelInfos/Delete/5

        public ActionResult Delete(int? id)
        {
            if (id == null || id==0)
            {
                return HttpNotFound();
            }
            var t = db.PersonelInfos.Find(id);
            db.PersonelInfos.Remove(t);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
