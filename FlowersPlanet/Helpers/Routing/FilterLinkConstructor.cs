namespace FlowersPlanet.Helpers.Routing
{
    public class FilterLinkConstructor
    {
        public static string GetLink(string priceFilter, string sortBy)
        {
            if (string.IsNullOrEmpty(priceFilter) && string.IsNullOrEmpty(sortBy))
            {
                return "";
            }

            if(string.IsNullOrEmpty(priceFilter))
            {
                return string.Format("?sortBy={0}", sortBy);
            }

            if(string.IsNullOrEmpty(sortBy))
            {
                return string.Format("?priceFilter={0}", priceFilter);
            }

            return string.Format("?sortBy={0}&priceFilter={1}", sortBy,priceFilter);

        }
    }
}