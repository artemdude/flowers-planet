<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.TagViewModel>" %>
<%@ Import Namespace="FlowersPlanet.Helpers.Html"%>

<%@ Import Namespace="FlowersPlanet.Models.Domain" %>

<asp:Content ID="Title" ContentPlaceHolderID="Title" runat="server">
<%= Model.Tag.MetaTitle%>
</asp:Content>

<asp:Content ID="MetaTagsContent" ContentPlaceHolderID="MetaTagsContent" runat="server">
    <meta name="keywords" content="<%= Model.Tag.MetaKeys %>" />
    <meta name="description" content="<%= Model.Tag.MetaDesc %>" />
    
     <link rel="canonical" href="<%= ConfigurationManager.AppSettings["Domain"] + Html.RouteUrl("Tag", new { menuUrl = Model.Tag.Menu.Url, tagUrl = Model.Tag.Url } ) %>" />
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="breadcrumb">
<a href="<%= Html.RouteUrl("Index") %>">Главная</a> » 
<a href="<%= Html.RouteUrl("Menu", new { menuUrl = Model.Tag.Menu.Url}) %>"><%= Model.Tag.Menu.Name %></a> » 
<%= Model.Tag.Name %>
</div>
<div style=" float:left; width:702px;">
      <% Html.RenderPartial("Controls/FlowerFilter"); %>
</div>

  
    <div style="height: 20px; clear:both;">
    </div>
    <% Html.RenderPartial("Controls/FlowersList"); %>
    
     <div id="flowerContainer">
        <%= Model.Tag.Article %>
     </div>
</asp:Content>
