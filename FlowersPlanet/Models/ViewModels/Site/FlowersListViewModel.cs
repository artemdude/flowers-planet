using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels
{
    public class FlowersListViewModel
    {
        public IQueryable<Flower> Flowers { get; set; }
    }
}