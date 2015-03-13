<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Account.Master" Inherits="System.Web.Mvc.ViewPage<ChangePasswordModel>" %>
<%@ Import Namespace="FlowersPlanet.Models.Domain"%>
<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitleContent" runat="server">
    <%= FlowersPlanet.Resources.Views.Account.ChangePassword.PageTitle%>
</asp:Content>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server"> <%= FlowersPlanet.Resources.Views.Account.ChangePassword.Title%></asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <%= Html.ValidationSummary(true, FlowersPlanet.Resources.Views.Account.ChangePassword.ValidationSummerDefaultError, new { @class = "validation-message" })%>
    <div class="title">
        <%= Html.LabelFor(m => m.OldPassword) %>
    </div>
    <div class="editor-field">
        <%= Html.PasswordFor(m => m.OldPassword, new { @class = "textbox" })%>
        <%= Html.ValidationMessageFor(m => m.OldPassword) %>
    </div>
    <div class="space20">
    </div>
    <div class="title"">
        <%= Html.LabelFor(m => m.NewPassword) %>
    </div>
    <div class="editor-field">
        <%= Html.PasswordFor(m => m.NewPassword, new { @class = "textbox" })%>
        <%= Html.ValidationMessageFor(m => m.NewPassword) %>
    </div>
    <div class="space20">
    </div>
    <div class="title">
        <%= Html.LabelFor(m => m.ConfirmPassword) %>
    </div>
    <div class="editor-field">
        <%= Html.PasswordFor(m => m.ConfirmPassword, new { @class = "textbox" })%>
        <%= Html.ValidationMessageFor(m => m.ConfirmPassword) %>
    </div>
    <div class="space20">
    </div>
    <div style="text-align: right">
        <input type="submit" class="button" value="Change Password" />
    </div>
    <% } %>
</asp:Content>
