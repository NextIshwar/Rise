using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(Gift.Startup4))]

namespace Gift
{
    public class Startup4
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();// For more information on how to configure your application, visit http://go.microsoft.com/fwlink/?LinkID=316888
        }
    }
}
