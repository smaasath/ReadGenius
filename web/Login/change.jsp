<%@page import="java.sql.*" %>



<%
    String action = request.getParameter("action");
    if (action.equals("password1")) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");

        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/book", "root", "");
            PreparedStatement ps = con.prepareStatement("UPDATE user SET password=? WHERE username=?");
            ps.setString(2, username);
            ps.setString(1, password);

           if(password.equals(password2)){
            int i = ps.executeUpdate();
                if (i > 0) {
                  response.sendRedirect("home.jsp");
                }
                
           } 
            else {
                response.sendRedirect("forgot.jsp");
            }

        } catch (Exception e) {
            out.println(e);
        }

    }


%>
