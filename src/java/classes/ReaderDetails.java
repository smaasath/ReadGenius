package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class ReaderDetails {

    private static final String URL = "jdbc:mysql://localhost:3306/readgenius";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Reader getReaderDetailsById(int readerId) {
        Reader reader = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
                String query = "SELECT * FROM reader WHERE readerId = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setInt(1, readerId );
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            int id = resultSet.getInt("readerId");
                            String readerName = resultSet.getString("readerName");
                            String readerEmail = resultSet.getString("readerEmail");
                        
                            byte[] imageBytes = resultSet.getBytes("image");
                           

                            reader = new Reader(id, readerName,readerEmail, imageBytes);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return reader;
    }
}
