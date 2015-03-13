using System.IO;
using System.Web;
using System.Web.Mvc;

namespace FlowersPlanet.Helpers
{
    public enum ImageSize
    {
        Normal,
        Small,
        Mini
    }

    public class ImageResult : ActionResult
    {
        private byte[] image;
        private ImageSize imageSize;

        public ImageResult(byte[] image) : this(image,ImageSize.Normal)
        {
            this.image = image;
        }

        public ImageResult(byte[] image, ImageSize imageSize)
        {
            this.image = image;
            this.imageSize = imageSize;
        }

        #region Overrides of ActionResult

        public override void ExecuteResult(ControllerContext context)
        {
            var response = context.HttpContext.Response;
            response.Clear();
            response.Cache.SetCacheability(HttpCacheability.NoCache);

            if (image != null)
            {

                ImageHelper imageHelper = new ImageHelper();

                if(imageSize == ImageSize.Small)
                {
                   image = imageHelper.GetSmallImage(image);
                }

                if (imageSize == ImageSize.Mini)
                {
                    image = imageHelper.GetMiniImage(image);
                }

                using (var stream = new MemoryStream(image))
                {
                    stream.WriteTo(response.OutputStream);
                }
            }
        }

        #endregion
    }
}