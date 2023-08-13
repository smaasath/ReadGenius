/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

@MultipartConfig
/**
 *
 * @author Texus
 */
public class tset extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Part part = request.getPart("image");

        InputStream inputStream = part.getInputStream();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            byteArrayOutputStream.write(buffer, 0, bytesRead);
        }
        byte[] imageBytes = byteArrayOutputStream.toByteArray();

   
            
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/readgenius", "root", "");

            String insertReaderQuery = "INSERT INTO `reader` (`readerId`, `readerName`, `readerEmail`, `image`) VALUES (NULL,?,?,?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertReaderQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {

                preparedStatement.setString(1, name);
                preparedStatement.setString(2, email);
                preparedStatement.setBytes(3, imageBytes);
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                        int generatedReaderId = -1;
                        if (generatedKeys.next()) {
                            generatedReaderId = generatedKeys.getInt(1);
                        }

                        // Insert data into 'user' table
                        if (generatedReaderId > 0) {
                            String insertUserQuery = "INSERT INTO `user` (`userId`, `userName`, `Password`, `userRole`, `readerId`) VALUES (NULL,?,?,?,?)";
                            try (PreparedStatement stmtuser = connection.prepareStatement(insertUserQuery)) {
                                stmtuser.setString(1, username); // Replace with actual value
                                stmtuser.setString(2, password); // Replace with actual value
                                stmtuser.setInt(3, 1); // Replace with actual value for userRole
                                stmtuser.setInt(4, generatedReaderId); // Use the generated reader ID

                                int b = stmtuser.executeUpdate();

                                if (b > 0) {
                // Send a response to the client indicating success
                response.getWriter().println("Data saved successfully");
                response.sendRedirect("Login/login.jsp");
            } else {
                // Send a response to the client indicating failure
                response.getWriter().println("Failed to insert user data");
            }
                                 }}}}}
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Log the error and send an appropriate response to the client
            response.getWriter().println("An error occurred while processing your request.");
        }
                       

            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet tset</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet tset at " + name + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
        
            () {
        return "Short description";
        }// </editor-fold>

    }
