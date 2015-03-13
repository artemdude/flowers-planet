using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace FlowersPlanet.Models.Domain
{
    [MetadataType(typeof(TagValidation))]
    public partial class Tag : IMeta
    {
        public override string ToString()
        {
            return string.Format("Id = {0}, Name = {1}, Url = {2}", this.Id, this.Name, this.Url);
        }
    }

    [Bind(Exclude = "Id")]
    public class TagValidation
    {
        
    }
}