using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using FlowersPlanet.Helpers.Enums;
using FlowersPlanet.Models.Domain;


namespace FlowersPlanet.Models
{
    public class DataRepository : IDataRepository
    {
        #region Variables

        private readonly DataClassesDataContext db;

        #endregion

        public DataRepository()
        {
            db = new DataClassesDataContext();
        }

        #region IDataRepository Methods

        public Flower GetFlower(int id)
        {
            return db.Flowers.SingleOrDefault(f => f.Id == id);
        }

        public Flower GetFlower(string flowerUrl)
        {
            return db.Flowers.SingleOrDefault(f => f.Url == flowerUrl);
        }

        public void AddFlower(Flower flower)
        {
            if (flower != null)
            {
                db.Flowers.InsertOnSubmit(flower);
            }
            else
            {
                throw new Exception("Can't add null Flower");
            }
        }

        public byte[] GetImage(int flowerId)
        {
            try
            {
                return db.Flowers.SingleOrDefault(f => f.Id == flowerId).Photo.ToArray();
            }
            catch (Exception)
            {
                var ms = new MemoryStream();

                Image.FromFile(Path.GetFullPath(ConfigurationManager.AppSettings["DefaultFlowerImage"])).Save(ms, ImageFormat.Jpeg);

                return ms.ToArray();
            }
        }

        public IEnumerable<string> GetMenuUrlCollection()
        {
            return db.Menus.Select(m => m.Url);
        }

        public IEnumerable<Flower> GetRandomFlower(int flowerId, int count)
        {
            IEnumerable<Flower> results = db.Flowers
                .Where(f => f.Id != flowerId).Skip((new Random()).Next(db.Flowers.Count() - count)).Take(count);

            return results;
        }

        public IQueryable<Flower> GetPopularFlowers()
        {
            return db.Flowers.Take(25);
        }

        public IQueryable<Flower> GetSearchedFlowers(string str)
        {
            return db.FlowerInTags.Where(f => f.Tag.Name.Contains(str) || f.Flower.Name.Contains(str)).Select(f => f.Flower).Distinct();

            //var flowers = new List<Flower>();

            //foreach (var tag in db.Tags.Where(t => t.Name.Contains(str)))
            //{
            //     flowers.Add(tag.FlowerInTags.);
            //}

            //db.Flowers.Where(f => f.FlowerInTags.Where(t => t.Tag.Name.Contains(str)).Select(t => t.Flower));

           // return db.Flowers.Where(f => f.Name.Contains(str));
        }

        public Tag GetTag(int id)
        {
            return db.Tags.SingleOrDefault(t => t.Id == id);
        }

        

        public Tag GetTag(string tagUrl, string menuUrl)
        {
            if (tagUrl != null || menuUrl != null)
            {
                return db.Tags.SingleOrDefault(t => t.Url == tagUrl && t.Menu.Url == menuUrl);
            }

            throw new Exception("url can't be null");
        }

        public Tag GetTag(string url)
        {
            if (url != null)
            {
                return db.Tags.SingleOrDefault(t => t.Url == url);
            }

            throw new Exception("url can't be null");
        }

        public IQueryable<Tag> GetTags()
        {
            return db.Tags.OrderByDescending(t => t.Id);
        }

        public IQueryable<Tag> GetTags(int menuId)
        {
            return db.Tags.Where(t => t.Menu.Id == menuId);
        }

        public void AddTag(Tag tag)
        {
            if (tag != null)
            {
                db.Tags.InsertOnSubmit(tag);
            }
            else
            {
                throw new Exception("Can't add null Tag");
            }
        }

        public void DeleteTag(int id)
        {
            if (GetTag(id) == null)
            {
                throw new Exception(string.Format("Tag with id = {0} does not exist", id));
            }

            db.Tags.DeleteOnSubmit(GetTag(id));
        }

