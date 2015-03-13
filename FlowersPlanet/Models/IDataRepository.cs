using System.Collections.Generic;
using System.Linq;
using FlowersPlanet.Helpers.Enums;
using FlowersPlanet.Models.Domain;

namespace FlowersPlanet.Models
{
    public interface IDataRepository
    {
        #region Flowers

        Flower GetFlower(int id);
        Flower GetFlower(string flowerUrl);

        void AddFlower(Flower flower);
        void DeleteFlower(int id);

         IQueryable<Flower> GetFlowers();

        IQueryable<Flower> GetNumberOfFlowers(IQueryable<Flower> flowers, int skip, int take);

        IQueryable<Flower> FlowersFilterByPrice(IQueryable<Flower> flowers, double from, double to);

        IQueryable<Flower> FlowersSort(IQueryable<Flower> flowers, FlowersFilter sortBy, OrderBy orderBy);

        IQueryable<Flower> GetFlowersByMenu(string menuUrl);

        IQueryable<Flower> GetFlowersByTagId(int tagId);

        IQueryable<Flower> FlowersFilterByTag(IQueryable<Flower> flowers, string tagUrl);

        byte[] GetImage(int flowerId);

        IEnumerable<Flower> GetRandomFlower(int flowerId, int count);

        IQueryable<Flower> GetPopularFlowers();

        IQueryable<Flower> GetSearchedFlowers(string str);

        #endregion


        #region Tags

        Tag GetTag(int id);
        Tag GetTag(string url);
        Tag GetTag(string tagUrl, string menuUrl);

        IQueryable<Tag> GetTags();
        IQueryable<Tag> GetTags(int menuId);

        void AddTag(Tag tag);
        void DeleteTag(int id);

        #endregion

        void DeleteFlowerInTag(int id);

        #region Menus

        Menu GetMenu(int id);
        Menu GetMenu(string url);
        IQueryable<Menu> GetMenus();

        void AddMenu(Menu menu);
        void DeleteMenu(int id);

        #endregion


        void Save();
    }
}