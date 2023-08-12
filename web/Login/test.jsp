<%-- 
    Document   : test
    Created on : Aug 12, 2023, 5:36:25 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
        <% int userId = (int) session.getAttribute("userId");%> 
        <%=userId%>
        
        </h1>
    </body>
</html>
