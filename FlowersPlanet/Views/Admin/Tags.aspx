<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.Admin.TagsViewModel>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
Тэги
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

  <script language="javascript" type="text/javascript">
    
        $(document).ready(function() {
            $('#menuTags').addClass('selectedMenu').removeAttr('href');

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
            <a href="<%= Url.Action("TagManage") %>">
                <input type="button" class="button-gray" name="btnSubmit" value="Добавить тэг" /></a>
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
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in Model.Tags)
               {%>
            <tr>
                <td style=" vertical-align: middle;">
                   <a href="<%= Url.Action("TagManage", new { Id = item.Id}) %>"><%= item.Name %></a> 
                </td>
                <td style="vertical-align: middle;">
                    <%= item.Url %>
                </td>
                <td style="vertical-align: middle; text-align: center; width: 100px">
                    <%= Html.ActionLink(
                                "Удалить",
                               "DeleteTag",
    new { id = item.Id },
                            new { @class = "delete-link", onclick = "return confirm('Вы уверены?')" })%>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

</asp:Content>
