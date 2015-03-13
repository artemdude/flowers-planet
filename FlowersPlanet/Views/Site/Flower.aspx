<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.FlowerViewModel>" %>

<%@ Import Namespace="FlowersPlanet.Helpers.Html" %>
<%@ Import Namespace="FlowersPlanet.Models.Domain" %>

<asp:Content ID="Title" ContentPlaceHolderID="Title" runat="server">
<%= Model.Flower.MetaTitle%>
</asp:Content>

<asp:Content ID="MetaTagsContent" ContentPlaceHolderID="MetaTagsContent" runat="server">
    <meta name="keywords" content="<%= Model.Flower.MetaKeys %>" />
    <meta name="description" content="<%= Model.Flower.MetaDesc %>" />
    <link rel="canonical" href="<%= ConfigurationManager.AppSettings["Domain"] + Html.RouteUrl("Flower", new { url = Model.Flower.Url } ) %>" />
    <!-- Put this script tag to the <head> of your page -->

    <script type="text/javascript" src="http://userapi.com/js/api/openapi.js?31"></script>




</asp:Content>



<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

<%--<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
  <a href="http://www.example.com/dresses" itemprop="url">
    <span itemprop="title">Dresses</span>
  </a> ›
</div>  
<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
  <a href="http://www.example.com/dresses/real" itemprop="url">
    <span itemprop="title">Real Dresses</span>
  </a> ›
</div>  
<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
  <a href="http://www.example.com/clothes/dresses/real/green" itemprop="url">
    <span itemprop="title">Real Green Dresses</span>
  </a>
</div>--%>

<%--
<div class="hproduct">

  <span class="fn">Large all-purpose anvil</span>
  <span class="availability">Available now!<span class="value-title" title="Preorder"></span></span> 
  Category: <span class="category">Anvils</span>

  <div class="hreview-aggregate">
     Average rating: <span class="rating">3</span>
     Votes <span class="count">33</span>
  </div>
    <div class="description">ad asd asd asdsa</div>
  Sale: <span class="price">$119.99</span>
  <span class="currency">
     <span class="value-title" title="USD" />
  </span>
</div> 
--%>

 
    <div style="height: 30px;">
    </div>
    <table width="100%">
        <tr>
            <td width="300px" style="padding-top: 15px;">
                <img width="300px" height="" src="/Photo/Normal/<%= Model.Flower.Id %>" alt="<%= Model.Flower.Name %>" />
            </td>
            <td style="padding-left: 60px;">
                <span class="flowerTitle">
                    <%=  Html.DisplayTextFor(m => Model.Flower.Name)%>
                </span><span>код
                    <%=  Html.DisplayTextFor(m => Model.Flower.Id)%>
                </span>
           
           
                <div style="height: 5px;">
                </div>
                <span class="flowerPrice">
                    <%=  Html.DisplayTextFor(m => Model.Flower.Price) %>
                    <%= FlowersPlanet.Constants.Currency.Grivna %>
                </span>
                <div style="height: 20px;">
                </div>
                <a id="buyButton" href="<%= Html.RouteUrl("Order", new { url = Model.Flower.Url}) %>">
                    Купить
                    <img style="margin-left: 7px;" src="<%= ResolveUrl("~/Images/Site/big-arrow.png") %>" /></a>
                <a href="<%= Html.RouteUrl("DeliveryAndPayment") %>">Доставка и оплата</a>
                <div style="height: 20px;">
                </div>
                <div style="height: 10px;">
                </div>
                <div class="textLineHeight" id="flowerDescription">
                    <%=  Html.DisplayTextFor(m => Model.Flower.Description)%>
                </div>
                <div class="space10">
                </div>

                <script type="text/javascript">
    VK.init({ apiId: 2378605, onlyWidgets: true });
                </script>

                <!-- Put this div tag to the place, where the Like block will be -->
                <div id="vk_like">
                </div>

                <script type="text/javascript">
    VK.Widgets.Like("vk_like", { type: "button" });
                </script>

            </td>
            <td valign="top" width="160px">
                <div id="similarFlowers">
                    <div style="padding: 5px; border-bottom: solid 1px #e7e7e7; font-size: 11px; font-weight: bold;">
                        Вам может понравится
                    </div>
                    <%
                        foreach (var flower in Model.MoreFlowers)
                        {%>
                    <div style="padding-top: 10px;">
                    </div>
                    <a href="<%= Html.RouteUrl("Flower", new { url = flower.Url}) %>">
                        <img width="110px" height="" src="/Photo/Small/<%= flower.Id %>" alt="<%= flower.Name %>" />
                    </a>
                    <div>
                    </div>
                    <span class="flower-title-list"><a href="<%= Html.RouteUrl("Flower", new { url = flower.Url}) %>">
                        <%=  Html.DisplayTextFor(m => flower.Name)%>
                    </a></span>
                    <div>
                    </div>
                    <span class="flower-price-list">
                        <%= Html.DisplayFor(f => flower.Price)%>
                        <%= FlowersPlanet.Constants.Currency.Grivna %></span>
                    <div>
                    </div>
                    <div style="padding: 5px; border-bottom: solid 1px #e7e7e7">
                    </div>
                    <% } %>
                </div>
            </td>
        </tr>
    </table>
    <div class="textLineHeight">
        <%=  Html.DisplayTextFor(m => Model.Flower.Article)%>
    </div>
</asp:Content>
