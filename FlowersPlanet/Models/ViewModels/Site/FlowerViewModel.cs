using System.Collections.Generic;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels
{
    public class FlowerViewModel
    {
        public Flower Flower { get; set; }
        public IEnumerable<Flower> MoreFlowers { get; set; } 
    }
}