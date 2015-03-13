<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MenuViewModel>" %>
<%@ Import Namespace="FlowersPlanet.Helpers.Html"%>

<%@ Import Namespace="FlowersPlanet.Models.ViewModels" %>
<%@ Import Namespace="FlowersPlanet.Models.Domain" %>

<asp:Content ID="Title" ContentPlaceHolderID="Title" runat="server">
<%= Model.Menu.MetaTitle%>
</asp:Content>

<asp:Content ID="MetaTagsContent" ContentPlaceHolderID="MetaTagsContent" runat="server">
    <meta name="keywords" content="<%= Model.Menu.MetaKeys %>" />
    <meta name="description" content="<%= Model.Menu.MetaDesc %>" />
    
     <link rel="canonical" href="<%= ConfigurationManager.AppSettings["Domain"] + Html.RouteUrl("Menu", new { menuUrl = Model.Menu.Url } ) %>" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">


<div class="breadcrumb">
<a href="<%= Html.RouteUrl("Index") %>">Главная</a> » 
<%= Model.Menu.Name %>
</div>
<div style=" float:left; width:702px;">
      <% Html.RenderPartial("Controls/FlowerFilter"); %>
</div>

 
    <div style="height:20px;"></div>
    <% Html.RenderPartial("Controls/FlowersList"); %>
    
    
        <div id="flowerContainer">
        <%= Model.Menu.Article %>
     </div>
</asp:Content>
