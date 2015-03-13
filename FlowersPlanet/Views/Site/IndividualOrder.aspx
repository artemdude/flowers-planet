<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="FlowersPlanet.Helpers.Html"%>

<asp:Content ID="Title" ContentPlaceHolderID="Title" runat="server">
Индивидуальный заказ
</asp:Content>

<asp:Content ID="MetaTagsContent" ContentPlaceHolderID="MetaTagsContent" runat="server">
      <link rel="canonical" href="<%= ConfigurationManager.AppSettings["Domain"].ToString() + Html.RouteUrl("IndividualOrder") %>">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

             
<h1>Индивидуальный заказ</h1>
  <div class="textLineHeight">
<p>
Хотите сделать незабываемый подарок любимому человеку или другу? Мы с радостью исполним даже
самый креативный и дорогостоящий заказ.
</p>

<p>
Что мы уже делали:
</p>
<p>
1. Цветочное оформление свадеб, банкетов и прочих мероприятий профессиональными
флористами.  <br />
2. Незабываемый сюрприз — дорожка из лепестков роз.  <br />
3. Флористическое оформление квартиры, дома или усадьбы   <br />
4. Поддержка флористического оформление квартиры, дома или усадьбы  <br />
5. Цветочной праздник или день рождение любимой     <br />
</p>

<p>
Если Вы хотите сделать незабываемый подарок и сюрприз, «индивидуальный заказ» именно для Вас!
</p>

<p>
Заполните форму ниже и наши менеджеры в кротчайшие сроки свяжутся с Вами или заказываете по
телефону 044 537 18 35
</p>

<p>
  <% Html.RenderPartial("Controls/FeedBackForm"); %>

</p>
  </div>
</asp:Content>


