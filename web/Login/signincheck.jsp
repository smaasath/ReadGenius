<%@page import="java.io.InputStream"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%String action = request.getParameter("action");
if (action != null && action.equals("signin")) {

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Part part = request.getPart("image");
        InputStream inputStream = part.getInputStream();

        String message = "You ented \n\n"
                + "name: " + name + "\n"
                + "user name: " + username + "\n"
                + "password: " + password + "\n"
                + "Email: " + email + "\n"
                + "Do you want to save this data?";

        int choice = JOptionPane.showConfirmDialog(null, message, "Save data", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
        if (choice == JOptionPane.YES_OPTION) {

        }

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/readgenius", "root", "");

            // Insert data into 'reader' table
            PreparedStatement stmt = con.prepareStatement("INSERT INTO `reader` (`readerId`, `readerName`, `readerEmail`, `image`) VALUES (NULL, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, name); // Replace with actual value
            stmt.setString(2, email); // Replace with actual value
            stmt.setBinaryStream(3, inputStream); // Replace with actual value

            int a = stmt.executeUpdate();

            // Retrieve the generated reader ID
            int generatedReaderId = -1;
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                generatedReaderId = generatedKeys.getInt(1);
            }

            // Insert data into 'user' table
            if (generatedReaderId > 0) {
                PreparedStatement stmtuser = con.prepareStatement("INSERT INTO `user` (`userId`, `userName`, `Password`, `userRole`, `readerId`) VALUES (NULL,?,?,?,?)");
                stmtuser.setString(1, "username"); // Replace with actual value
                stmtuser.setString(2, "password"); // Replace with actual value
                stmtuser.setString(3, "userRole"); // Replace with actual value
                stmtuser.setInt(4, generatedReaderId); // Use the generated reader ID

                int b = stmtuser.executeUpdate();

                if (b > 0) {
                    JOptionPane.showMessageDialog(null, "Data Save Successfully", "Save Data", JOptionPane.INFORMATION_MESSAGE);
                    response.sendRedirect("../home.jsp");
                } else {
                    JOptionPane.showMessageDialog(null, "Failed to insert user data", "Save Data", JOptionPane.ERROR_MESSAGE);
                }
            }

            // Close resources and connections
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>