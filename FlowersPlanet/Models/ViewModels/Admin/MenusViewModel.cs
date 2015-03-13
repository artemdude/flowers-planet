using System.Linq;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models.ViewModels.Admin
{
    public class MenusViewModel
    {
        public IQueryable<Menu> Menus { get; set; }
    }
}