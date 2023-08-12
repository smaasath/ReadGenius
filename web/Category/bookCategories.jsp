<%-- 
    Document   : bookCategories
    Created on : Aug 9, 2023, 1:10:46 PM
    Author     : Janu
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>

<%
    try {
        // Look up the data source using its JNDI name
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("jdbc/your_datasource_name");

        // Establish a database connection
        Connection conn = ds.getConnection();

        // Now you can use the 'conn' object to interact with the database
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String username = request.getParameter("username");
        String password = MD5.getMd5(request.getParameter("password"));

        String query = "SELECT INTO readgenius(bookId, 	isbn, title, publicationDate, authorId, category) VALUES(?, ?, ?, ?)";
        Connection con = DbConnector.getConnection();
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, username);
        pstmt.setString(4, password);
        int a = pstmt.executeUpdate();
        // ...

        // Close the connection when done
        conn.close();
    } catch (Exception e) {
        // Handle any exceptions that might occur
        e.printStackTrace();
    }
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
