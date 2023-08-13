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
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="classes.Reader" %>
<%@ page import="classes.ReaderDetails" %>
<%@ page import="classes.User" %>
<%@ page import="classes.UserDetails" %>
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
          <link rel="stylesheet" href="../Home/nav.css"/> 
        <link rel="stylesheet" href="../Home/home.css"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Historical Books</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css\category.css">
        <link rel="stylesheet" href="css\nav.css">
    </head>

    <body>
 <style>
            body {
                background-color: #F1F0F0;
                overflow-x: hidden;
            }
            .nav-item dropdown  {
                font-weight: bold;
            }


        </style>
        <nav>
        <div class="row mb-5">
            <nav class="navbar navbar-expand-lg fixed-top" style="background-color:#B2B2B2 ;height: 90px;" >
                <div class="container">

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a class="navbar-brand " href="#"><img src="Home/img/logo.png" width="137px" height="43px" alt="ReadGenius"/></a>
                    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                        <ul class="navbar-nav">

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="../index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="../Category/category.jsp">Category</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="../Home/UserProfileView.jsp">Profile</a>
                            </li>
                           

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"  >
                                    Category
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="../Category/viewFiction.jsp">Fiction</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="../Category/viewHistorical.jsp">Historical</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="../Category/viewHorror.jsp">Horror</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="../Category/viewLove.jsp">Love</a></li>
                                </ul>
                            </li>


                            <li class="nav-item">
                                <!--search-->
                                <form class="d-flex" role="search">
                                    <input class="form-control me-2 border-0" list="datalistOptions" id="exampleDataList" type="search" placeholder="Search" aria-label="Search" style="border-radius: 50px;background-color: #F4F4F4" size="30px">
                                    <button class="btn btn-outline-primary " type="submit" style="border-radius: 50px;"><i class="fa fa-magnifying-glass " ></i></button>
                                    <datalist id="datalistOptions" class="bg-white text-muted">
                                        <option value="Education">
                                        <option value="Novels">
                                        <option value="Poetry">
                                        <option value="Romance">
                                        <option value="Fiction">
                                        <option value="Non-Fiction">
                                    </datalist>
                                </form>

                            </li>

                        </ul>
                    </div>
                    <div class="d-flex ">


                    </div>
                    <!--profile--> 
                    <div class="dropdown ">
                        <dvi class="" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <a class="navbar-brand " href="" type="button" > <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(reader.getImageBytes())%>" alt="avatar" class="rounded-circle me-2 "
                                                                                  style="width: 38px; height: 38px; object-fit: cover" data-bs-toggle="tooltip" data-bs-title=" See your profile" data-bs-placement="bottom" data-bs-title="Tooltip on bottom" /></a>
                        </dvi>                                                                       
                        <ul class="dropdown-menu border-0 shadow">
                            <!--avatar-->
                            <li><a class="dropdown-item" href="../Home/UserProfileView.jsp">
                                    <div class="d-flex align-items-center">
                                        <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(reader.getImageBytes())%>" alt="avatar" class="rounded-circle me-2 "style="width: 48px; height: 48px; object-fit: cover"/>

                                    </div>
                                </a></li>
                            <!--settings-->
                            <!-- <li><a class="dropdown-item" href="#">
                                    <div class="d-flex align-items-center me-2">
                                        <i class="fas fa-cog justify-content-center fs-5"></i>
                                        <p class="m-0 ms-2">Settings</p>
                                    </div>
                                </a></li> -->
                            <hr>
                            <!--logout-->
                            <li><a class="dropdown-item" href="../Login/login.php">
                                    <div class="d-flex align-items-center me-2">
                                        <i class="fa fa-sign-out justify-content-center fs-5"></i>
                                        <p class="m-0 ms-2">Log out</p>
                                    </div>
                                </a></li>
                        </ul>
                    </div>
                </div>
        </div>
    </nav>



        <section>
            <%    try {
                    connection = DatabaseConnector.getConnection();
                    statement = connection.createStatement();
                    String query = "SELECT * FROM `book` WHERE category='Historical'";
                    resultSet = statement.executeQuery(query); %>
            <div class="container-fluid px-5 pb-5">
                <div class="row cat-bg p-2 rounded-4 justify-content-between mt-5">
                    <div class="col-auto my-2">
                        <h3 class="cat-head">HISTORICAL</h3>
                    </div>
                    <br>
                    <br>

                    <div class="container">
                        <div class="row">
                            <%                                    while (resultSet.next()) {
                                    int id = resultSet.getInt("bookId");
                                    Book book = BookDetails.getBookDetailsById(id);
                                    Author author = AuthorDetails.getAuthorDetailsById(book.getAuthorId());


                            %>



                            <div class="col-sm-6">

                                <div class="m-3 card-style">
                                    <div class="row">
                                        <div class="col-8">
                                            <div class="card-body p-4">
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


                                                <form action="test.jsp" method="post">
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

                            </div>


                            <%
                                }
                            %>

                        </div>


                    </div>
                    <br>
                    <br>

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