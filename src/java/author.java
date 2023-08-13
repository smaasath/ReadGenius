
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

@MultipartConfig
public class author extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String authorName = request.getParameter("authorName");
        String contactNum = request.getParameter("contactNum");
        String authorEmail = request.getParameter("authorEmail");
        String about = request.getParameter("about");
        

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

            String insertBookQuery = "INSERT INTO `author` (`authorId`, `authorName`, `contactNum`, `authorEmail`, `image`, `about`) VALUES (NULL,?,?,?,?,?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertBookQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
                preparedStatement.setString(1, authorName);
                preparedStatement.setString(2, contactNum);
                preparedStatement.setString(3, authorEmail);
             
             
                preparedStatement.setBytes(4, imageBytes);
                 preparedStatement.setString(5, about);
                preparedStatement.executeUpdate();
                response.sendRedirect("Admin/admin.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("An error occurred while processing your request: " + e.getMessage());
            } finally {
                connection.close();
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("kkk");
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
            out.println("<h1>Servlet tset at </h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
