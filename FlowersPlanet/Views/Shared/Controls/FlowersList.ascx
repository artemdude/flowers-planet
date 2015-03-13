<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<FlowersPlanet.Models.ViewModels.IFlowerListViewModel>" %>
<%@ Import Namespace="FlowersPlanet.Helpers.Html"%>
<%@ Import Namespace="FlowersPlanet.Models.Domain" %>
<% if (Model.Flowers.Count() != 0)
   { %>

<script type="text/javascript" language="javascript">

    $(document).ready(function() {

        var count = $('.flower-item-list').length;

        var rows = count / 5;

        if (count % 5) {

            var countOfFullRows = (rows - 0.5).toFixed(0);

            for (var i = 0; i <= (count - (countOfFullRows * 5)); i++) {
                $('#flowersList .flower-item-list:eq(' + (count - i) + ')').css('border-bottom', 'none');
            }
        }
        else {
            for (var i = 0; i <= 5; i++) {
                $('#flowersList .flower-item-list:eq(' + (count - i) + ')').css('border-bottom', 'none');
            }
        }
    });

</script>

<div id="flowersList" style="text-align: center;">
    <% foreach (Flower flower in Model.Flowers)
       {%>
    <div class="flower-item-list">
        <a href="<%= Html.RouteUrl("Flower", new { url = flower.Url}) %> ">
            <img width="150px" src="/Photo/Small/<%= flower.Id %>" alt="<%= flower.Name %>" />
        </a>
        <div>
        </div>
        <span class="flower-title-list">
            <%=  Html.DisplayTextFor(f => flower.Name)%>
        </span>
        <div style="padding: 2px;">
        </div>
        <span class="flower-price-list">
            <%= Html.DisplayFor(f => flower.Price)%>
            <%= FlowersPlanet.Constants.Currency.Grivna %></span>
        <div style="padding-bottom: 10px;">
        </div>
    
        <a class="button" style=" margin-right:4px" href="<%= Html.RouteUrl("Flower", new { url = flower.Url}) %>">Подробнее
           </a>

        <a class="button" href="<%= Html.RouteUrl("Order", new { url = flower.Url}) %>">Купить <img src="<%= ResolveUrl("~/Images/Site/buy-arrow.png") %>" />
          </a>
            
            
    </div>
    <% } %>
    <div class="clear">
    </div>
</div>
<% }
   else
   { %>
   <div class="noFlowers">
В данном разделе цветов нету
</div>
<% } %>
<div class="clear">
</div>
