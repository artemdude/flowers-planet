<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="FlowersPlanet.Helpers.Html"%>

<asp:Content ID="Title" ContentPlaceHolderID="Title" runat="server">
О нас
</asp:Content>

 <asp:Content ID="MetaTagsContent" ContentPlaceHolderID="MetaTagsContent" runat="server">
      <link rel="canonical" href="<%= ConfigurationManager.AppSettings["Domain"] + Html.RouteUrl("AboutUs") %>">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="textLineHeight">
<h1>О нас </h1>

<p>FlowersPlanet — цветочный магазин в Киеве, на сегодняшний день является лидером цветочной
отрасли.</p>

<p>Нашей главной целью является удовлетворенность клиентов, как компаний, так и розничных
покупателей. Мы уважительно относимся к деталям и ко всем просьбам клиента, мы понимаем на все
100% — наше будущее это ВЫ.</p>

<p>Мы с радостью делаем скидки постоянным клиентам и работаем до последнего посетителя.</p>

<p>Цены в магазине FlowersPlanet основываются на честности и понимании потребностей клиентов.</p>

<p>У вас крупный заказ? Вы хотели бы сделать специальный подарок любимому человеку? Тогда Вы
попали туда куда нужно! Перейдите по ссылке «индивидуальный заказ» или просто свяжитесь с нами
по телефону 044 537 18 35 и мы удовлетворим даже самого требовательного и креативного клиента.</p>

<p>И помните, у нас самые красивые цветы.</p>
</div>
</asp:Content>



