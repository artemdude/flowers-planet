<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="FlowersPlanet.Helpers.Html"%>

<asp:Content ID="Title" ContentPlaceHolderID="Title" runat="server">
Способы доставки
</asp:Content>

<asp:Content ID="MetaTagsContent" ContentPlaceHolderID="MetaTagsContent" runat="server">
      <link rel="canonical" href="<%= ConfigurationManager.AppSettings["Domain"] + Html.RouteUrl("DeliveryAndPayment") %>">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

<h1>Способы доставки</h1>
    <div class="textLineHeight">
<p>Доставка осуществляется курьером по Киеву 24 часа в сутки.</p>

<p>Стоимость доставки товаров на сумму до 1500 грн. с 8-00 до 22-00 составляет 35 грн., с 22-00 до
8-00 составляет 100 грн. Доставка индивидуального заказа или заказа на сумму свыше 1500 грн.
осуществляется бесплатно.</p>

<p>Обычно заказ может быть доставлен в тот же день не позже чем через 6 часов с момента оформления
заказа.</p>

<h1>Способы оплаты</h1>

<p>В настоящие время мы принимаем только наличный расчет. Оплата производится как в национальной,
так и в международной валюте по курсу определенному в момент заказа. В подтверждение оплаты мы
выдаем Вам товарный чек.</p>
     </div>
</asp:Content>



