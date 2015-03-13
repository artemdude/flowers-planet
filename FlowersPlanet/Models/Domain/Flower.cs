using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace FlowersPlanet.Models.Domain
{
    [MetadataType(typeof(FlowerValidation))]
    public partial class Flower: IMeta
    {
        public override string ToString()
        {
            return string.Format("Id = {0}, Name = {1}, Price = {2}, Url = {3}", Id, Name, Price, Url);
        }
    }

    [Bind(Exclude = "Id")]
    public class FlowerValidation
    {
        
    }
}