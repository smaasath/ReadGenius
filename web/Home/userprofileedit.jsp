 
<%@page import="java.io.InputStream"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Update</title>
</head>
<body>

<%  
   
   String readerName = request.getParameter("readerName");
   String readerEmail = request.getParameter("readerEmail");
   String userName = request.getParameter("userName");
   String password = request.getParameter("Password");
   String userId = request.getParameter("userId");
   String readerId = request.getParameter("readerId");

   try {
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/readgenius", "root", "");

       // Update reader table
       String updateReaderQuery = "UPDATE reader SET readerName=?, readerEmail=?  WHERE readerId=?";
       PreparedStatement updateReaderStatement = con.prepareStatement(updateReaderQuery);
       updateReaderStatement.setString(1, readerName);
       updateReaderStatement.setString(2, readerEmail);
       updateReaderStatement.setInt(3, Integer.parseInt(readerId));
       updateReaderStatement.executeUpdate();

       // Update user table
       String updateUserQuery = "UPDATE user SET userName=?, Password=? WHERE userId=?";
       PreparedStatement updateUserStatement = con.prepareStatement(updateUserQuery);
       updateUserStatement.setString(1, userName);
       updateUserStatement.setString(2, password);
       updateUserStatement.setInt(3, Integer.parseInt(userId));
       updateUserStatement.executeUpdate();

       // Close resources
       updateUserStatement.close();
       updateReaderStatement.close();
       con.close();

       out.println("Profile updated successfully!");

   } catch (Exception e) {
       out.println("Error: " + e.getMessage());
   }
   
 response.sendRedirect("UserProfileView.jsp");
    
%>

</body>
</html>
