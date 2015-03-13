using System;
using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels
{
    public class SearchViewModel : IFlowerListViewModel
    {
        public IQueryable<Flower> Flowers
        {
           get;set;
        }

        public string SearchSrc
        {
            get; set;
        }

        public int Count
        {
            get; set;
        }
    }
}