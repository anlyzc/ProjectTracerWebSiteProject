using ProjeTakip.Model.DataContext;
using ProjeTakip.Model.ProjectTrace;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjeTakip.Controllers
{
    public class PersonelProjectsController : Controller
    {
        private ProjectTraceDBContext db = new ProjectTraceDBContext();
        // GET: PersonelProjects
        public ActionResult Index()
        {
            var projectList=db.PersonelProjects.ToList();
            return View(projectList);
        }
        public ActionResult Create() 
        {
            ViewBag.PersonelInfoId = new SelectList(db.PersonelInfos, "PersonelInfoId", "NameSurname");
            return View();
        }
        [HttpPost]
        public ActionResult Create(PersonelProjects projectObj,int[] personelInfoId)
        {
            foreach(var x in personelInfoId)
            {
                projectObj.PersonelInfoss.Add(db.PersonelInfos.Find(x));
            }
            projectObj.CreationDate=DateTime.Now;
            db.PersonelProjects.Add(projectObj);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            var projectObj = db.PersonelProjects.Find(id);
            return View(projectObj);
        }
        [HttpPost]
        public ActionResult Edit(PersonelProjects projectObj) 
        {
            var projectDbObj = db.PersonelProjects.Find(projectObj.PersonelProjeId);
            projectDbObj.ProjectDescription=projectObj.ProjectDescription;
            projectDbObj.ProjectHeader=projectObj.ProjectHeader;
            projectDbObj.CompletionPercentage=projectObj.CompletionPercentage;
            projectDbObj.PriorityStatus=projectObj.PriorityStatus;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Complete(int id)
        {
            var projectOBj=db.PersonelProjects.Find(id);
            projectOBj.IsCompleted=true;
            projectOBj.CompletionPercentage = 100;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}