        public void DeleteFlowerInTag(int id)
        {
            foreach (var item in db.FlowerInTags.Where(f => f.IdFlower == id))
            {
                db.FlowerInTags.DeleteOnSubmit(item);
            }

            
        }

        public Menu GetMenu(int id)
        {
            return db.Menus.SingleOrDefault(m => m.Id == id);
        }

        public Menu GetMenu(string url)
        {
            return db.Menus.SingleOrDefault(m => m.Url == url);
        }

        public IQueryable<Menu> GetMenus()
        {
            return db.Menus.OrderByDescending(m => m.Id);
        }

        public void AddMenu(Menu menu)
        {
            if (menu != null)
            {
                db.Menus.InsertOnSubmit(menu);
            }
            else
            {
                throw new Exception("Can't add null Menu");
            }
        }

        public void DeleteMenu(int id)
        {
            if (GetMenu(id) == null)
            {
                throw new Exception(string.Format("Menu with id = {0} does not exist", id));
            }

            db.Menus.DeleteOnSubmit(GetMenu(id));
        }

        public void Save()
        {
            db.SubmitChanges();
        }

        public IQueryable<Flower> FlowersFilterByPrice(IQueryable<Flower> flowers, double from, double to)
        {
            return flowers.Where(f => (f.Price >= from && f.Price <= to));
        }

        public IQueryable<Flower> FlowersFilterByTag(IQueryable<Flower> flowers, string tagUrl)
        {
            return db.FlowerInTags.Where(f => f.Tag.Url == tagUrl).Select(f => f.Flower);
        }

        public IQueryable<Flower> FlowersSort(IQueryable<Flower> flowers, FlowersFilter sortBy, OrderBy orderBy)
        {
            switch (sortBy)
            {
                case FlowersFilter.Price:
                    if (orderBy == OrderBy.Asc)
                    {
                        return flowers.OrderBy(f => f.Price);
                    }
                    return flowers.OrderByDescending(f => f.Price);

                case FlowersFilter.Novelty:
                    if (orderBy == OrderBy.Asc)
                    {
                        return flowers.OrderBy(f => f.Id);
                    }
                    return flowers.OrderByDescending(f => f.Id);
                case FlowersFilter.Popular:
                    if (orderBy == OrderBy.Asc)
                    {
                        return flowers.OrderBy(f => f.OrderIndex);
                    }
                    return flowers.OrderByDescending(f => f.OrderIndex);
                default:
                    return flowers;
            }
        }

        public IQueryable<Flower> GetFlowersByMenu(string menuUrl)
        {
            return db.FlowerInTags.Where(f => f.Tag.Menu.Url == menuUrl).Select(f => f.Flower).Distinct();
        }

        public void DeleteFlower(int id)
        {
            if (GetFlower(id) == null)
            {
                throw new Exception(string.Format("Flower with id = {0} does not exist", id));
            }

            db.Flowers.DeleteOnSubmit(GetFlower(id));
        }

        public IQueryable<Flower> GetFlowers()
        {
            return db.Flowers.OrderByDescending(f => f.OrderIndex);
        }

        public IQueryable<Flower> GetNumberOfFlowers(IQueryable<Flower> flowers, int skip, int take)
        {
            return flowers.Skip(skip).Take(take);
        }

        //private IQueryable<Flower> GetFlowersByTagUrl(string tagUrl)
        //{
        //    return db.FlowerInTags.Where(f => f.Tag.Url == tagUrl).Select(f => f.Flower);
        //}

        public IQueryable<Flower> GetFlowersByTagId(int tagId)
        {
            return db.FlowerInTags.Where(f => f.Tag.Id == tagId).Select(f => f.Flower);
        }

        private IQueryable<Flower> GetFlowersByMenuId(int menuId)
        {
            return db.FlowerInTags.Where(f => f.Tag.Menu.Id == menuId).Select(f => f.Flower);
        }

        #endregion


    }
}