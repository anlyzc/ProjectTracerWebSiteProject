using System;
using System.Collections.Generic;
using System.Linq;
using ProjeTakip.Model.DataContext;
using System.Web;
using System.Web.Mvc;


namespace ProjeTakip.Controllers
{
    public class ProjectReportsController : Controller
    {
        public ProjectTraceDBContext db = new ProjectTraceDBContext();
        // GET: ProjectReports
        public ActionResult CompletedPriorityGroups()
        {
            return View();
        }
        public ActionResult VisualizeCompletedStatusGroups()
        {
            return Json(PriorityGroupType(),JsonRequestBehavior.AllowGet);
        }
        public List<ClassPriorityStatusAnalyse> PriorityGroupType()
        {
            List<ClassPriorityStatusAnalyse> cls= new List<ClassPriorityStatusAnalyse>();
            using (var c = new ProjectTraceDBContext())
                cls = c.PersonelProjects.Where(x => x.IsCompleted == true).GroupBy(p => p.PriorityStatus).Select(x => new ClassPriorityStatusAnalyse
                {
                    PriorityType=x.Key,
                    PriorityNumber=x.Count()
                }).ToList();
            return cls;
        }

        public ActionResult UncompletedPriorityGroups()
        {
            return View();
        }
        public ActionResult VisualizeUncompletedStatusGroups()
        {
            return Json(PriorityUncompletedGroupType(), JsonRequestBehavior.AllowGet);
        }
        public List<ClassPriorityStatusAnalyse> PriorityUncompletedGroupType()
        {
            List<ClassPriorityStatusAnalyse> cls = new List<ClassPriorityStatusAnalyse>();
            using (var c = new ProjectTraceDBContext())
                cls = c.PersonelProjects.Where(x => x.IsCompleted == false).GroupBy(p => p.PriorityStatus).Select(x => new ClassPriorityStatusAnalyse
                {
                    PriorityType = x.Key,
                    PriorityNumber = x.Count()
                }).ToList();
            return cls;
        }
        public ActionResult GeneralProjectReports()
        {
            return View();
        }
        public ActionResult Support()
        {
            var destek = db.PersonelInfos.Where(x => x.Department == "Management");
            return View(destek.ToList());
        }
    }
}