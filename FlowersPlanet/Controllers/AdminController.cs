using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.Mvc;
using FlowersPlanet.Helpers;
using FlowersPlanet.Helpers.Routing;
using FlowersPlanet.Models;
using FlowersPlanet.Models.Domain;
using FlowersPlanet.Models.ViewModels.Admin;
using System.Linq;

namespace FlowersPlanet.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly IDataRepository dataRepository;

        #region Constructors

        public AdminController(IDataRepository dataRepository)
        {
            this.dataRepository = dataRepository;
        }

        public AdminController() : this(new DataRepository())
        {
        }

        #endregion

        public ActionResult Index()
        {
            return View();
        }

        #region Flower

        public ActionResult Flowers()
        {
            var model = new FlowersViewModel
                            {
                                Flowers = dataRepository.GetFlowers()
                            };

            return View(model);
        }

        public ActionResult Test()
        {
             return View();
        }


        public ActionResult FlowerManage(int? id)
        {
            var model = new FlowerManageViewModel();

            if(id != null)
            {
                model.Flower = dataRepository.GetFlower((int)id);

                if(model.Flower == null)
                {
                    throw new Exception("no category with Id = " + id);
                }

                model.SelectedTags = GetSelectedTags(model.Flower.FlowerInTags);
            }
            else
            {
                model.SelectedTags = new List<int>();
            }

            model.Tags = dataRepository.GetTags().OrderBy(t => t.Name);

            return View(model);
        }

        private static IEnumerable<int> GetSelectedTags(IEnumerable<FlowerInTag> col)
        {
             foreach (var item in col)
            {
                yield return item.IdTag;
            }
        }

        [ValidateInput(false), HttpPost]
        public ActionResult FlowerManage(int? id, FlowerManageViewModel modifiedFlower)
        {
           if(ModelState.IsValid)
           {
               if(id != null)
               {
                   dataRepository.DeleteFlowerInTag((int)id);

                   Flower flower = dataRepository.GetFlower((int) id);

                   if (Request.Files["imageUploader"].ContentLength != 0)
                   {
                       string status;

                       var imageHelper = new ImageHelper();

                       if (!imageHelper.IsImageValid(Request.Files["imageUploader"], out status))
                       {
                           ViewData["ImageUploaderError"] = status;

                           return View(modifiedFlower);
                       }

                       flower.Photo = PostedFileToByte(Request.Files["imageUploader"]);
                   }
                   
                  // flower.FlowerInTags.Clear();

                  // UpdateModel(flower, "Flower");

                  // dataRepository.Save();
                   if (modifiedFlower.SelectedTags != null)
                   {
                       foreach (var data in modifiedFlower.SelectedTags)
                       {
                           flower.FlowerInTags.Add(new FlowerInTag() { IdFlower = flower.Id, IdTag = data });
                       }
                   }

                   UpdateModel(flower,"Flower");

                   flower.Article = modifiedFlower.Flower.Article;

                   flower.Url = modifiedFlower.Flower.Url;
                   flower.MetaTitle = modifiedFlower.Flower.MetaTitle;
                   flower.MetaKeys = modifiedFlower.Flower.MetaKeys;
                   flower.MetaDesc = modifiedFlower.Flower.MetaDesc;
               }
               else
               {
                   if (Request.Files["imageUploader"].ContentLength != 0)
                   {
                       string status;

                       var imageHelper = new ImageHelper();

                       if (!imageHelper.IsImageValid(Request.Files["imageUploader"], out status))
                       {
                           ViewData["ImageUploaderError"] = status;

                          return View(modifiedFlower);
                       }

                       modifiedFlower.Flower.Photo = PostedFileToByte(Request.Files["imageUploader"]);
                   }
                   else
                   {
                       //add default image
                       var ms = new MemoryStream();

                       Image.FromFile(Path.GetFullPath(ConfigurationManager.AppSettings["DefaultFlowerImage"])).Save(ms, ImageFormat.Jpeg);

                       modifiedFlower.Flower.Photo = ms.ToArray();
                   }

                   if (modifiedFlower.SelectedTags != null)
                   {
                       foreach (var data in modifiedFlower.SelectedTags)
                       {
                           modifiedFlower.Flower.FlowerInTags.Add(new FlowerInTag() { IdFlower = modifiedFlower.Flower.Id, IdTag = data });
                       }
                   }
                   try
                   {
                       modifiedFlower.Flower.OrderIndex = dataRepository.GetFlowers().Max(f => f.OrderIndex) + 1;
                   }
                   catch (InvalidOperationException)
                   {
                       modifiedFlower.Flower.OrderIndex = 0;
                   }
                  

                   dataRepository.AddFlower(modifiedFlower.Flower);
               }

               dataRepository.Save();
           }

            return RedirectToAction("Flowers");
        }


        public ActionResult DeleteFlower(int id)
        {
            dataRepository.DeleteFlower(id);
            dataRepository.Save();

            return RedirectToAction("Flowers");
        }

        private static byte[] PostedFileToByte(HttpPostedFileBase file)
        {
            if (file == null)
            {
                throw new NullReferenceException("file can't be null");
            }

            var tempImage = new byte[file.ContentLength];

            file.InputStream.Read(tempImage, 0, file.ContentLength);

            return tempImage;
        }

