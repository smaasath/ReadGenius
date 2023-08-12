
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="classes.DatabaseConnector" %>
<%@ page import="classes.Book" %>
<%@ page import="classes.BookDetails" %>
<%@ page import="classes.Author" %>
<%@ page import="classes.AuthorDetails" %>
<%@ page import="classes.RatingUtils" %>
<%@ page import="classes.floatIntoInt" %>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    PreparedStatement preparedStatementReader = null;
    ResultSet resultSet = null;
    ResultSet resultSetReader = null;
    int BookId = 4; // Replace with the actual BookId

    try {
        connection = DatabaseConnector.getConnection();
        String query = "SELECT * FROM bookreview WHERE bookId=?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, BookId);
        resultSet = preparedStatement.executeQuery();
%>

<%
    while (resultSet.next()) {
        int id = resultSet.getInt("reviewId");
        int readerId = resultSet.getInt("readerId");
        String reviewText = resultSet.getString("reviewText");
        float ratingValue = resultSet.getFloat("ratingValue");
        String queryReder = "SELECT * FROM reader WHERE readerId =?";
        preparedStatementReader = connection.prepareStatement(queryReder);
        preparedStatementReader.setInt(1, readerId);
        resultSetReader = preparedStatementReader.executeQuery();
         if (resultSetReader.next()) {
          String ReaderName = resultSetReader.getString("readerName");
              byte[] imageBytes = resultSetReader.getBytes("image");
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Category1 Review</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/ReviewStyle.css">
    </head>

    <body>
        <div class="row ">
            <div class="col-lg-12 m-2 p-3 rounded-3" style="background-color: #D2DAFF;">



                <div class="row m-4 rounded-4" style="background-color: #EEF1FF;">
                    <div class="col-1 m-2">
                        <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imageBytes)%>" class="enlarge-on-hover rounded-circle" alt="..."
                             style="height: 50px;width: 50px;">
                    </div>

                    <div class="col-10 m-2" style="text-align: start;">
                        <div class="h6" style="color: black;"> <%= ReaderName%></div>
                        <div class="mb-2"style="color: black;">

                            <%  // Get the rating from the database or wherever

                                String ratingStars = RatingUtils.generateRatingStars(floatIntoInt.convertFloatToInt((float) ratingValue));%>

                            <%= ratingStars%>


                        </div>
                        <div class="p" style="color: black;font-size: 12px;"><%= reviewText%></div>
                    </div>

                </div>






            </div>




        </div>


        <%
            }}
        %>



    </body>

</html>


<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

