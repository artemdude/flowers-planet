<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Account.Master" Inherits="System.Web.Mvc.ViewPage<RegisterModel>" %>
<%@ Import Namespace="FlowersPlanet.Resources.Views.Account"%>
<%@ Import Namespace="FlowersPlanet.Models.Domain"%>
<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitleContent" runat="server">
    <%= Register.PageTitle %>
</asp:Content>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server"><%= Register.Title %></asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <%= Html.ValidationSummary(true, Register.ValidationSummerDefaultError, new { @class = "validation-message" })%>
    <div class="title">
        <%= Html.LabelFor(m => m.UserName) %>
    </div>
    <div class="editor-field">
        <%= Html.TextBoxFor(m => m.UserName, new { @class = "textbox" })%>
        <%= Html.ValidationMessageFor(m => m.UserName) %>
    </div>
    <div class="space20">
    </div>
    <div class="title">
        <%= Html.LabelFor(m => m.Email) %>
    </div>
    <div class="editor-field">
        <%= Html.TextBoxFor(m => m.Email, new { @class = "textbox" })%>
        <%= Html.ValidationMessageFor(m => m.Email) %>
    </div>
    <div class="space20">
    </div>
    <div class="title">
        <%= Html.LabelFor(m => m.Password) %>
    </div>
    <div class="editor-field">
        <%= Html.PasswordFor(m => m.Password, new { @class = "textbox" })%>
        <%= Html.ValidationMessageFor(m => m.Password) %>
    </div>
    <div class="space20">
    </div>
    <div style="text-align: right">
        <input type="submit" class="button" value="Register" />
    </div>
    <% } %>
</asp:Content>