#endregion

        #region Menu

        public ActionResult Menus()
        {
            var model = new MenusViewModel
                            {
                                Menus = dataRepository.GetMenus()
                            };

            return View(model);
        }

        public ActionResult MenuManage(int? id)
        {
            var model = new MenuManageViewModel();

            if (id != null)
            {
                model.Menu = dataRepository.GetMenu((int)id);

                if (model.Menu == null)
                {
                    throw new Exception(string.Format("Menu with Id = {0} does not exist", id));
                }
            }

            return View(model);
        }

        [ValidateInput(false), HttpPost]
        public ActionResult MenuManage(int? id, MenuManageViewModel modifiedMenu)
        {
            if (ModelState.IsValid)
            {
                if (id != null)
                {
                    Menu menu = dataRepository.GetMenu((int)id);

                    if (menu != null)
                    {
                        menu.Name = modifiedMenu.Menu.Name;
                        menu.Article = modifiedMenu.Menu.Article;
                        menu.Url = modifiedMenu.Menu.Url;
                        menu.MetaTitle = modifiedMenu.Menu.MetaTitle;
                        menu.MetaKeys = modifiedMenu.Menu.MetaKeys;
                        menu.MetaDesc = modifiedMenu.Menu.MetaDesc;

                       // UpdateModel(menu, "Menu");
                    }
                    else
                    {
                        throw new Exception(string.Format("Menu with Id = {0} does not exist",id));
                    }
                }
                else
                {
                   dataRepository.AddMenu(modifiedMenu.Menu);
                }

                dataRepository.Save();

                //update Menu collection in Application
                (new MenuCollection()).Update();
            }

            return RedirectToAction("Menus");
        }

        public ActionResult DeleteMenu(int id)
        {
            dataRepository.DeleteMenu(id);
            dataRepository.Save();

            //update Menu collection in Application
           (new MenuCollection()).Update();

            return RedirectToAction("Menus");
        }

        #endregion


        #region Tag

        public ActionResult Tags()
        {
            var model = new TagsViewModel
                            {
                                Tags = dataRepository.GetTags()
                            };

            return View(model);
        }

        public ActionResult TagManage(int? id)
        {
            var model = new TagManageViewModel();

            if (id != null)
            {
                model.Tag = dataRepository.GetTag((int)id);

                if (model.Tag == null)
                {
                    throw new Exception(string.Format("Tag with Id = {0} does not exist", id));
                }
            }

            return View(model);
        }

        [ValidateInput(false), HttpPost]
        public ActionResult TagManage(int? id, TagManageViewModel modifiedTag)
        {
            if (ModelState.IsValid)
            {
                if (id != null)
                {
                    Tag tag = dataRepository.GetTag((int)id);

                    if (tag != null)
                    {
                        tag.Name = modifiedTag.Tag.Name;
                        tag.IdMenu = modifiedTag.Tag.IdMenu;
                        tag.Article = modifiedTag.Tag.Article;
                        tag.Url = modifiedTag.Tag.Url;
                        tag.MetaTitle = modifiedTag.Tag.MetaTitle;
                        tag.MetaKeys = modifiedTag.Tag.MetaKeys;
                        tag.MetaDesc = modifiedTag.Tag.MetaDesc;

                        //UpdateModel(tag, "Tag");
                    }
                    else
                    {
                        throw new Exception(string.Format("Tag with Id = {0} does not exist", id));
                    }
                }
                else
                {
                    dataRepository.AddTag(modifiedTag.Tag);
                }

                dataRepository.Save();

                //update Menu collection in Application
                (new MenuCollection()).Update();
            }

            return RedirectToAction("Tags");
        }

        public ActionResult DeleteTag(int id)
        {
            dataRepository.DeleteTag(id);
            dataRepository.Save();

            //update Menu collection in Application
            (new MenuCollection()).Update();

            return RedirectToAction("Tags");
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public void ChangeOrderIndex(int orderIndex,int flowerId)
        {
            var flower = dataRepository.GetFlower(flowerId);
            flower.OrderIndex = orderIndex;

            dataRepository.Save();
        }

        #endregion
    }
}
