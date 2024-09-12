using ProjeTakip.Model.ProjectTrace;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjeTakip.Model.Personel
{
    public class PersonelInfos
    {
        public PersonelInfos() 
        {
            this.PersonelProjectss = new HashSet<PersonelProjects>();
        }

        [Key]
        public int PersonelInfoId { get; set; }
        [DisplayName("E-MAIL")]
        public string EMail { get; set; }
        [DisplayName("PASSWORD")]
        [StringLength(25,ErrorMessage ="Maximum length of the password cannot be longer than 25 charachters.")]
        public string Password { get; set; }
        [DisplayName("AUTHORITY")]
        [StringLength(15, ErrorMessage = "Maximum length of the password cannot be longer than 15 charachters.")]
        public string Authority { get; set; }
        [DisplayName("NAME SURNAME")]
        [StringLength(50, ErrorMessage = "Maximum length of the password cannot be longer than 50 charachters.")]
        public string NameSurname { get; set; }
        [DisplayName("PERSONEL PHOTO")]
        public string PersonelPhoto { get; set; }

        [DisplayName("TC NO")]
        [StringLength(15, ErrorMessage = "Maximum length of the password cannot be longer than 15 charachters.")]
        public string TCNO { get; set; }
        [DisplayName("DEPARTMENT")]
        [StringLength(25, ErrorMessage = "Maximum length of the password cannot be longer than 25 charachters.")]
        public string Department { get; set; }
        [DisplayName("ASSIGNMENT")]
        [StringLength(25, ErrorMessage = "Maximum length of the password cannot be longer than 25 charachters.")]
        public string Assignment { get; set; }
        [DisplayName("POSITION DESCRIPTION")]
        public string PositionDescription { get; set; }
        [DisplayName("PERSONEL TELEPHONE NO")]
        [StringLength(15, ErrorMessage = "Maximum length of the password cannot be longer than 15 charachters.")]
        public string PersonelTelNo { get; set; }
        [DisplayName("PERSONEL ADDRESS")]
        public string PersonelAddress { get; set; }
        [DisplayName("MARITIAL STATUS")]
        [StringLength(15, ErrorMessage = "Maximum length of the password cannot be longer than 15 charachters.")]
        public string MaritialStatus{ get; set; }
        [DisplayName("YAKIN BILGISI")]
        [StringLength(15, ErrorMessage = "Maximum length of the password cannot be longer than 15 charachters.")]
        public string YakinBilgisi { get; set; }
        [DisplayName("YAKIN TC")]
        [StringLength(15, ErrorMessage = "Maximum length of the password cannot be longer than 15 charachters.")]
        public string YakinTC { get; set; }
        [DisplayName("YAKIN TEL NO")]
        [StringLength(15, ErrorMessage = "Maximum length of the password cannot be longer than 15 charachters.")]
        public string YakinTelNo { get; set; }
        [DisplayName("BIRTH DATE")]
        public DateTime BirthDate { get; set; }
        [DisplayName("FIRST DAY AT WORK")]
        public DateTime FirstDayAtWork { get; set; }
        public virtual ICollection<PersonelProjects> PersonelProjectss { get; set; }
    }
}