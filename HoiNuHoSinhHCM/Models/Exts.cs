using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.WebPages.Html;

namespace HoiNuHoSinhHCM.Models
{
    public static class Exts
    {
        public static string GetCompanyName()
        {
            return WebConfigurationManager.AppSettings["CompanyName"];
        }

        public static string ToAscii(this string vnstring)
        {
            String s = vnstring.ToLower();
            s = Regex.Replace(s, "[áàảạãăắằẳặẵâấầậẩẫ]", "a");
            s = Regex.Replace(s, "[éèẻẽẹêếềểễệ]", "e");
            s = Regex.Replace(s, "[đ]", "d");
            s = Regex.Replace(s, "[íìỉĩị]", "i");
            s = Regex.Replace(s, "[úùủũụưừứửữự]", "u");
            s = Regex.Replace(s, "[óòỏõọôốồổỗộơớờởỡợ]", "o");
            s = Regex.Replace(s, "\\s+", "-");
            s = Regex.Replace(s, "/", "-");
            s = Regex.Replace(s, "[%,?:!^–*>''<@$&()+=/,~“”]", "");
            s = Regex.Replace(s, " ", "-");
            s = Regex.Replace(s, "[.]", "-");
            s = Regex.Replace(s, "[\"]", "");
            return s;
        }

        public static byte[] encryptData(string data)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] hashedBytes;
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(data));
            return hashedBytes;
        }
        public static string md5(string data)
        {
            return BitConverter.ToString(encryptData(data)).Replace("-", "").ToLower();
        }

        public static ExpandoObject ToExpando(this object anonymousObject)
        {
            IDictionary<string, object> anonymousDictionary = HtmlHelper.AnonymousObjectToHtmlAttributes(anonymousObject);
            IDictionary<string, object> expando = new ExpandoObject();
            foreach (var item in anonymousDictionary)
                expando.Add(item);
            return (ExpandoObject)expando;
        }
    }
}