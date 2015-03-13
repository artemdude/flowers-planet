<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.Admin.MenuManageViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MenuManage
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <script language="javascript" type="text/javascript">
       $(document).ready(function() {
           $("#form").validate();
           
           $('#menuMenus').addClass('selectedMenu1');
       });
   </script>

      <% Html.EnableClientValidation(); %>
    <% using (Html.BeginForm("MenuManage", "Admin", FormMethod.Post, new { id="form", enctype = "multipart/form-data" }))
       {%>
       
         <%= Html.TextBoxFor(m => Model.Menu.Name, new { @class = "textbox textbox-big required" })%>
         
        
            <div class="space10"></div>
        <% Html.RenderPartial("Controls/Article"); %>
           <div class="space10"></div>
    <div class="right">
           <input class="button-blue" type="submit" value="Ok" />
    </div>
  
    <%}%>

</asp:Content>
