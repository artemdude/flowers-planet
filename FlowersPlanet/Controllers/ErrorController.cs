using System.Web.Mvc;

namespace FlowersPlanet.Controllers
{
    public class ErrorController : Controller
    {
        public ActionResult Index()
        {
            return View("Error");
        }

        public ActionResult Error()
        {
            return View();
        }

        public ActionResult NotFound(string aspxerrorpath)
        {
            ViewData["error_path"] = aspxerrorpath;

            return View();
        }
    }
}
