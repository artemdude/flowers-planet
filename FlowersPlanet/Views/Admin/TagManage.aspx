<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.Admin.TagManageViewModel>" %>
<%@ Import Namespace="FlowersPlanet.Helpers.Routing"%>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
	TagManage
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

   <script language="javascript" type="text/javascript">
       $(document).ready(function() {
             $("#form").validate();
             $('#menuTags').addClass('selectedMenu1');
       });
   </script>

 <% Html.EnableClientValidation(); %>
    <% using (Html.BeginForm("TagManage", "Admin", FormMethod.Post, new { id = "form", enctype = "multipart/form-data" }))
       {%>
       
         <%= Html.TextBoxFor(m => Model.Tag.Name, new { @class = "textbox textbox-big required" })%>
            <div class="space10"></div>
        <%= Html.DropDownListFor(m => Model.Tag.IdMenu, new SelectList(Model.Menus, "id", "Name"), new { @class = "singleTextBox" })%>
                  <div class="space10"></div>
       
        <% Html.RenderPartial("Controls/Article"); %>
  
        <div class="space10"></div>
    
    <div class="right">
           <input class="button-blue" type="submit" value="Ok" />
    </div>
  
    <%}%>

</asp:Content>
