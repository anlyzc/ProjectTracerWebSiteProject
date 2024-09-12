using ProjeTakip.Model.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjeTakip.Controllers
{
    public class DashboardController : Controller
    {
        private ProjectTraceDBContext db = new ProjectTraceDBContext();
        // GET: Dashboard
        public ActionResult Index()
        {
            int projectNum=db.PersonelProjects.Count();
            ViewBag.ProjectNum = projectNum;
            
            int completedProject=db.PersonelProjects.Where(p => p.IsCompleted==true).Count();
            ViewBag.CompletedProject = completedProject;

            int unCompletedProject=db.PersonelProjects.Where(p => p.IsCompleted==false).Count();
            ViewBag.UncompletedProject = unCompletedProject;

            var highPriorityProjects = db.PersonelProjects.Where(p => p.PriorityStatus == "High priority").Count();
            ViewBag.HighPriorityProjects = highPriorityProjects;
            
            var midPriorityProjects = db.PersonelProjects.Where(p => p.PriorityStatus == "Mid-priority").Count();
            ViewBag.MidPriorityProjects = midPriorityProjects; 
            
            var lowPriorityProjects = db.PersonelProjects.Where(p => p.PriorityStatus == "Low priority").Count();
            ViewBag.LowPriorityProjects = lowPriorityProjects;

            var succesfulAndHigh=db.PersonelProjects.Where(p=>p.IsCompleted==true && p.PriorityStatus == "High priority").Count();
            ViewBag.SuccesfulAndHigh = succesfulAndHigh;

            var succesfulAndMid=db.PersonelProjects.Where(p=>p.IsCompleted==true && p.PriorityStatus == "Mid-priority").Count();
            ViewBag.SuccesfulAndMid = succesfulAndMid;
            
            var succesfulAndLow=db.PersonelProjects.Where(p=>p.IsCompleted==true && p.PriorityStatus == "Low priority").Count();
            ViewBag.SuccesfulAndLow = succesfulAndLow;

            var personelProjectList = db.PersonelProjects.ToList();
            var personelCompletedProjectNum=new Dictionary<int, int>();//personelId and completedproject
            foreach(var personel in db.PersonelInfos.ToList())
            {
                int completedProjectNum = 0;
                foreach(var proje in personel.PersonelProjectss)
                {
                    if (proje.IsCompleted == true)
                    {
                        completedProjectNum++;
                    }
                }
                personelCompletedProjectNum[personel.PersonelInfoId]=completedProjectNum;
            }
            var orderedPersonelList = personelCompletedProjectNum.OrderByDescending(x => x.Value);
            var mostCompletedPersonelId = orderedPersonelList.First().Key;
            var mostCompletedPersonel=db.PersonelInfos.FirstOrDefault(p=>p.PersonelInfoId==mostCompletedPersonelId);
            ViewBag.MostCompletedPersonelInfo = mostCompletedPersonel.NameSurname;

            int mostCompletingProjectPersonelProjectNum = personelCompletedProjectNum[mostCompletedPersonelId];
            ViewBag.MostCompletingProjectPersonelProjectNum = mostCompletingProjectPersonelProjectNum;
            return View();
        }

        public ActionResult GeneralStatistics()
        {
            var personels=db.PersonelInfos.ToList();
            var personelProjects=db.PersonelProjects.ToList();
            var completedProjectsNum=new Dictionary<int, int>();
            var uncompletedProjectsNum=new Dictionary<int, int>();
            var totalProjectNum=new Dictionary<int, int>();
            foreach (var personel in personels)
            {
                int completedProjects = 0;
                int uncompletedProjects = 0;
                int totalProject = 0;
                foreach (var proje in personelProjects)
                {
                    if (proje.PersonelInfoss.Contains(personel))
                    {
                        totalProject++;
                        if(proje.IsCompleted)
                        {
                            completedProjects++;
                        }
                        else
                        {
                            uncompletedProjects++;
                        }
                    }
                }
                completedProjectsNum[personel.PersonelInfoId] = completedProjects;
                uncompletedProjectsNum[personel.PersonelInfoId] = uncompletedProjects;
                totalProjectNum[personel.PersonelInfoId]=totalProject;
            }
            ViewBag.CompletedProjectsNum=completedProjectsNum;
            ViewBag.UncompletedProjectsNum=uncompletedProjectsNum;
            ViewBag.TotalProjectNum=totalProjectNum;

            int projectNum = db.PersonelProjects.Count();
            ViewBag.ProjectNum = projectNum;

            int personelNum = db.PersonelInfos.Count();
            ViewBag.PersonelNum = personelNum;

            int completedProject = db.PersonelProjects.Where(p => p.IsCompleted == true).Count();
            ViewBag.CompletedProject = completedProject;

            int unCompletedProject = db.PersonelProjects.Where(p => p.IsCompleted == false).Count();
            ViewBag.UncompletedProject = unCompletedProject;

            var unsuccesfulAndHigh = db.PersonelProjects.Where(p => p.IsCompleted == false && p.PriorityStatus == "High priority").Count();
            ViewBag.UnsuccesfulAndHigh = unsuccesfulAndHigh;

            var unsuccesfulAndMid = db.PersonelProjects.Where(p => p.IsCompleted == false && p.PriorityStatus == "Mid-priority").Count();
            ViewBag.UnsuccesfulAndMid = unsuccesfulAndMid;

            return View(personels);
        }
    }
}