<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="FlowersPlanet.Constants"%>
<%@ Import Namespace="FlowersPlanet.Helpers.Routing" %>

<script language="javascript">

    var priceFilter = '<%= Request.QueryString["priceFilter"] %>';
    var sortBy = '<%= Request.QueryString["sortBy"] %>';

    $(document).ready(function() {
        if (priceFilter != '') {
            $('#priceFilter a[param=' + priceFilter + ']').addClass('filter-selected').removeAttr('href');
        }
        else {
            $('#priceFilter a[param=All]').addClass('filter-selected').removeAttr('href');
        }

        if (sortBy != '') {
            $('#sortBy a[param=' + sortBy + ']').addClass('filter-selected').removeAttr('href');
        }
        else {
            $('#sortBy a[param=Popular]').addClass('filter-selected').removeAttr('href');
        }
    });

</script>

<div style="margin-top:10px; font-size:11px;">

<div id="priceFilter" class="flowerFilter">
    <div style="float: left; margin-right: 5px;">
        <b>Фильтровать:</b></div>
    <ul style="float: left;">
        <li><a param="All" href="<%= FilterLinkConstructor.GetLink("All",Request.QueryString["sortBy"]) %>">
            Все</a></li>
        <li><a param="0-1000" href="<%= FilterLinkConstructor.GetLink("0-1000",Request.QueryString["sortBy"]) %>">
            До 1000 грн.</a></li>
        <li><a param="1000-3000" href="<%= FilterLinkConstructor.GetLink("1000-3000",Request.QueryString["sortBy"]) %>">
            1000-3000 грн.</a></li>
        <li><a param="3000-100000" href="<%= FilterLinkConstructor.GetLink("3000-100000",Request.QueryString["sortBy"]) %>">
            больше 3000 грн.</a></li>
    </ul>
</div>
<div id="sortBy" class="flowerFilter">
    <div style="float: left; margin-right: 5px;">
        <b>Сортировать по:</b></div>
    <ul style="float: left;">
      <li><a param="Popular" href="<%= FilterLinkConstructor.GetLink(Request.QueryString["priceFilter"],"Popular") %>">
            Популярности</a></li>
        <li><a param="Novelty" href="<%= FilterLinkConstructor.GetLink(Request.QueryString["priceFilter"],"Novelty") %>">
            Новизне</a> </li>
        <li><a param="Price" href="<%= FilterLinkConstructor.GetLink(Request.QueryString["priceFilter"],"Price") %>">
            Цене</a></li>
    </ul>
</div>
<div class="clear">
</div>
   </div>