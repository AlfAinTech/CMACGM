using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CMACGM.Startup))]
namespace CMACGM
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
