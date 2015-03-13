using System.Collections.Generic;
using System.Linq;
using System.Web;
using FlowersPlanet.Models;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Helpers.Routing
{
    public class MenuCollection
    {
        #region Variables

        private readonly IDataRepository dataRepository;

        #endregion

        #region Constructors

        //Dependency injection
        public MenuCollection(IDataRepository dataRepository)
        {
            this.dataRepository = dataRepository;
        }

        public MenuCollection()
            : this(new DataRepository())
        {
        }

        #endregion

        public IEnumerable<Menu> MenuUrlApplication
        {
            get
            {
                if (HttpContext.Current.Application["MenuCollection"] == null)
                {
                    HttpContext.Current.Application["MenuCollection"] = GetMenuUrl();
                }

                return (IEnumerable<Menu>)HttpContext.Current.Application["MenuCollection"];
            }
            private set
            {
                HttpContext.Current.Application["MenuCollection"] = value;
            }
        }

        private IEnumerable<Menu> GetMenuUrl()
        {
            return dataRepository.GetMenus().OrderBy(m => m.Id).ToList();
        }

        public void Update()
        {
            MenuUrlApplication = GetMenuUrl();
        }
    }
}