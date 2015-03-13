using System;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using FlowersPlanet.Models;
using FlowersPlanet.Models.Domain;
using FlowersPlanet.Resources.Models.Account;

namespace FlowersPlanet.Controllers
{
    public class AccountController : Controller
    {
        private readonly IDataRepository dataRepository;
        private IMembershipService MembershipService { get; set; }
        private IFormsAuthenticationService FormsService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }

        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ValidateUser(model.UserName, model.Password))
                {
                    FormsService.SignIn(model.UserName, model.RememberMe);
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    return RedirectToAction("Index", "Home");

                }
                //будет показано через ValidationSummary
                ModelState.AddModelError("", ValidationStrings.IncorrectPasswordOrLogin);

            }

            return View(model);
        }

        public ActionResult LogOff()
        {
            FormsService.SignOut();

            return RedirectToRoute("Index");
        }


        //ChangePassword
        public ActionResult ChangePassword()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword))
                {
                    //Succes
                    //ModelState.AddModelError("", "Success");
                    return View();
                }
                //будет показано через ValidationSummary
                ModelState.AddModelError("", ValidationStrings.IncorrectPasswords);

            }

            return View(model);
        }

        [Authorize(Roles = "Admin")]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {

                MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    FormsService.SignIn(model.UserName, false);

                    return RedirectToAction("Index", "Home");
                }

                //будет показано через ValidationSummary
                ModelState.AddModelError("", CreateUserErrors.GetError(createStatus));

            }

            return View(model);
        }


        public ActionResult ChangeCulture(string lang, string returnUrl)
        {
            Session["Culture"] = new CultureInfo(lang);
            return Redirect(returnUrl);
        }
    }
}