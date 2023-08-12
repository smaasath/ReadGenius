<%-- 
    Document   : test
    Created on : Aug 12, 2023, 5:21:44 PM
    Author     : Janu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String AuthorId = request.getParameter("AuthorId");
    String BookId = request.getParameter("BookId");
    String ReaderId = request.getParameter("ReaderId");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%= AuthorId%>
        <%= BookId%>
        <%= ReaderId%>
    </body>
</html>
