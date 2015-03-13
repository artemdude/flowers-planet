using System;
using System.Collections.Generic;
using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels.Admin
{
    public class FlowerManageViewModel : IMetaViewModel
    {
        public Flower Flower { get; set; }

        public IQueryable<Tag> Tags { get; set;}

        public IEnumerable<int> SelectedTags { get; set; }

        public IMeta Object
        {
            get { return Flower; }
            set { Flower = (Flower)value; }
        }

    }
}
