<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.Admin.FlowersViewModel>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Цветы
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <script>

        $(document).ready(function() {
            $('.flowerSmallPhoto').mouseout(function() {
                $('#flowerBigPhoto').hide();
            });


            $('.flowerSmallPhoto').mouseover(function() {

                var top = $(this).offset().top;
                var left = $(this).offset().left;

                $('#flowerBigPhoto').show().css({ 'top': (top + ($(this).outerHeight() / 2)) - ($('#flowerBigPhoto').outerHeight() / 2), 'left': left + 90 });

                $('#flowerBigPhoto').find('img').attr('src', '/Photo/Small/' + $(this).parents('tr').find('td:eq(0)').text());

            });



            $('#menuFlowers').addClass('selectedMenu').removeAttr('href');

            $('#searchQuery').keyup(function() {

                var regEx = new RegExp('(' + $(this).val() + ')', 'i');

                $('.DataTable tbody tr').each(function() {
                    if ($(this).find('td').eq(2).text().match(regEx) || $(this).find('td').eq(0).text().match(regEx) || $(this).find('td').eq(3).text().match(regEx)) {
                        $(this).show();
                    }
                    else {
                        $(this).hide();
                    }
                });
            });
        });


        function ChangeOrderIndex(element) {

            $.ajax({
                type: "get",
                url: "/Admin/ChangeOrderIndex",
                data: { orderIndex: $(element).val(), flowerId: $(element).attr('flowerId') },
                dataType: "json",
                async: false,
                success: function(data) {
                    
                },
                error: function() {
                    alert("error");
                }
            });

            
        }
       
    </script>

    <div id="filtersPanel">
        <div class="f-left">
             <input type="text" value="" id="searchQuery" class="singleTextBox search">
        </div>
        <div class="f-right">
                  <a href="<%= Url.Action("FlowerManage") %>">
                        <input type="button" class="button-gray" name="btnSubmit" value="Добавить цветок" /></a>
        </div>
        <div class="clear">
        </div>
    </div>
    <table class="DataTable">
        <thead>
            <tr>
                <th>
                    Код
                </th>
                 <th>
                    Порядок
                </th>
                <th>
                    Фото
                </th>
                <th>
                    Название
                </th>
                <th>
                    URL
                </th>
              
                <th>
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in Model.Flowers)
               {%>
            <tr>
                <td style="width: 10px; vertical-align:middle;" align="center">
                    <%= item.Id %>
                </td>
                 <td style="width: 10px; vertical-align:middle;" align="center">
                    <%= Html.TextBoxFor(f => item.OrderIndex, new { onchange = "ChangeOrderIndex(this)", flowerId = item.Id, @class = "textbox required number", style = "width:30px" })%>
                </td>
                <td width="60px">
                  <img class="flowerSmallPhoto" src="/Photo/Mini/<%= item.Id %>" />
                </td>
                <td width="">
                   <a style="font-size:18px;" href="<%= Url.Action("FlowerManage", new { id = item.Id }) %>"> <%= item.Name %> </a>
                  <div style="height:8px;"></div>
                    <div style="font-size:11px; color:#D4D4D4;">
                      Теги: 
                     <% foreach (var s in item.FlowerInTags) {%>
                       
                       <%= s.Tag.Name %>, 
                       
                  <% } %>
                  <br />
                  Меню: 
                     <% foreach (var s in item.FlowerInTags) {%>
                       
                       <%= s.Tag.Menu.Name %>, 
                       
                  <% } %>
                  </div>
                    
                </td>
                <td style=" vertical-align:middle; width:100px">
                    <%= item.Url %>
                </td>
           
                
                <td style=" vertical-align:middle; text-align:center; width:100px">
                    <%= Html.ActionLink(
                                "Удалить",
                               "DeleteFlower",
    new { id = item.Id },
                            new { @class = "delete-link", onclick = "return confirm('Вы уверены?')" })%>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    
    <div id="flowerBigPhoto"><img src="/Photo/" /></div>
    
</asp:Content>
