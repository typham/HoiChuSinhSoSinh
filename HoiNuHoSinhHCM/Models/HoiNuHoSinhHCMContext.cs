using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace HoiNuHoSinhHCM.Models
{
    public class HoiNuHoSinhHCMContext:DbContext
    {
        public DbSet<Common> Common { get; set; }
        public DbSet<NewsCategory> NewsCategory { get; set; }
        public DbSet<News> News { get; set; }
        public DbSet<Document> Document { get; set; }
        public DbSet<Conference> Conference { get; set; }
        public DbSet<User> User { get; set; }
    }

    [Table("Common")]
    public class Common
    {
        public int Id { get; set; }
        public string Image { get; set; }
        public string GroupID { get; set; }
        public string Note { get; set; }
    }

    [Table("NewsCategory")]
    public class NewsCategory
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Content { get; set; }
        public string Note { get; set; }
        public int? Order { get; set; }
        public string GroupID { get; set; }
        public virtual List<News> Newss { get; set; }
    }

    [Table("News")]
    public class News
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Summary { get; set; }
        public string Content { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int CategoryId { get; set; }
        public bool IsFeatured { get; set; }
        public bool IsDisplay { get; set; }
        public bool IsDeleted { get; set; }
        [ForeignKey("CategoryId")]
        public virtual NewsCategory NewsCategory { get; set; }
    }

    [Table("Document")]
    public class Document
    {
        public int Id { get; set; }
        public int ConfigGroup { get; set; }
        public string Name { get; set; }
        public string Note { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string LinkDownload { get; set; }
    }

    [Table("Conference")]
    public class Conference
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime? Date { get; set; }
        public string Note { get; set; }
        [Required]
        public string MemberName { get; set; }
        [Required]
        public DateTime? Birthday { get; set; }
        public bool Gender { get; set; }
        [Required]
        public string PhoneNumber { get; set; }
        [Required]
        public int? ConferenceId { get; set; }
    }

    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string IdentityCard { get; set; }
    }

    public class LoginModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}