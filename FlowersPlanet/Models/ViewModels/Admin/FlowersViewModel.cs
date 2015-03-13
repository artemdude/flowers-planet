using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels.Admin
{
    public class FlowersViewModel
    {
        public IQueryable<Flower> Flowers { get; set; }
    }
}