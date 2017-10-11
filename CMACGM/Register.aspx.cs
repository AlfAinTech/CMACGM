using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using CMACGM.Models;

namespace CMACGM
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LogInHyperLink.NavigateUrl = "Login";
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            // OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                LogInHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            CMACGMEntities1 db = new CMACGMEntities1();
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var manage = manager.FindByEmail(Email.Text);

            if(manage == null)
            {
                IdentityResult result = manager.Create(user, Password.Text);
                if (result.Succeeded)
                {
                    
                    AdminProfile newAdmin = new AdminProfile();
                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    newAdmin.FirstName = tb_firstName.Text;
                    newAdmin.FirstName = tb_lastName.Text;
                    newAdmin.AspNetUserId = user.Id;
                    db.AdminProfiles.Add(newAdmin);
                    db.SaveChanges();
                   
                    //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            }
            else
            {
                ErrorMessage.Text = "Provided email address is already registered. Please Enter a different email address.";
            }
            
            
        }
    }
}