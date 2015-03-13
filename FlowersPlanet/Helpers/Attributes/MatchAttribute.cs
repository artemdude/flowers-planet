using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;

namespace FlowersPlanet.Helpers.Attributes
{
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = true)]
    public class MatchAttribute : ValidationAttribute
    {
        public string ConfirmProperty { get; set; }
        public string OriginalProperty { get; set; }

        public override string FormatErrorMessage(string name)
        {
            return string.Format(CultureInfo.CurrentCulture, ErrorMessageString, OriginalProperty, ConfirmProperty);
        }

        public override bool IsValid(object value)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(value);

            object originalValue = properties.Find(OriginalProperty, true).GetValue(value);
            object confirmValue = properties.Find(ConfirmProperty, true).GetValue(value);
            return Equals(originalValue, confirmValue);
        }
    }
}