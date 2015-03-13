<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Account.Master" Inherits="System.Web.Mvc.ViewPage<LogOnModel>" %>
<%@ Import Namespace="FlowersPlanet.Resources.Views.Account"%>
<%@ Import Namespace="FlowersPlanet.Models.Domain"%>
<asp:Content ID="PageTitleContent" ContentPlaceHolderID="PageTitleContent" runat="server">
    <%= LogOn.PageTitle %>
</asp:Content>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server"> <%= LogOn.Title %></asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <%= Html.ValidationSummary(true, LogOn.ValidationSummerDefaultError, new { @class = "validation-message" })%>
    <div class="title">
        <%= Html.LabelFor(m => m.UserName) %>
    </div>
    <div class="editor-field">
        <%= Html.TextBoxFor(m => m.UserName, new{@class = "textbox"}) %>
        <%= Html.ValidationMessageFor(m => m.UserName) %>
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
    <table width="100%">
        <tr>
            <td>
                <%= Html.CheckBoxFor(m => m.RememberMe) %>
                <%= Html.LabelFor(m => m.RememberMe) %>
            </td>
            <td align="right">
                <input type="submit" class="button" value="Log On" />
            </td>
        </tr>
    </table>
    <% } %>
</asp:Content>
