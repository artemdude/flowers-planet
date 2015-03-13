using System;
using System.ComponentModel.DataAnnotations;
using System.Web.Security;
using FlowersPlanet.Helpers;
using FlowersPlanet.Helpers.Attributes;
using FlowersPlanet.Resources.Models.Account;

namespace FlowersPlanet.Models.Domain
{
    public class LogOnModel
    {
        [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
        [LocalizedDisplayName("UserName", NameResourceType = typeof(FieldNames))]
        public string UserName { get; set; }

        [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
        [DataType(DataType.Password)]
        [LocalizedDisplayName("Password", NameResourceType = typeof(FieldNames))]
        public string Password { get; set; }

        [LocalizedDisplayName("RememberMe", NameResourceType = typeof(FieldNames))]
        public bool RememberMe { get; set; }
    }

    [Match(OriginalProperty = "NewPassword", ConfirmProperty = "ConfirmPassword", ErrorMessage = "The {0} and {1} do not match.")]
    public class ChangePasswordModel
    {
        [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
        [DataType(DataType.Password)]
        [LocalizedDisplayName("CurrentPassword", NameResourceType = typeof(FieldNames))]
        public string OldPassword { get; set; }

        [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
        [DataType(DataType.Password)]
        [MinPasswordLength(ErrorMessageResourceName = "MinPasswordLength", ErrorMessageResourceType = typeof(ValidationStrings))]
        [LocalizedDisplayName("NewPassword", NameResourceType = typeof(FieldNames))]
        public string NewPassword { get; set; }

        [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
        [MinPasswordLength(ErrorMessageResourceName = "MinPasswordLength", ErrorMessageResourceType = typeof(ValidationStrings))]
        [DataType(DataType.Password)]
        [LocalizedDisplayName("ConfirmPassword", NameResourceType = typeof(FieldNames))]
        public string ConfirmPassword { get; set; }
    }

    public class RegisterModel
    {
        [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
        [LocalizedDisplayName("UserName", NameResourceType = typeof(FieldNames))]
        public string UserName { get; set; }

        [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
        [RegularExpression("^[a-zA-Z][\\w\\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\\w\\.-]*[a-zA-Z0-9]\\.[a-zA-Z][a-zA-Z\\.]*[a-zA-Z]$", ErrorMessageResourceName = "IncorrectEmail", ErrorMessageResourceType = typeof(ValidationStrings))]
        [DataType(DataType.EmailAddress)]
        [LocalizedDisplayName("Email", NameResourceType = typeof(FieldNames))]
        public string Email { get; set; }

        [Required(ErrorMessageResourceName = "Required", ErrorMessageResourceType = typeof(ValidationStrings))]
        [MinPasswordLength(ErrorMessageResourceName = "MinPasswordLength", ErrorMessageResourceType = typeof(ValidationStrings))]
        [DataType(DataType.Password)]
        [LocalizedDisplayName("Password", NameResourceType = typeof(FieldNames))]
        public string Password { get; set; }
    }

    public interface IMembershipService
    {
        int MinPasswordLength { get; }

        bool ValidateUser(string userName, string password);
        MembershipCreateStatus CreateUser(string userName, string password, string email);
        bool ChangePassword(string userName, string oldPassword, string newPassword);
    }

    public class AccountMembershipService : IMembershipService
    {
        private readonly MembershipProvider _provider;

        //для тестирования
        public AccountMembershipService()
            : this(null)
        {

        }

        public AccountMembershipService(MembershipProvider provider)
        {
            _provider = provider ?? Membership.Provider;
        }

        public int MinPasswordLength
        {
            get
            {
                return _provider.MinRequiredPasswordLength;
            }
        }

        public bool ValidateUser(string userName, string password)
        {
            if (String.IsNullOrEmpty(userName))
            {
                throw new ArgumentException("Value cannot be null or empty.", "userName");
            }

            if (String.IsNullOrEmpty(password))
            {
                throw new ArgumentException("Value cannot be null or empty.", "password");
            }

            return _provider.ValidateUser(userName, password);
        }

        public MembershipCreateStatus CreateUser(string userName, string password, string email)
        {
            if (String.IsNullOrEmpty(userName))
            {
                throw new ArgumentException("Value cannot be null or empty.", "userName");
            }

            if (String.IsNullOrEmpty(password))
            {
                throw new ArgumentException("Value cannot be null or empty.", "password");
            }

            if (String.IsNullOrEmpty(email))
            {
                throw new ArgumentException("Value cannot be null or empty.", "email");
            }

            MembershipCreateStatus status;
            _provider.CreateUser(userName, password, email, null, null, true, null, out status);
            return status;
        }

        public bool ChangePassword(string userName, string oldPassword, string newPassword)
        {
            if (String.IsNullOrEmpty(userName))
            {
                throw new ArgumentException("Value cannot be null or empty.", "userName");
            }

            if (String.IsNullOrEmpty(oldPassword))
            {
                throw new ArgumentException("Value cannot be null or empty.", "oldPassword");
            }

            if (String.IsNullOrEmpty(newPassword))
            {
                throw new ArgumentException("Value cannot be null or empty.", "newPassword");
            }


            try
            {
                MembershipUser currentUser = _provider.GetUser(userName, true);
                return currentUser.ChangePassword(oldPassword, newPassword);
            }
            catch
            {
                return false;
            }
        }
    }

    public interface IFormsAuthenticationService
    {
        void SignIn(string userName, bool createPersistentCookie);
        void SignOut();
    }

    public class FormsAuthenticationService : IFormsAuthenticationService
    {
        public void SignIn(string userName, bool createPersistentCookie)
        {
            if (String.IsNullOrEmpty(userName))
            {
                throw new ArgumentException("Value cannot be null or empty.", "userName");
            }

            FormsAuthentication.SetAuthCookie(userName, createPersistentCookie);
        }

        public void SignOut()
        {
            FormsAuthentication.SignOut();
        }
    }

    public static class CreateUserErrors
    {
        public static string GetError(MembershipCreateStatus createStatus)
        {
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return ValidationStrings.DuplicateUserName;

                case MembershipCreateStatus.DuplicateEmail:
                    return ValidationStrings.DuplicateEmail;

                case MembershipCreateStatus.InvalidPassword:
                    return ValidationStrings.InvalidPassword;

                case MembershipCreateStatus.InvalidEmail:
                    return ValidationStrings.InvalidEmail;

                case MembershipCreateStatus.InvalidAnswer:
                    return ValidationStrings.InvalidAnswer;

                case MembershipCreateStatus.InvalidQuestion:
                    return ValidationStrings.InvalidQuestion;

                case MembershipCreateStatus.InvalidUserName:
                    return ValidationStrings.InvalidUserName;

                case MembershipCreateStatus.ProviderError:
                    return ValidationStrings.ProviderError;

                case MembershipCreateStatus.UserRejected:
                    return ValidationStrings.UserRejected;

                default:
                    return ValidationStrings.UnknownError;
            }
        }
    }
}