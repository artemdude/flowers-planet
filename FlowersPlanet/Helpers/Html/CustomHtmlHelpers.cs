using System.Web.Mvc;
using System.Web.Routing;

namespace FlowersPlanet.Helpers.Html
{
    public static class CustomHtmlHelpers
    {
        public static string Image(this HtmlHelper helper, string url)
        {
            return Image(helper, url, null);
        }

        public static string Image(this HtmlHelper helper, string url, object htmlAttributes)
        {
            // Create tag builder
            var builder = new TagBuilder("img");

            // Add attributes
            builder.MergeAttribute("src", url);
            builder.MergeAttributes(new RouteValueDictionary(htmlAttributes));

            // Render tag
            return builder.ToString(TagRenderMode.SelfClosing);
        }


        public static string RouteUrl(this HtmlHelper helper, string routeName)
        {
            return RouteUrl(helper, routeName, null);
        }


        public static string RouteUrl(this HtmlHelper helper, string routeName, object routeValues)
        {
            var urlHelper = new UrlHelper(helper.ViewContext.RequestContext);

            string url;

            if (routeValues == null)
            {
                url = urlHelper.RouteUrl(routeName);
            }
            else
            {
                url = urlHelper.RouteUrl(routeName, routeValues);
            }

            if (url == "/")
            {
                return url;
            }

            return url + "/";
        }
    }
}