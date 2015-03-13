<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<HandleErrorInfo>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>Sorry, an error occurred while processing your request</title>
    <link href="<%= ResolveUrl("~/Css/Error/error.css") %>" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="error">
   
        <div style="font-size:14px; margin: 0 auto; text-align:left; width: 600px;">
          <span id="title">Sorry, an error occurred while processing your request.</span>
             <div style="height:20px;"></div>
        
         <% if (Model.Exception != null ) { %>
        <p>
          <b>Controller:</b> <%= Model.ControllerName %>
        </p>
        <p>
        <b>  Action:</b> <%= Model.ActionName %>
        </p>
        <p>
        <b>  Message:</b> <%= Model.Exception.Message%>
        </p>
        <p>
         <b> Stack Trace:</b> <%= Model.Exception.StackTrace%>
                  </p>
    <% } %>
        </div>
    </div>

</body>
</html>