<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.Admin.FlowerManageViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    FlowerManage
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .desc
        {
            width: 99%;
        }
        .ui-resizable-se {
            bottom: 17px !important;
        }
    </style>
    
    <link href="<%= ResolveUrl("~/Scripts/plugins/ui/theme/jquery.ui.all.css") %>" rel="stylesheet" type="text/css" />
    <script src="<%= ResolveUrl("~/Scripts/plugins/ui/jquery-ui-1.8.14.custom.min.js") %>" type="text/javascript"></script>
    
   <script language="javascript" type="text/javascript">
       $(document).ready(function() {
            $("#form").validate();
            $('#menuFlowers').addClass('selectedMenu1');
            
            $( "#SelectedTags" ).resizable({
                handles: "se"
            });
       });
       
       
   </script>
    
    <% Html.EnableClientValidation(); %>
    <% using (Html.BeginForm("FlowerManage", "Admin", FormMethod.Post, new { id = "form", enctype = "multipart/form-data" }))
       {%>
    <div class="space15" id="menuStarter">
    </div>
    <%= Html.TextBoxFor(m => Model.Flower.Name, new { @class = "textbox textbox-big required" })%>
    <%= Html.ValidationMessageFor(m => Model.Flower.Name)%>
    
    <div class="space10"></div>
    <table width="100%">
        <tr>
            <td>
            Цена<br />
                <%= Html.TextBoxFor(m => Model.Flower.Price, new { @class = "textbox required number" })%> грн.
                   <div class="space10"></div>
               
               Теги<br />
                <%= Html.ListBoxFor(m => m.SelectedTags, new SelectList(Model.Tags, "Id","Name"), new{ size = 8 }) %>
                  <div class="space10"></div>
              
              Фото<br />
                <input id="imageUploader" name="imageUploader" type="file" />
                
                <%= (ViewData["ImageUploaderError"] != null) ? ViewData["ImageUploaderError"] : null %>
            </td>
            <td>
                <% if (Model.Flower != null)
                   { %>
                <img src="/Photo/Small/<%= Model.Flower.Id %>" alt="" />
                <%}%>
            </td>
        </tr>
    </table>
<div class="space10"></div>
Короткое описание<br />
    
      <%= Html.TextAreaFor(m => Model.Flower.Description, new { id = "Description" })%>

       <div class="space10"></div>
    <% Html.RenderPartial("Controls/Article"); %>
    
<script type="text/javascript">
        //<![CDATA[
        CKEDITOR.replace('Description',
                {
                    skin: 'kama',
                    language: 'ru'
                });
        //]]>
</script>
    
    <div class="space10"></div>
    
    <div class="right">
           <input class="button-blue" type="submit" value="Ok" />
    </div>
 
    <%}%>
</asp:Content>
