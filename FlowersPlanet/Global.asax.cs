using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using FlowersPlanet.Helpers.Routing;

namespace FlowersPlanet
{
    public class MvcApplication : HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //todo: add regEx
            routes.IgnoreRoute("robots.txt");
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Index", // Route name
                "", // URL with parameters
                new {controller = "Site", action = "Index"} // Parameter defaults
                );

            routes.MapRoute(
                "IndividualOrder",
                "individual-order",
                new {controller = "Site", action = "IndividualOrder"}
                );

            routes.MapRoute(
                "DeliveryAndPayment",
                "delivery-and-payment",
                new {controller = "Site", action = "DeliveryAndPayment"}
                );

            routes.MapRoute(
                "AboutUs",
                "about-us",
                new {controller = "Site", action = "AboutUs"}
                );

            routes.MapRoute(
                "Contacts",
                "contacts",
                new {controller = "Site", action = "Contacts"}
                );

            routes.MapRoute(
                "FeedBack",
                "feed-back",
                new { controller = "Site", action = "FeedBack" }
                );

            

            routes.MapRoute(
                "Search",
                "search/{searchSrc}/",
                new {controller = "Site", action = "Search", searchSrc = UrlParameter.Optional}
                );

            routes.MapRoute(
                "Order",
                "order/{url}/",
                new {controller = "Site", action = "Order", url = UrlParameter.Optional}
                );


            routes.MapRoute(
                "ShowPhoto",
                "photo/{size}/{id}",
                new {controller = "Photo", action = "ShowPhoto", size = UrlParameter.Optional, id = UrlParameter.Optional} // Parameter defaults
                );



            routes.MapRoute(
             "Account", // Route name
             "account/{action}/{id}", // URL with parameters
             new { controller = "Account", action = "LogOn", id = UrlParameter.Optional } // Parameter defaults
             );

            routes.MapRoute(
            "Error", // Route name
            "Error/{action}/{id}", // URL with parameters
            new { controller = "Error", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );



            routes.MapRoute(
                "Admin",
                "Admin/{action}/{id}/",
                new {controller = "Admin", action = "Index", id = UrlParameter.Optional}
                );

                    routes.MapRoute(
             "Menu",
             "{menuUrl}",
             new { controller = "Site", action = "Menu", menuUrl = UrlParameter.Optional },
             new { menuUrl = new IsMenu() }
             );

            routes.MapRoute(
                "Flower",
                "{url}/",
                new { controller = "Site", action = "Flower", url = UrlParameter.Optional }
                );


            routes.MapRoute(
             "Tag",
             "{menuUrl}/{tagUrl}",
             new { controller = "Site", action = "Tag", menuUrl = UrlParameter.Optional, tagUrl = UrlParameter.Optional },
             new { menuUrl = new IsMenu() }
             );

 
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);

            //Routing debug
            //RouteDebugger.RewriteRoutesForTesting(RouteTable.Routes);
        }
    }
}