using System.Web.Mvc;
using FlowersPlanet.Helpers;
using FlowersPlanet.Models;

namespace FlowersPlanet.Controllers
{
    public class PhotoController : Controller
    {
        private readonly IDataRepository dataRepository;

        #region Constructors

        public PhotoController(IDataRepository dataRepository)
        {
            this.dataRepository = dataRepository;
        }

        public PhotoController() : this(new DataRepository())
        {}

        #endregion


        public ActionResult ShowPhoto(int id,string size)
        {
            switch (size)
            {   
                case "Small":
                    return new ImageResult(dataRepository.GetImage(id), ImageSize.Small);
                case "Mini":
                    return new ImageResult(dataRepository.GetImage(id), ImageSize.Mini);
                default:
                    return new ImageResult(dataRepository.GetImage(id));
            }
        }
    }
}
