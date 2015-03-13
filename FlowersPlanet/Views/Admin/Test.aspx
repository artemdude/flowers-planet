<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.Admin.FlowerManageViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MetaTagsContent" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainMenu" runat="server">
  <% using (Html.BeginForm("Test", "Admin", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
        <input id="imageUploader" name="imageUploader" type="file" />
        <input class="" type="submit" value="Ok" />
    <%}%>

</asp:Content>
