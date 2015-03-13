using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels
{
    public class IndexViewModel : IFlowerListViewModel
    {
        public IQueryable<Flower> Flowers
        {
            get; set;
        }
    }
}