using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels
{
    public interface IFlowerListViewModel
    {
         IQueryable<Flower> Flowers { get; set; }
    }
}