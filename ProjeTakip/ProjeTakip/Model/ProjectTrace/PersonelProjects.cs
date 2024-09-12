using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Web;
using ProjeTakip.Model.Personel;

namespace ProjeTakip.Model.ProjectTrace
{
    public class PersonelProjects
    {
        public PersonelProjects() 
        {
            this.PersonelInfoss = new HashSet<PersonelInfos>();
        }
        [Key]
        public int PersonelProjeId { get; set; }
        [DisplayName("PROJECT HEADER")]
        [StringLength(150, ErrorMessage = "Maximum length of the password cannot be longer than 150 charachters.")]
        public string ProjectHeader { get; set; }
        [DisplayName("PROJECT DESCRIPTION")]
        public string ProjectDescription { get; set; }
        [DisplayName("CREATION DATE")]
        public DateTime CreationDate { get; set; }
        [DisplayName("PRIORITY STATUS")]
        [StringLength(25, ErrorMessage = "Maximum length of the password cannot be longer than 25 charachters.")]
        public string PriorityStatus { get; set; }
        [DisplayName("COMPLETION PERCENTAGE")]
        public int CompletionPercentage { get; set; }
        [DisplayName("COMPLETION DATE")]
        public DateTime? CompletionDate { get; set; }
        [DisplayName("COMPLETION STATUS")]
        public bool IsCompleted { get; set; }
        public virtual ICollection<PersonelInfos> PersonelInfoss { get; set; }
    }
}