using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels.Admin
{
    public class MenuManageViewModel : IMetaViewModel
    {
        public Menu Menu { get; set; }

        public IMeta Object
        {
            get { return this.Menu; }
            set { this.Menu = (Menu)value; }
        }
    }
}