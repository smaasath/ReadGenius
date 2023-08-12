package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class UserDetails {

    private static final String URL = "jdbc:mysql://localhost:3306/readgenius";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static User getUserDetailsById(int userId) {
        User user = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
                String query = "SELECT * FROM user WHERE userId = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setInt(1, userId);
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            int id = resultSet.getInt("userId");
                            String userName = resultSet.getString("userName");
                            String Password = resultSet.getString("Password");
                            int readerId = resultSet.getInt("readerId");
                           

                            user = new User(id, userName,Password,readerId);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}
