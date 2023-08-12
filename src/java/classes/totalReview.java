/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Texus
 */
public class totalReview {

    private static final String URL = "jdbc:mysql://localhost:3306/readgenius";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static float getOverollRating(int BookId) {
        float total = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            String query = "SELECT * FROM bookreview WHERE bookId = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, BookId);
                ResultSet resultSet = preparedStatement.executeQuery();
                float sum = 0;
                float count = 0;

                while (resultSet.next()) {
                    int id = resultSet.getInt("ratingValue");
                    sum = sum + id;
                    count++;

                }
                total = sum / count;

            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return total;

    }

    public static float getReviewCount(int BookId) {
        float total = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            String query = "SELECT COUNT(*) AS count FROM bookreview WHERE bookId = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, BookId);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        total = resultSet.getFloat("count");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return total;

    }

    public static float getreviewcountbystarvalue(int BookId, int startvalue) {
        float countWithRating = 0;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            float totalCount = getReviewCount(BookId);
            String query = "SELECT COUNT(*) AS count FROM bookreview WHERE bookId = ? AND ratingValue = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, BookId);
                preparedStatement.setInt(2, startvalue);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        countWithRating = resultSet.getFloat("count");

                    }
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return countWithRating;

    }

    public static float getreviewbystartvalue(int BookId, int startvalue) {

        float percentage = 0;

        float countWithRating = getreviewcountbystarvalue(BookId, startvalue);
        float totalCount = getReviewCount(BookId);
        if (totalCount > 0) {
            percentage = (countWithRating / totalCount) * 100;
        }

        return percentage;
    }

    public static void AddReview(String BookId, String ReaderId, String Review, String rating) {

        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);

            String insertQuery = "INSERT INTO `bookreview` (`reviewId`, `bookId`, `readerId`, `reviewText`, `ratingValue`) VALUES (NULL,?,?,?,?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setInt(1, Integer.parseInt(BookId));
                preparedStatement.setInt(2, Integer.parseInt(ReaderId));
                preparedStatement.setString(3, Review);
                preparedStatement.setString(4, rating);
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Data inserted successfully!");
                } else {
                    System.out.println("Failed to insert data.");
                }
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
