using System;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using FlowersPlanet.Constants;
using FlowersPlanet.Helpers;
using FlowersPlanet.Helpers.Attributes.Filters;
using FlowersPlanet.Helpers.Enums;
using FlowersPlanet.Models;
using FlowersPlanet.Models.ViewModels;

namespace FlowersPlanet.Controllers
{
   [HandleError]
    public class SiteController : Controller
    {
        #region Variables

        private readonly IDataRepository dataRepository;

        #endregion

        #region Constructors

        //Dependency injection
        public SiteController(IDataRepository dataRepository)
        {
            this.dataRepository = dataRepository;
        }

        public SiteController() : this(new DataRepository())
        {
        }

        #endregion


        [MainMenuFilter]
        public ActionResult Index()
        {
            var model = new IndexViewModel();

            model.Flowers = dataRepository.GetNumberOfFlowers(dataRepository.GetFlowers(),0,15);

            return View(model);
        }

        [MainMenuFilter]
        public ActionResult Flower(string url)
        {
            if (url == null)
            {
                throw new HttpException(404, "url can't be null");
            }

            var model = new FlowerViewModel();

            var flower = dataRepository.GetFlower(url);

            if (flower != null)
            {
                model.Flower = dataRepository.GetFlower(url);
                model.MoreFlowers = dataRepository.GetRandomFlower(flower.Id, 2);
            }
            else
            {
                throw new HttpException(404, string.Format("Flower with url = {0} does not exist", url));
            }

            return View(model);
        }

        [MainMenuFilter]
        public ActionResult Order(string url)
        {
            if (url == null)
            {
                throw new HttpException(404, "url can't be null");
            }

            var model = new OrderViewModel
                            {
                                Flower = dataRepository.GetFlower(url),
                                Order = new OrderModel() {Quantity = 1, Card = true}
                            };

            if (model.Flower == null)
            {
                throw new HttpException(404, string.Format("Flower with url = {0} does not exist", url));
            }

            return View(model);
        }


        [HttpPost, MainMenuFilter]
        public ActionResult Order(OrderViewModel modifiedModel, string url)
        {
            const string subject = "Заказ букета";
            var recipients = new[] { ConfigurationManager.AppSettings["Mailbox"] };
            var sender = string.Format("{0} <{1}>", "flowersplanet", "bloom@flowersplanet.com.ua");

            var body = new StringBuilder();

            body.Append(string.Format(@"<h2>Информация о заказчике:</h2>
                                     <b>Имя</b> {0}<br />
                                     <b>Mail</b> {1}<br />
                                     <b>Телефон</b> {2}<br />
                                     <b>Адрес</b> {3}<br />
                                     <b>Время доставки</b> {4} <br />
                                     <b>Примечания</b> {5}<br />
                                     <h2>Информация получателя:</h2>
                                     <b>Имя</b> {6}<br />
                                     <b>Телефон</b> {7}<br />
                                     <b>Адрес</b> {8}<br /><br />",
                                                             string.IsNullOrEmpty(modifiedModel.Order.SenderName) ? "Аноним" : modifiedModel.Order.SenderName,
                                                             string.IsNullOrEmpty(modifiedModel.Order.SenderMail) ? "Не указано" : modifiedModel.Order.SenderMail,
                                                             modifiedModel.Order.SenderPhone,
                                                             modifiedModel.Order.SenderAddress,
                                                             modifiedModel.Order.DeliveryDate,
                                                             modifiedModel.Order.SenderNotes,
                                                             modifiedModel.Order.RecipientName,
                                                             modifiedModel.Order.RecipientPhone,
                                                             modifiedModel.Order.RecipientAddress));
            
            if (modifiedModel.Order.Card)
            {
                body.Append(string.Format(@"<h2>Открытка</h2> 
                                              <b>Кому</b> {0}<br />
                                              <b>От кого</b> {1}<br />
                                              <b>Сообщение</b> {2}<br />
                                              <b>Примечания</b> {3}<br /><br />",
                                                               modifiedModel.Order.CardTo,
                                                               modifiedModel.Order.CardFrom,
                                                               modifiedModel.Order.CardMessage,
                                                               modifiedModel.Order.CardNotes));
            }

            var flower = dataRepository.GetFlower(url);

            body.Append(string.Format(@"<h2>Букет:</h2>
                                          <b>Название</b> <a href='{5}/{6}/'>{0}</a><br />
                                          <b>Код</b> {1}<br />
                                          <b>Количество</b> {2}<br />
                                          <b>Стоимость</b> {3}{4}",
                                                             flower.Name,
                                                             flower.Id,
                                                             modifiedModel.Order.Quantity,
                                                             modifiedModel.Order.Quantity * flower.Price + Delivery.Courier,Currency.Grivna,
                                                             ConfigurationManager.AppSettings["Domain"], flower.Url));



            Mail.Send(subject, body.ToString(), sender, recipients, null);

            //SendOrderBackMail(modifiedModel.Order.SenderMail);

            return View();
        }

