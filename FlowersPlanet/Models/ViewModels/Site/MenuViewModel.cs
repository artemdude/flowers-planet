using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels
{
    public class MenuViewModel : IFlowerListViewModel
    {
        public IQueryable<Flower> Flowers { get; set; }
        public Menu Menu { get; set; }
    }
}