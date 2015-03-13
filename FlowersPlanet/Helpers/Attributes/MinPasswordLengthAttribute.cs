using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Security;

namespace FlowersPlanet.Helpers.Attributes
{
    public class MinPasswordLengthAttribute : ValidationAttribute 
    {

        private int Min { get; set; }

        public MinPasswordLengthAttribute()
        {
            Min = Membership.Provider.MinRequiredPasswordLength;
        }

        public override string FormatErrorMessage(string name)
        {
            return string.Format(CultureInfo.CurrentCulture, ErrorMessageString, new object[] { name, Min });
        }


        public override bool IsValid(object value)
        {

            if (value == null)
            {
                return true;
            }

            if (value.ToString().Length < Min)
            {
                return false;
            }

            return true;

        }
    }
}