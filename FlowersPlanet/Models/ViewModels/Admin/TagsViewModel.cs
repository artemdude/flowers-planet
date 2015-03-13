using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels.Admin
{
    public class TagsViewModel
    {
        public IQueryable<Tag> Tags { get; set; }
    }
}