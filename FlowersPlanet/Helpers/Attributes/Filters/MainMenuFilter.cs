using System.Web.Mvc;
using FlowersPlanet.Constants;
using FlowersPlanet.Helpers.Routing;

namespace FlowersPlanet.Helpers.Attributes.Filters
{
    public class MainMenuFilter : ActionFilterAttribute
    {
        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            var viewResult = filterContext.Result as ViewResult;

            if (viewResult != null)
            {
                viewResult.ViewData[ViewDataStr.Menus] = (new MenuCollection()).MenuUrlApplication;
            }
        }
    }
}