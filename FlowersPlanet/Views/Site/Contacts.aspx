<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="FlowersPlanet.Helpers.Html"%>

<asp:Content ID="Title" ContentPlaceHolderID="Title" runat="server">
Контакты
</asp:Content>

<asp:Content ID="MetaTagsContent" ContentPlaceHolderID="MetaTagsContent" runat="server">
      <link rel="canonical" href="<%= ConfigurationManager.AppSettings["Domain"] + Html.RouteUrl("Contacts") %>">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="content">
   <h1>
        Контакты</h1>
    <table style=" margin-top:-10px;" width="100%">
        <tr>
            <td width="35%">
                <h2>
                    Телефоны:</h2>
                <ul class="example">
                    <li>044 537 18 35</li>
                    <li>093 653 53 60</li>
                    <li>066 180 76 74</li>
                </ul>
            </td>
            <td>
                <h2>
                    E-mail:</h2>
                <ul>
                    <li>bloom@flowersplanet.com.ua</li>
                </ul>
            </td>
            <td width="30%">
               <h2>
        Адрес</h2>
    Улица Лютеранская 20, Киев, Украина
            </td>
        </tr>
    </table>
    
    <div style="height: 23px">
    </div>
  

         <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com.ua/maps?f=q&amp;source=s_q&amp;hl=ru&amp;geocode=&amp;q=%D1%83%D0%BB%D0%B8%D1%86%D0%B0+%D0%BB%D1%8E%D1%82%D0%B5%D1%80%D0%B0%D0%BD%D1%81%D0%BA%D0%B0%D1%8F+20&amp;aq=&amp;sll=51.550063,7.617798&amp;sspn=7.174918,23.269043&amp;ie=UTF8&amp;hq=&amp;hnear=%D0%9B%D1%8E%D1%82%D0%B5%D1%80%D0%B0%D0%BD%D1%81%D0%BA%D0%B0%D1%8F+%D1%83%D0%BB.,+20,+%D0%9A%D0%B8%D0%B5%D0%B2&amp;ll=50.451001,30.529547&amp;spn=0.019128,0.036478&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe><br />
         <small><a href="http://maps.google.com.ua/maps?f=q&amp;source=embed&amp;hl=ru&amp;geocode=&amp;q=%D1%83%D0%BB%D0%B8%D1%86%D0%B0+%D0%BB%D1%8E%D1%82%D0%B5%D1%80%D0%B0%D0%BD%D1%81%D0%BA%D0%B0%D1%8F+20&amp;aq=&amp;sll=51.550063,7.617798&amp;sspn=7.174918,23.269043&amp;ie=UTF8&amp;hq=&amp;hnear=%D0%9B%D1%8E%D1%82%D0%B5%D1%80%D0%B0%D0%BD%D1%81%D0%BA%D0%B0%D1%8F+%D1%83%D0%BB.,+20,+%D0%9A%D0%B8%D0%B5%D0%B2&amp;ll=50.451001,30.529547&amp;spn=0.019128,0.036478&amp;z=14&amp;iwloc=A" style="text-align:left">Просмотреть увеличенную карту</a></small>

         </div>

</asp:Content>


