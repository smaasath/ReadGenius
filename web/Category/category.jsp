<%-- 
    Document   : category
    Created on : Aug 11, 2023, 3:21:38 PM
    Author     : Janu
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="classes.DatabaseConnector" %>
<%@ page import="classes.Book" %>
<%@ page import="classes.BookDetails" %>
<%@ page import="classes.Author" %>
<%@ page import="classes.AuthorDetails" %>
<%@ page import="classes.RatingUtils" %>
<%@ page import="classes.floatIntoInt" %>
<%@ page import="classes.RatingUtils" %>
<%@ page import="classes.floatIntoInt" %>
<%@ page import="classes.totalReview" %>
<%@ page import="classes.Reader" %>
<%@ page import="classes.ReaderDetails" %>
<%@ page import="classes.User" %>
<%@ page import="classes.UserDetails" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
   try{ 
   
   Integer userIdObj = (Integer) session.getAttribute("userId");
    
        if (userIdObj != null) {
            int userId = userIdObj.intValue(); // Convert Integer to int
            User user = UserDetails.getUserDetailsById(userId);
            if (user != null) {
       
        Reader reader = ReaderDetails.getReaderDetailsById(user.getReaderId());

    
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Review Categories</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css\category.css">
        <link rel="stylesheet" href="css\nav.css">
    </head>

    <body>




        <section>
            <%    try {
                    connection = DatabaseConnector.getConnection();
                    statement = connection.createStatement();
                    String query = "SELECT * FROM `book` WHERE category='Horror'";
                    resultSet = statement.executeQuery(query); %>
            <div class="container-fluid px-5">
                <div class="row cat-bg p-2 rounded-4 justify-content-between mt-5">
                    <div class="col-auto my-2">
                        <h3 class="cat-head">HORROR</h3>
                    </div>
                    <br>
                    <br>
                    <div class="col-auto text-right">
                        <a class="btn btn-primary my-2" href="#carouselExampleIndicators1" role="button"
                           data-bs-slide="prev">
                            <i class="fa fa-arrow-left"></i>
                        </a>
                        <a class="btn btn-primary" href="#carouselExampleIndicators1" role="button" data-bs-slide="next">
                            <i class="fa fa-arrow-right"></i>
                        </a>
                    </div>
                    <div class="col-12">
                        <div id="carouselExampleIndicators1" class="carousel slide" data-bs-ride="carousel">

                            <div class="carousel-inner">
                                <%                                    int cardCount = 0;
                                    while (resultSet.next()) {
                                        int id = resultSet.getInt("bookId");
                                        Book book = BookDetails.getBookDetailsById(id);
                                        Author author = AuthorDetails.getAuthorDetailsById(book.getAuthorId());

                                        if (cardCount % 2 == 0) {
                                %>
                                <div class="carousel-item  <%= cardCount == 0 ? "active" : ""%>">
                                    <div class="row justify-content-center">
                                        <% }%>
                                        <div class="col-lg-5 m-3 card-style">
                                            <div class="row">
                                                <div class="col-8">
                                                    <div class="card-body">
                                                        <h4 class="card-title mt-4"><%= book.getTitle()%></h4>

                                                        <div class="postcard__bar"></div>



                                                        <div class="row m-1 mt-2">
                                                            <div class="col-3">
                                                                <span class="h7">Rating</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <% DecimalFormat decimalFormat = new DecimalFormat("#.##");%>

                                                                <%

                                                                    String ratingStars = RatingUtils.generateRatingStars(floatIntoInt.convertFloatToInt((float) totalReview.getOverollRating(book.getBookId())));%>

                                                                <%= ratingStars%>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">Author</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= author.getAuthorName()%></span>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">ISBN</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= book.getIsbn()%></span>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">Publication Date</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= book.getPublicationDate()%></span>
                                                            </div>
                                                        </div>
                                                        <br>


                                                        <form action="../Review/Review.jsp" method="post">
                                                            <input type="hidden" name="BookId" value='<%= book.getBookId()%>'>  
                                                            <input type="hidden" name="AuthorId" value='<%= book.getAuthorId()%>'>
                                                            <input type="hidden" name="ReaderId" value='<%= reader.getReaderId() %>'>
                                                            <button type="submit" class="btn btn-dark">Submit</button>
                                                        </form>


                                                    </div>
                                                    <br>
                                                </div>

                                                <!-- Image -->
                                                <div class="col-4 text-end image-container p-0">
                                                    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(book.getImageBytes())%>" class="enlarge-on-hover img-fluid"
                                                         alt="...">
                                                </div>
                                                <!-- Image -->
                                            </div>

                                        </div>
                                        <% if (cardCount % 2 != 0) {
                                                // Close the carousel item every two cards
                                        %>
                                    </div>
                                </div>
                                <% } %>
                                <% cardCount++;
                                    }
                                %>
                            </div>

                        </div>
                    </div>

                    <div class="justify-content-end d-flex py-2">
                        <form action="viewHorror.jsp" method="post">
                            <button type="submit" class="btn btn-dark">View More</button>
                        </form>
                    </div>

                </div>
            </div>

            <%    } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>

        </section>


        <section>
            <%    try {
                    connection = DatabaseConnector.getConnection();
                    statement = connection.createStatement();
                    String query = "SELECT * FROM `book` WHERE category='Historical'";
                    resultSet = statement.executeQuery(query); %>
            <div class="container-fluid px-5">
                <div class="row cat-bg p-2 rounded-4 justify-content-between mt-5">
                    <div class="col-auto my-2">
                        <h3 class="cat-head">HISTORICAL</h3>
                    </div>
                    <br>
                    <br>
                    <div class="col-auto text-right">
                        <a class="btn btn-primary my-2" href="#carouselExampleIndicators1" role="button"
                           data-bs-slide="prev">
                            <i class="fa fa-arrow-left"></i>
                        </a>
                        <a class="btn btn-primary" href="#carouselExampleIndicators1" role="button" data-bs-slide="next">
                            <i class="fa fa-arrow-right"></i>
                        </a>
                    </div>
                    <div class="col-12">
                        <div id="carouselExampleIndicators1" class="carousel slide" data-bs-ride="carousel">

                            <div class="carousel-inner">
                                <%                                    int cardCount = 0;
                                    while (resultSet.next()) {
                                        int id = resultSet.getInt("bookId");
                                        Book book = BookDetails.getBookDetailsById(id);
                                        Author author = AuthorDetails.getAuthorDetailsById(book.getAuthorId());

                                        if (cardCount % 2 == 0) {
                                %>
                                <div class="carousel-item  <%= cardCount == 0 ? "active" : ""%>">
                                    <div class="row justify-content-center">
                                        <% }%>
                                        <div class="col-lg-5 m-3 card-style">
                                            <div class="row">
                                                <div class="col-8">
                                                    <div class="card-body">
                                                        <h4 class="card-title mt-4"><%= book.getTitle()%></h4>

                                                        <div class="postcard__bar"></div>



                                                        <div class="row m-1 mt-2">
                                                            <div class="col-3">
                                                                <span class="h7">Rating</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <% DecimalFormat decimalFormat = new DecimalFormat("#.##");%>

                                                                <%

                                                                    String ratingStars = RatingUtils.generateRatingStars(floatIntoInt.convertFloatToInt((float) totalReview.getOverollRating(book.getBookId())));%>

                                                                <%= ratingStars%>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">Author</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= author.getAuthorName()%></span>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">ISBN</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= book.getIsbn()%></span>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">Publication Date</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= book.getPublicationDate()%></span>
                                                            </div>
                                                        </div>
                                                        <br>


                                                        <form action="../Review/Review.jsp" method="post">
                                                            <input type="hidden" name="BookId" value='<%= book.getBookId()%>'>  
                                                            <input type="hidden" name="AuthorId" value='<%= book.getAuthorId()%>'>
                                                            <input type="hidden" name="ReaderId" value='<%= reader.getReaderId() %>'>
                                                            <button type="submit" class="btn btn-dark">Submit</button>
                                                        </form>


                                                    </div>
                                                    <br>
                                                </div>

                                                <!-- Image -->
                                                <div class="col-4 text-end image-container p-0">
                                                    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(book.getImageBytes())%>" class="enlarge-on-hover img-fluid"
                                                         alt="...">
                                                </div>
                                                <!-- Image -->
                                            </div>

                                        </div>
                                        <% if (cardCount % 2 != 0) {
                                                // Close the carousel item every two cards
                                        %>
                                    </div>
                                </div>
                                <% } %>
                                <% cardCount++;
                                    }
                                %>
                            </div>

                        </div>
                    </div>

                    <div class="justify-content-end d-flex py-2">
                        <form action="viewHorror.jsp" method="post">
                            <button type="submit" class="btn btn-dark">View More</button>
                        </form>
                    </div>

                </div>
            </div>

            <%    } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>

        </section>


        <section>
            <%    try {
                    connection = DatabaseConnector.getConnection();
                    statement = connection.createStatement();
                    String query = "SELECT * FROM `book` WHERE category='Love'";
                    resultSet = statement.executeQuery(query); %>
            <div class="container-fluid px-5">
                <div class="row cat-bg p-2 rounded-4 justify-content-between mt-5">
                    <div class="col-auto my-2">
                        <h3 class="cat-head">LOVE</h3>
                    </div>
                    <br>
                    <br>
                    <div class="col-auto text-right">
                        <a class="btn btn-primary my-2" href="#carouselExampleIndicators1" role="button"
                           data-bs-slide="prev">
                            <i class="fa fa-arrow-left"></i>
                        </a>
                        <a class="btn btn-primary" href="#carouselExampleIndicators1" role="button" data-bs-slide="next">
                            <i class="fa fa-arrow-right"></i>
                        </a>
                    </div>
                    <div class="col-12">
                        <div id="carouselExampleIndicators1" class="carousel slide" data-bs-ride="carousel">

                            <div class="carousel-inner">
                                <%                                    int cardCount = 0;
                                    while (resultSet.next()) {
                                        int id = resultSet.getInt("bookId");
                                        Book book = BookDetails.getBookDetailsById(id);
                                        Author author = AuthorDetails.getAuthorDetailsById(book.getAuthorId());

                                        if (cardCount % 2 == 0) {
                                %>
                                <div class="carousel-item  <%= cardCount == 0 ? "active" : ""%>">
                                    <div class="row justify-content-center">
                                        <% }%>
                                        <div class="col-lg-5 m-3 card-style">
                                            <div class="row">
                                                <div class="col-8">
                                                    <div class="card-body">
                                                        <h4 class="card-title mt-4"><%= book.getTitle()%></h4>

                                                        <div class="postcard__bar"></div>



                                                        <div class="row m-1 mt-2">
                                                            <div class="col-3">
                                                                <span class="h7">Rating</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <% DecimalFormat decimalFormat = new DecimalFormat("#.##");%>

                                                                <%

                                                                    String ratingStars = RatingUtils.generateRatingStars(floatIntoInt.convertFloatToInt((float) totalReview.getOverollRating(book.getBookId())));%>

                                                                <%= ratingStars%>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">Author</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= author.getAuthorName()%></span>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">ISBN</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= book.getIsbn()%></span>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">Publication Date</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= book.getPublicationDate()%></span>
                                                            </div>
                                                        </div>
                                                        <br>


                                                        <form action="../Review/Review.jsp" method="post">
                                                            <input type="hidden" name="BookId" value='<%= book.getBookId()%>'>  
                                                            <input type="hidden" name="AuthorId" value='<%= book.getAuthorId()%>'>
                                                            <input type="hidden" name="ReaderId" value='<%= reader.getReaderId() %>'>
                                                            <button type="submit" class="btn btn-dark">Submit</button>
                                                        </form>


                                                    </div>
                                                    <br>
                                                </div>

                                                <!-- Image -->
                                                <div class="col-4 text-end image-container p-0">
                                                    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(book.getImageBytes())%>" class="enlarge-on-hover img-fluid"
                                                         alt="...">
                                                </div>
                                                <!-- Image -->
                                            </div>

                                        </div>
                                        <% if (cardCount % 2 != 0) {
                                                // Close the carousel item every two cards
                                        %>
                                    </div>
                                </div>
                                <% } %>
                                <% cardCount++;
                                    }
                                %>
                            </div>

                        </div>
                    </div>

                    <div class="justify-content-end d-flex py-2">
                        <form action="viewHorror.jsp" method="post">
                            <button type="submit" class="btn btn-dark">View More</button>
                        </form>
                    </div>

                </div>
            </div>

            <%    } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>

        </section>


        <section>
            <%    try {
                    connection = DatabaseConnector.getConnection();
                    statement = connection.createStatement();
                    String query = "SELECT * FROM `book` WHERE category='Fiction'";
                    resultSet = statement.executeQuery(query); %>
            <div class="container-fluid px-5 pb-5">
                <div class="row cat-bg p-2 rounded-4 justify-content-between mt-5">
                    <div class="col-auto my-2">
                        <h3 class="cat-head">FICTION</h3>
                    </div>
                    <br>
                    <br>
                    <div class="col-auto text-right">
                        <a class="btn btn-primary my-2" href="#carouselExampleIndicators1" role="button"
                           data-bs-slide="prev">
                            <i class="fa fa-arrow-left"></i>
                        </a>
                        <a class="btn btn-primary" href="#carouselExampleIndicators1" role="button" data-bs-slide="next">
                            <i class="fa fa-arrow-right"></i>
                        </a>
                    </div>
                    <div class="col-12">
                        <div id="carouselExampleIndicators1" class="carousel slide" data-bs-ride="carousel">

                            <div class="carousel-inner">
                                <%                                    int cardCount = 0;
                                    while (resultSet.next()) {
                                        int id = resultSet.getInt("bookId");
                                        Book book = BookDetails.getBookDetailsById(id);
                                        Author author = AuthorDetails.getAuthorDetailsById(book.getAuthorId());

                                        if (cardCount % 2 == 0) {
                                %>
                                <div class="carousel-item  <%= cardCount == 0 ? "active" : ""%>">
                                    <div class="row justify-content-center">
                                        <% }%>
                                        <div class="col-lg-5 m-3 card-style">
                                            <div class="row">
                                                <div class="col-8">
                                                    <div class="card-body">
                                                        <h4 class="card-title mt-4"><%= book.getTitle()%></h4>

                                                        <div class="postcard__bar"></div>



                                                        <div class="row m-1 mt-2">
                                                            <div class="col-3">
                                                                <span class="h7">Rating</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <% DecimalFormat decimalFormat = new DecimalFormat("#.##");%>

                                                                <%

                                                                    String ratingStars = RatingUtils.generateRatingStars(floatIntoInt.convertFloatToInt((float) totalReview.getOverollRating(book.getBookId())));%>

                                                                <%= ratingStars%>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">Author</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= author.getAuthorName()%></span>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">ISBN</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= book.getIsbn()%></span>
                                                            </div>
                                                        </div>

                                                        <div class="row m-1">
                                                            <div class="col-3">
                                                                <span class="h7">Publication Date</span>
                                                            </div>
                                                            <div class="col-9">
                                                                <span class="p"><%= book.getPublicationDate()%></span>
                                                            </div>
                                                        </div>
                                                        <br>


                                                        <form action="../Review/Review.jsp" method="post">
                                                            <input type="hidden" name="BookId" value='<%= book.getBookId()%>'>  
                                                            <input type="hidden" name="AuthorId" value='<%= book.getAuthorId()%>'>
                                                            <input type="hidden" name="ReaderId" value='<%= reader.getReaderId() %>'>
                                                            <button type="submit" class="btn btn-dark">Submit</button>
                                                        </form>


                                                    </div>
                                                    <br>
                                                </div>

                                                <!-- Image -->
                                                <div class="col-4 text-end image-container p-0">
                                                    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(book.getImageBytes())%>" class="enlarge-on-hover img-fluid"
                                                         alt="...">
                                                </div>
                                                <!-- Image -->
                                            </div>

                                        </div>
                                        <% if (cardCount % 2 != 0) {
                                                // Close the carousel item every two cards
                                        %>
                                    </div>
                                </div>
                                <% } %>
                                <% cardCount++;
                                    }
                                %>
                            </div>

                        </div>
                    </div>

                    <div class="justify-content-end d-flex py-2">
                        <form action="viewHorror.jsp" method="post">
                            <button type="submit" class="btn btn-dark">View More</button>
                        </form>
                    </div>

                </div>
            </div>

            <%    } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>

        </section>

    </body>

    <script type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
    <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="category.js"></script>
</body>

</html>
<% }}else{
response.sendRedirect("Login/login.jsp");
}




} catch (Exception e) {
        e.printStackTrace();
        
    }



%>