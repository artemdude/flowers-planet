<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="FlowersPlanet.Constants" %>
<%@ Import Namespace="FlowersPlanet.Models.Domain" %>

<script>

    $(document).ready(function() {

        //подгоняем по размерам засчет последнего меню
       // $('#main-menu li:eq(8) a').css('padding', '8px 36px');

       // $('#main-menu-item-content').css({ 'top': $('#main-menu').offset().top + $('#main-menu').outerHeight() - 1, 'left': $('#main-menu').offset() });


        var curentTagId;

        $('#main-menu a').mouseover(function() {

            curentTagId = $(this).attr('id');

            TagsShow();
        });

        $('#main-menu a, #main-menu-item-content').mouseout(function() {
            $('#main-menu-item-content').hide();
            $('#tagsInMenu_' + curentTagId).hide();

            $('#' + curentTagId).removeClass('main-menu-item-hovered');
        });

        $('#main-menu-item-content').mouseover(function() {
            TagsShow();
        });

        function TagsShow() {

            $('#' + curentTagId).addClass('main-menu-item-hovered');

            $('#main-menu-item-content').show();
            $('#tagsInMenu_' + curentTagId).show();
        }
    });

</script>

<% if (ViewData[ViewDataStr.Menus] != null)
   { %>
<div id="main-menu">
    <ul>
        <% foreach (var menuItem in (IList<FlowersPlanet.Models.Domain.Menu>)ViewData[ViewDataStr.Menus])
           { %>
        <li><a id="<%= Html.DisplayTextFor(f => menuItem.Id)%>" href="<%= Url.RouteUrl("Menu", new { menuUrl = menuItem.Url}) %>">
            <%=  Html.DisplayTextFor(f => menuItem.Name)%>
        </a></li>
        <% } %>
    </ul>
    <div class="clear">
    </div>
</div>
<div id="main-menu-item-content">
    <% foreach (var menuItem in (IList<FlowersPlanet.Models.Domain.Menu>)ViewData[ViewDataStr.Menus])
       { %>
    <div class="tags-in-main-menu" style="display: none;" id="tagsInMenu_<%=  Html.DisplayTextFor(f => menuItem.Id)%>">
        <% foreach (var tagItem in menuItem.Tags)
           { %>
        <div class="tag-in-main-menu">
            <a href="<%= Url.Action("Tag", new {menuUrl = tagItem.Menu.Url, tagUrl = tagItem.Url}) %> ">
                <%=  Html.DisplayTextFor(f => tagItem.Name)%>
            </a>
        </div>
        <% } %>
    </div>
    <% } %>
    <div class="clear">
    </div>
</div>
<% }
   else
   { %>
<div class="notification">
    Меню не загружено</div>
<% } %>