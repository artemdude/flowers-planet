using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels
{
    public class OrderViewModel
    {
        public Flower Flower { get; set; }
        public OrderModel Order { get; set; }
    }
}