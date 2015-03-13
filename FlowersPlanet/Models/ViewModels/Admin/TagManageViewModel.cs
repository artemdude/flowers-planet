using System.Collections.Generic;
using FlowersPlanet.Helpers.Routing;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels.Admin
{
    public class TagManageViewModel:IMetaViewModel
    {
        public Tag Tag { get; set; }

        public IEnumerable<Menu> Menus
        {
            get { return (new MenuCollection()).MenuUrlApplication; }
        }
 
        public IMeta Object
        {
            get { return Tag; }
            set { Tag = (Tag)value; }
        }
    }
}