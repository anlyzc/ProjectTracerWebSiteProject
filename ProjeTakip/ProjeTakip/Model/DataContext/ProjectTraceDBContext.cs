using ProjeTakip.Model.Personel;
using ProjeTakip.Model.ProjectTrace;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ProjeTakip.Model.DataContext
{
    public class ProjectTraceDBContext:DbContext
    {
        public ProjectTraceDBContext():base("ProjectTraceDB")
        { 

        }
        public DbSet<PersonelInfos> PersonelInfos { get; set; }
        public DbSet<PersonelProjects> PersonelProjects { get; set; }
    }
}