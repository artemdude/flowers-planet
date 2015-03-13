<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.Admin.MenusViewModel>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
   Разделы
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <script language="javascript" type="text/javascript">
    
        $(document).ready(function() {
            $('#menuMenus').addClass('selectedMenu').removeAttr('href');

            $('#searchQuery').keyup(function() {

                var regEx = new RegExp('(' + $(this).val() + ')', 'i');

                $('.DataTable tbody tr').each(function() {
                    if ($(this).find('td').eq(0).text().match(regEx) || $(this).find('td').eq(1).text().match(regEx)) {
                        $(this).show();
                    }
                    else {
                        $(this).hide();
                    }
                });

            });

        });
    </script>

    <div id="filtersPanel">
        <div class="f-left">
            <input type="text" value="" id="searchQuery" class="singleTextBox search">
        </div>
        <div class="f-right">
            <a href="<%= Url.Action("MenuManage") %>">
                <input type="button" class="button-gray" name="btnSubmit" value="Добавить раздел" /></a>
        </div>
        <div class="clear">
        </div>
    </div>
    <table class="DataTable">
        <thead>
            <tr>
                <th>
                    Название
                </th>
                <th>
                    URL
                </th>
                <th>
                    Тэги
                </th>
                <th>
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in Model.Menus)
               {%>
            <tr>
                <td style="width: 140px; vertical-align: middle;">
                   <a href="<%= Url.Action("MenuManage", new { Id = item.Id}) %>"><%= item.Name %></a> 
                </td>
                <td style="vertical-align: middle; width: 100px">
                    <%= item.Url %>
                </td>
                <td width="">
                    Теги:
                    <% foreach (var s in item.Tags)
                       {%>
                    <%= s.Name %>,
                    <% } %>
                </td>
                <td style="vertical-align: middle; text-align: center; width: 100px">
                    <%= Html.ActionLink(
                                "Удалить",
                               "DeleteMenu",
    new { id = item.Id }, 
    new { @class= "delete-link", onclick = "return confirm('Вы уверены?')" }) %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</asp:Content>
