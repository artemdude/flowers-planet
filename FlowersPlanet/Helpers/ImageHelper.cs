using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;

namespace FlowersPlanet.Helpers
{
    public class ImageHelper
    {
        #region ResizeImage

        public byte[] GetSmallImage(byte[] imgByte)
        {
            return GetSmallImage(new MemoryStream(imgByte));
        }

        public byte[] GetSmallImage(byte[] imgByte, int width, int height)
        {
            return GetSmallImage(new MemoryStream(imgByte), width, height);
        }

        public byte[] GetMiniImage(byte[] imgByte)
        {
            return GetMiniImage(new MemoryStream(imgByte));
        }

        public byte[] GetSmallImage(Stream stream, int width, int height)
        {
            //int newWidth = int.Parse(ConfigurationManager.AppSettings["SmallImgWidth"]);
            //int newHeight = int.Parse(ConfigurationManager.AppSettings["SmallImgHeight"]);

            Bitmap originalBmp = new Bitmap(stream);

            Bitmap newBmp = new Bitmap(width, height);

            Graphics oGraphics = Graphics.FromImage(newBmp);

            oGraphics.DrawImage(originalBmp, new Rectangle(0, 0, width, height));

            MemoryStream ms = new MemoryStream();

            newBmp.Save(ms, ImageFormat.Jpeg);

            byte[] bmpBytes = ms.GetBuffer();

            newBmp.Dispose();
            ms.Dispose();

            return bmpBytes;
        }

        //resize image to 100x100px
        public byte[] GetSmallImage(Stream stream)
        {
            int newWidth = int.Parse(ConfigurationManager.AppSettings["SmallImgWidth"]);
            int newHeight = int.Parse(ConfigurationManager.AppSettings["SmallImgHeight"]);

            return GetSmallImage(stream, newWidth, newHeight);
        }

        public byte[] GetMiniImage(Stream stream)
        {
            int newWidth = int.Parse(ConfigurationManager.AppSettings["MiniImgWidth"]);
            int newHeight = int.Parse(ConfigurationManager.AppSettings["MiniImgHeight"]);

            return GetSmallImage(stream, newWidth, newHeight);
        }

        #endregion


        /// <summary>
        /// Validate image
        /// </summary>
        /// <param name="file"></param>
        /// <param name="status">null if image is correct</param>
        /// <returns></returns>
        public bool IsImageValid(HttpPostedFileBase file, out string status)
        {
            status = null;

            if (!(file.ContentType == "image/jpeg" || file.ContentType == "image/png"))
            {
                status = "Это не картинка";

                return false;
            }

            if (file.ContentLength > 1000000)
            {
                status = "Слишком большая";

                return false;
            }

            //if (Image.FromStream(file.InputStream).Width > 600 || Image.FromStream(file.InputStream).Height > 600)
            //{
            //    status = "Неподходящий размер";

            //    return false;
            //}

            return true;
        }
    }
}