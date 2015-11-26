using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HoiNuHoSinhHCM.Startup))]
namespace HoiNuHoSinhHCM
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
