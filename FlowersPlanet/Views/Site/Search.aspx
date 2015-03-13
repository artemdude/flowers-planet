<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.SearchViewModel>" %>

<asp:Content ID="Title" ContentPlaceHolderID="Title" runat="server">
Поиск
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <% if (Model.SearchSrc.Length != 0)
       { %>

    <script type="text/javascript" language="javascript">
           $(document).ready(function() {
                $.watermark.hideAll();
               $('#searchBox').val('<%= Model.SearchSrc %>').select();
           });
    </script>
       <div style=" height:30px;"></div>
    <% if (Model.Count != 0)
       {%>
    Найдено
   <b><%= Html.DisplayTextFor(m => m.Count)%></b> букетов
    по запросу<i>
    <%= Html.DisplayTextFor(m => m.SearchSrc)%>
      </i>
    
     <div style=" height:20px;"></div>
    <% Html.RenderPartial("Controls/FlowersList"); %>
    <% }
       else
       { %>
    по запросу
    <%= Html.DisplayTextFor(m => m.SearchSrc)%>
    ничего не найдено
    <% } %>
    <%}
       else
       {%>
    Введите что небудь
    <% } %>
</asp:Content>

