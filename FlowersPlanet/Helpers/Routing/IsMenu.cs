using System.Linq;
using System.Web;
using System.Web.Routing;


namespace FlowersPlanet.Helpers.Routing
{
    public class IsMenu : IRouteConstraint
    {
        #region Implementation of IRouteConstraint

        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            if (!values.ContainsKey(parameterName))
            {
                return false;
            }

             var menuUrlCollection = new MenuCollection();

             if (menuUrlCollection.MenuUrlApplication.Select(t => t.Url).Contains(values[parameterName].ToString()))
            {
                return true;
            }

            return false;
        }

        #endregion

    }
}