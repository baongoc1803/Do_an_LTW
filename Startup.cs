using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using NguyenThiBaoNgoc_Do_An.Identity;
using Owin;

[assembly: OwinStartup(typeof(NguyenThiBaoNgoc_Do_An.Startup))]

namespace NguyenThiBaoNgoc_Do_An
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCookieAuthentication(new CookieAuthenticationOptions()
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login")
            });
            this.CreateRolesAndUser();
        }
        public void CreateRolesAndUser()
        {
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new AppDBContext()));
            var appdbcontext = new AppDBContext();
            var appUserStore = new AppUserStore(appdbcontext);
            var userManager = new AppUserManager(appUserStore);
            if (!roleManager.RoleExists("admin"))
            {
                var role = new IdentityRole();
                role.Name = "admin";
                roleManager.Create(role);
            }
            if (userManager.FindByName("admin") == null)
            {
                var user = new AppUser();
                user.UserName = "admin";
                user.Email = "admin@gmail.com";
                string userPassword = "admin123";

                var checkUser = userManager.Create(user, userPassword);
                if (checkUser.Succeeded)
                {
                    userManager.AddToRole(user.Id, "admin");
                }
            }
            //manager
            if (!roleManager.RoleExists("Manager"))
            {
                var role = new IdentityRole();
                role.Name = "Manager";
                roleManager.Create(role);
            }
            if (userManager.FindByName("Manager") == null)
            {
                var user = new AppUser();
                user.UserName = "Manager";
                user.Email = "manager@gmail.com";
                string userPassword = "manager123";

                var checkUser = userManager.Create(user, userPassword);
                if (checkUser.Succeeded)
                {
                    userManager.AddToRole(user.Id, "Manager");
                }

            }
            if (!roleManager.RoleExists("Customer"))
            {
                var role = new IdentityRole();
                role.Name = "Customer";
                roleManager.Create(role);
            }
        }
    }
}
