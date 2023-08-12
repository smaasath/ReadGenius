package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class BookDetails {

    private static final String URL = "jdbc:mysql://localhost:3306/readgenius";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Book getBookDetailsById(int bookId) {
        Book book = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
                String query = "SELECT * FROM book WHERE bookId = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setInt(1, bookId);
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            int id = resultSet.getInt("bookId");
                            String title = resultSet.getString("title");
                            String isbn = resultSet.getString("isbn");
                            Date publicationDate = resultSet.getDate("publicationDate");
                            String category = resultSet.getString("category");
                            String Description = resultSet.getString("Description");
                            byte[] imageBytes = resultSet.getBytes("image");
                            int authorId = resultSet.getInt("authorId");

                            book = new Book(id, isbn,title,publicationDate, category,Description,imageBytes,authorId);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return book;
    }
}
