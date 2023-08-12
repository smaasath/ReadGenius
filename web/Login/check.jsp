<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    String username = request.getParameter("userName");
    String password = request.getParameter("Password");

 
                  


        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/readgenius", "root", "");

        String query = "SELECT * FROM user WHERE username = ? AND password = ?";
        PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int userRole = rs.getInt("userRole");
                int userId = rs.getInt("userId");

               

                if (userRole == 1) {
                    // Start or retrieve the session
                
    
    // Store data in the session
                  session.setAttribute("userId", userId);
                    response.sendRedirect("../index.jsp");
                    
                } else {
                    response.sendRedirect("../Admin/admin.html");
                }
            } else {
               JOptionPane.showMessageDialog(null, "incoorect username or password", "error", JOptionPane.INFORMATION_MESSAGE);
                    response.sendRedirect("login.jsp");
            }
        
    
%>

