package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class AuthorDetails {

    private static final String URL = "jdbc:mysql://localhost:3306/readgenius";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Author getAuthorDetailsById(int AuthorId) {
        Author author = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
                String query = "SELECT * FROM author WHERE authorId = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setInt(1, AuthorId);
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            int id = resultSet.getInt("authorId");
                            String authorName = resultSet.getString("authorName");
                            String contactNum = resultSet.getString("contactNum");
                            String authorEmail = resultSet.getString("authorEmail");
                            String about = resultSet.getString("about");
                            byte[] imageBytes = resultSet.getBytes("image");
                           

                            author = new Author(id, authorName,contactNum,authorEmail, imageBytes,about);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return author;
    }
}
