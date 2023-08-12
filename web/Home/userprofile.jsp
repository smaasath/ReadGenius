<%-- 
    Document   : userprofile
    Created on : Aug 10, 2023, 2:44:42 AM
    Author     : Dell
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    // Establish the database connection
    String DB_URL = "jdbc:mysql://localhost:3306/nhreadgenius";
    String DB_USER = "root";
    String DB_PASSWORD = "";

//    Connection con;

    // Get form parameters
    //String userid = request.getParameter("userid");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String contactNo = request.getParameter("contactNo");
    String address = request.getParameter("address");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String accountType = request.getParameter("accountType");   
    out.println(name);
    //System.out.println(name);
    // Perform database update
    String updateQuery = "UPDATE user SET name =?, email=?, contactNo=?, address=?, password=?, gender=?, accountType=? WHERE name=?";
    try {
	Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        PreparedStatement pstmt = con.prepareStatement(updateQuery);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, contactNo);
        pstmt.setString(4, address);
        pstmt.setString(5, password);
        pstmt.setString(6, gender);
        pstmt.setString(7, accountType);
        pstmt.setString(8, name);
        
        
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Update Successful");
        } else {
            out.println("Update Failed");
        }

        pstmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
//    } finally {
//        // Close the database connection
//        try {
//            
//            if (con != null) {
//                con.close();
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
%>
        
        
<!--        <h1>name : <%=name%></h1>
        <h1>email : <%=email%></h1>
        <h1>contactNo : <%=contactNo%></h1>
        <h1>address : <%=address%></h1>
        <h1>password : <%=password%></h1>
        <h1>gender : <%=gender%></h1>
        <h1>user_type : <%=accountType%></h1>-->
    </body>
</html>