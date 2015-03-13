using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels
{
    public class TagViewModel  : IFlowerListViewModel
    {
        public IQueryable<Flower> Flowers { get; set; }
        public Tag Tag {get; set;}
    }
}