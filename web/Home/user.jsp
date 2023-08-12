<%-- 
    Document   : userprofile
    Created on : Aug 10, 2023, 2:44:42 AM
    Author     : Dell
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
 
 <input type="text" name="first_name" value="<%=resultSet.getString("first_name") %>">


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

    String name ="", email ="", address = "", password = "", gender = "", accountType = "";
    int contactNo = 0;

    try {
	Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        Statement st =(Statement) con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM user");
        
        while (rs.next())
        {
            //String fname = request.getParameter("name");
            //String userid = request.getParameter("userid");
            name = rs.getString("name");
            email = rs.getString("email");
            contactNo = rs.getInt("contactNo");
            address = rs.getString("address");
            password = rs.getString("password");
            gender = rs.getString("gender");
            accountType = rs.getString("accountType");
        }
        
        con.close();

    } catch (SQLException e) {
        e.printStackTrace();
    }
    


    // Get form parameters
//    String fname = request.getParameter("name");
//    String userid = request.getParameter("userid");
//    String name = request.getParameter("name");
//    String email = request.getParameter("email");
//    String phoneNo = request.getParameter("phoneNo");
//    String address = request.getParameter("address");
//    String password = request.getParameter("password");
//    String gender = request.getParameter("gender");
//    String user_type = request.getParameter("user_type");   
//    out.println(fname);
    // Perform database update
    String updateQuery = "UPDATE user SET name =?, email=?, phoneNo=?, address=?, password=?, gender=?, user_Type=? WHERE name='Hasanki Dharmarathna'";
    try {
	Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        PreparedStatement pstmt = con.prepareStatement(updateQuery);
//        pstmt.setString(1, userid);
//        pstmt.setString(2, name);
//        pstmt.setString(3, email);
//        pstmt.setString(4, phoneNo);
//        pstmt.setString(5, address);
//        pstmt.setString(6, password);
//        pstmt.setString(7, gender);
//        pstmt.setString(8, user_type);
        
        
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
        
        
         
        <h1>name : <%=name%></h1>
    <h1>email : <%=email%></h1>
        <h1>phoneNo : <%=contactNo%></h1>
        <h1>address : <%=address%></h1>
        <h1>password : <%=password%></h1>
        <h1>gender : <%=gender%></h1>
        <h1>user_type : <%=accountType%></h1>
    </body>
</html>