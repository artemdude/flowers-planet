<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<script language="javascript" type="text/javascript">
    $(document).ready(function() {

          $("#FeedBackForm").validate({
              rules: {
                  name: "required",
                  phone: "required",
                  message: "required",
                  mail: {
                      required: true,
                      email: true
                  }
              },
              messages: {
              name: "Введите имя",
              phone: "Введите телефон",
              message: "Введите сообщение",
              mail: {
                   required: "Введите email",
                   email: "Введите коректный email"
                  }
              }
          });
                         
    });
</script>

<style>
 .FeedBackTable
 {
     width:100%;
 }
 
.FeedBackTable td
 {
      padding:10px;
      border:solid 1px #ccc;
      vertical-align: middle !important;
 }
 
  .FeedBackTable input[type="text"], .FeedBackTable textarea
 {
     width: 60%;
     padding:2px;
      margin-right:10px;
 }
 
 label.error
{
     color:#FF3300;
}
</style>

<% using (Html.BeginForm("FeedBack", "Site", FormMethod.Post, new { id = "FeedBackForm", enctype = "multipart/form-data" }))
   {%>
<input name="currentActionName" type="hidden" value="<%= ViewContext.RouteData.Values["Action"] %>" />
<div class="space15">
    &nbsp;</div>

    
<table class="FeedBackTable">
    <tbody>
        <tr>
            <td width="25%">
                Имя
            </td>
            <td>
                <input id="nameBox" class="textbox" name="name" type="text" />
                
            </td>
        </tr>
        <tr>
            <td>
                Эмейл
            </td>
            <td>
                <input id="mailBox" class="required textbox" name="mail" type="text" />
            </td>
        </tr>
        <tr>
            <td>
                Телефон
            </td>
            <td>
                <input id="phoneBox" class="required textbox" name="phone" type="text" />
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap" style="vertical-align: top !important;">
                Сообщение
            </td>
            <td>
                <textarea cols="20" id="messageBox" class="required textbox" name="message" rows="2"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <input id="send" type="submit" class="button" value="Отправить" />
            </td>
        </tr>
    </tbody>
</table>
<% } %>