        private static void SendOrderBackMail(string recipientMail)
        {
            const string subject = "Заказ принят";
            const string body = "Спасибо за то что воспользовались услугами ФлаверсПленет. Наш менеджер свяжется с Вами в ближайшее время.<br /><br /> С уважением, команда ФлаверсПленет";
            var sender = string.Format("{0} <{1}>", "flowersplanet", "noreply@flowersplanet.com.ua");

            if (!string.IsNullOrEmpty(recipientMail))
            {
                    Mail.Send(subject, body, sender, new[] { recipientMail }, null);
            }
        }

        [MainMenuFilter]
        public ActionResult Menu(string menuUrl, string priceFilter, string sortBy)
        {
            if (menuUrl == null)
            {
                throw new HttpException(404, "menuUrl can't be null");
            }

            if (dataRepository.GetMenu(menuUrl) == null)
            {
                throw new HttpException(404, string.Format("menu with url = {0} dows not exist", menuUrl));
            }

            var model = new MenuViewModel
                            {
                                Flowers = dataRepository.GetFlowersByMenu(menuUrl),
                                Menu = dataRepository.GetMenu(menuUrl)
                            };


             model = (MenuViewModel) FlowersFilter(model, sortBy, priceFilter);

             //ViewData[ViewDataStr.Menu] = model.Menu;

             return View(model);
        }

        private IFlowerListViewModel FlowersFilter(IFlowerListViewModel model, string sortBy, string priceFilter)
        {
            if (priceFilter != null)
            {
                double from, to;

                var priceFilterArray = priceFilter.Split('-');

                if (double.TryParse(priceFilterArray[0], out from) && double.TryParse(priceFilterArray[1], out to))
                {
                    model.Flowers = dataRepository.FlowersFilterByPrice(model.Flowers, from, to);
                }

            }

            if (sortBy != null)
            {
                try
                {
                    model.Flowers = dataRepository.FlowersSort(model.Flowers, (FlowersFilter)Enum.Parse(typeof(FlowersFilter), sortBy), OrderBy.Desc);
                }
                catch (ArgumentException)
                {
                    model.Flowers = dataRepository.FlowersSort(model.Flowers, Helpers.Enums.FlowersFilter.Novelty, OrderBy.Desc);
                }
            }
            else
            {
                //Novelty - by default
                model.Flowers = dataRepository.FlowersSort(model.Flowers, Helpers.Enums.FlowersFilter.Popular, OrderBy.Desc);
            }

            return model;
        }

        [MainMenuFilter]
        public ActionResult Tag(string tagUrl, string menuUrl, string priceFilter, string sortBy)
        {
            if (tagUrl == null)
            {
                throw new HttpException(404, "url can't be null");
            }

            var tag = dataRepository.GetTag(tagUrl, menuUrl);

            if (tag == null)
            {
                throw new HttpException(404, string.Format("tag with id = {0} dows not exist", tagUrl));
            }

            var model = new TagViewModel
                            {
                                Tag = tag,
                                Flowers = dataRepository.GetFlowersByTagId(tag.Id)
                            };

            model = (TagViewModel)FlowersFilter(model, sortBy, priceFilter);

            return View(model);
        }

        [MainMenuFilter]
        public ActionResult Search(string searchSrc)
        {
            var model = new SearchViewModel
                            {
                                Flowers = dataRepository.GetSearchedFlowers(searchSrc),
                                SearchSrc = searchSrc
                            };

            model.Count = model.Flowers.Count();

            return View(model);
        }

        #region Static pages

        [MainMenuFilter]
        public ActionResult AboutUs(string searchSrc)
        {
            return View();
        }

        [MainMenuFilter]
        public ActionResult DeliveryAndPayment(string searchSrc)
        {
            return View();
        }

        [MainMenuFilter]
        public ActionResult IndividualOrder(string searchSrc)
        {
            return View();
        }

        [MainMenuFilter]
        public ActionResult Contacts()
        {
            return View();
        }

        #endregion

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Feedback(string name, string mail, string phone, string message, string currentActionName)
        {
            string subject = "Feedback from";
            var body = string.Format("{0}, <br /> <b>Phone</b>:{1}", message, phone);
            var recipiens = new[] { ConfigurationManager.AppSettings["Mailbox"] };
            var sender = string.Format("{0} <{1}>", name, mail);

            Mail.Send(subject, body, sender, recipiens, null);

            return RedirectToAction(currentActionName);
        }
        
    }
}