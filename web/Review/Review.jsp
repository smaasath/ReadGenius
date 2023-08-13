
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
<%@ page import="classes.totalReview" %>
<%@ page import="classes.Reader" %>
<%@ page import="classes.ReaderDetails" %>
<%@ page import="classes.User" %>
<%@ page import="classes.UserDetails" %>
<%

   try{ 
   
   Integer userIdObj = (Integer) session.getAttribute("userId");
    
        if (userIdObj != null) {
            int userId = userIdObj.intValue(); // Convert Integer to int
            User user = UserDetails.getUserDetailsById(userId);
            if (user != null) {
       
        Reader reader = ReaderDetails.getReaderDetailsById(user.getReaderId());

    
%>
<%
    //   int bookId = Integer.parseInt(request.getParameter("bookId")); // Get book ID from request parameter

    String AuthorId = request.getParameter("AuthorId");
    String bookId = request.getParameter("BookId");
    String readerId = request.getParameter("ReaderId");
    int BookId = Integer.parseInt(bookId);
    int ReaderId = Integer.parseInt(readerId);

    Book book = BookDetails.getBookDetailsById(BookId);
    Author author = AuthorDetails.getAuthorDetailsById(book.getAuthorId());


%>
<!DOCTYPE html>
<html lang="en">

    <head>
         <link rel="stylesheet" href="../Home/nav.css"/> 
        <link rel="stylesheet" href="../Home/home.css"/> 
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/ReviewStyle.css">
        <link rel="stylesheet" href="css/c.css">
        <title>Document</title>
            <style>
        /****** Rating Starts *****/
        @import url(http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

        fieldset, label {
            margin: 0;
            padding: 0;
        }
        body{
            margin: 20px;
        }
        h1 {
            font-size: 1.5em;
            margin: 10px;
        }

        .rating {
            border: none;
            float: left;
        }

        .rating > input {
            display: none;
        }
        .rating > label:before {
            margin: 5px;
            font-size: 1.25em;
            font-family: FontAwesome;
            display: inline-block;
            content: "\f005";
        }

        .rating > .half:before {
            content: "\f089";
            position: absolute;
        }

        .rating > label {
            color: #000;
        }

        .rating > input:checked ~ label,
        .rating:not(:checked) > label:hover,
        .rating:not(:checked) > label:hover ~ label {
            color: #ffca08;
        }

        .rating > input:checked + label:hover,
        .rating > input:checked ~ label:hover,
        .rating > label:hover ~ input:checked ~ label,
        .rating > input:checked ~ label:hover ~ label {
            color: #ffca08;
        }

        .rating > label{
            float:right
        }
    </style>
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
                            <li><a class="dropdown-item" href="../Login/login.jsp">
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

        <div class="container-fluid p-5">

            <div class="row">
                <div class="col-lg-3">
                    <div class="row m-2 mt-0">
                        <div class=" p-4" style="text-align: center; height: 99%;background-color: #EEF1FF;">
                            <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(book.getImageBytes())%>" alt="Book Image" class="w-75 enlarge-on-hover" />

                            <div class="mt-4">
                                <div class="h6"> Overall</div>
                                <% DecimalFormat decimalFormat = new DecimalFormat("#.##");%>

                                <%

                                    String ratingStars = RatingUtils.generateRatingStars(floatIntoInt.convertFloatToInt((float) totalReview.getOverollRating(BookId)));%>

                                <%= ratingStars%>

                                <div class="h3">
                                    <%= decimalFormat.format(totalReview.getOverollRating(BookId))%></div>
                                <span class="h7 m-2"><%= (int) totalReview.getReviewCount(BookId)%> Reviews<span>
                                        </div>

                                        </div>
                                        </div>

                                        <div class="row m-2">

                                            <div class="h6 mt-4">Author</div>



                                            <div class=" p-4" style="text-align: center; height: 99%;background-color: #EEF1FF;">

                                                <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(author.getImageBytes())%>" class="enlarge-on-hover rounded-circle" alt="..."
                                                     style="height: 120px;width: 120px;">
                                                <div class="mt-4">
                                                    <div class="h4"><%= author.getAuthorName()%></div>
                                                    <br>
                                                    <div class="row">
                                                        <div class="col-2">
                                                            <i class="fa fa-envelope"></i>
                                                        </div>
                                                        <div class="col-9" style="text-align: start;">
                                                            <%= author.getAuthorEmail()%>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-2">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                        <div class="col-9" style="text-align: start;">
                                                            <%= author.getContactNum()%>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="h5 mt-3" style="text-align: justify;">About</div>
                                                <div class="p" style="text-align: justify;">
                                                    <%= author.getAuthorAbout()%>
                                                </div>

                                                <br>



                                            </div>





                                        </div>

                                        </div>

                                        <div class="col-lg-9" style="background-color: #EEF1FF;">
                                            <div class="row">
                                                <div class="m-1 p-4">
                                                    <div class="h1"><%= book.getTitle()%></div>

                                                    <div class="h6 disabled mt-3"><%= author.getAuthorName()%></div>

                                                    <div class="h6 disabled mt-3">Category : <%= book.getCategory()%></div>

                                                    <div class="h6 disabled mt-3">ISBN : <%= book.getIsbn()%></div>

                                                    <div class="h6 disabled mt-3">Published Date : <%= book.getPublicationDate()%></div>



                                                    <div class="mt-3">
                                                        <%= book.getDescription()%>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="h5 mt-4">Review</div>
                                            <div class="row">
                                                <div class="m-1 p-4">
                                                    <div class="row justify-content-center align-items-center">

                                                        <div class="col-lg-10 m-2 ms-5 p-3 rounded-3" style="background-color: #D2DAFF;">

                                                            <div class="row p-1 justify-content-center align-items-center">
                                                                <div class="col-3 p-1" style="color: black">5 Star</div> 
                                                                <div class="col-7 p-1">
                                                                    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                                        <div class="progress-bar bg-success" style="width: <%= totalReview.getreviewbystartvalue(BookId, 5)%>%"></div>
                                                                    </div>
                                                                </div>   
                                                                <div class="col-2 p-1" style="color: black"><%= (int) totalReview.getreviewcountbystarvalue(BookId, 5)%></div>     
                                                            </div>

                                                            <div class="row p-1 justify-content-center align-items-center">
                                                                <div class="col-3 p-1" style="color: black">4 Star</div> 
                                                                <div class="col-7 p-1">
                                                                    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                                        <div class="progress-bar  bg-info" style="width:<%= totalReview.getreviewbystartvalue(BookId, 4)%>%"></div>
                                                                    </div>
                                                                </div>   
                                                                <div class="col-2 p-1" style="color: black"><%= (int) totalReview.getreviewcountbystarvalue(BookId, 4)%></div>     
                                                            </div>

                                                            <div class="row p-1 justify-content-center align-items-center">
                                                                <div class="col-3 p-1" style="color: black">3 Star</div> 
                                                                <div class="col-7 p-1">
                                                                    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                                        <div class="progress-bar" style="width: <%= totalReview.getreviewbystartvalue(BookId, 3)%>%"></div>
                                                                    </div>
                                                                </div>   
                                                                <div class="col-2 p-1" style="color: black"><%= (int) totalReview.getreviewcountbystarvalue(BookId, 3)%></div>     
                                                            </div>

                                                            <div class="row p-1 justify-content-center align-items-center">
                                                                <div class="col-3 p-1" style="color: black">2 Star</div> 
                                                                <div class="col-7 p-1">
                                                                    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                                        <div class="progress-bar bg-warning" style="width: <%= totalReview.getreviewbystartvalue(BookId, 2)%>%"></div>
                                                                    </div>
                                                                </div>   
                                                                <div class="col-2 p-1" style="color: black"><%= (int) totalReview.getreviewcountbystarvalue(BookId, 2)%></div>     
                                                            </div>

                                                            <div class="row p-1 justify-content-center align-items-center">
                                                                <div class="col-3 p-1" style="color: black">1 Star</div> 
                                                                <div class="col-7 p-1">
                                                                    <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                                        <div class="progress-bar  bg-danger" style="width: <%= totalReview.getreviewbystartvalue(BookId, 1)%>%"></div>
                                                                    </div>
                                                                </div>   
                                                                <div class="col-2 p-1" style="color: black"><%= (int) totalReview.getreviewcountbystarvalue(BookId, 1)%></div>     
                                                            </div>


                                                        </div> 
                                                    </div>
                                                    <div class="row align-items-center justify-content-center">
                                                        <div class="col-lg-10 m-2 ms-5 p-3 rounded-3" style="background-color: #D2DAFF;">
                                                            <form action="ReviewProc.jsp" method="post">

                                                                <div class="row align-items-center justify-content-center">
                                                                    <div class="col-4"style="color: black; font-size: 10px; font-weight:bold">Select Your Rating</div>
                                                                    <div class="col-8">
                                                                        <label for="rating"></label>
                                                                        <fieldset class="rating">
                                                                            <input class="stars" type="radio" id="star5" name="rating" value="5" />
                                                                            <label class = "full" for="star5" title="Awesome - 5 stars"></label>
                                                                            <input class="stars" type="radio" id="star4" name="rating" value="4" />
                                                                            <label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                                                                            <input class="stars" type="radio" id="star3" name="rating" value="3" />
                                                                            <label class = "full" for="star3" title="Meh - 3 stars"></label>
                                                                            <input class="stars" type="radio" id="star2" name="rating" value="2" />
                                                                            <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                                                                            <input class="stars" type="radio" id="star1" name="rating" value="1" />
                                                                            <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                                                                        </fieldset>
                                                                    </div>
                                                                    <br> <br> <br>
                                                                    <div class="col-4"style="color: black; font-size: 10px; font-weight:bold">Enter Your Comments</div>
                                                                    <div class="col-8">
                                                                        <textarea class="form-control"  name="Review"  rows="7" required></textarea>
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" name="BookId" value='<%=bookId%>'>  
                                                                <input type="hidden" name="ReaderId" value='<%=readerId%>'>  
                                                                <input type="hidden" name="AuthorId" value='<%=AuthorId %>'> 
                                                                <br>
                                                                <div class="row"> 
                                                                    <div class="col-4"></div>
                                                                    <div class="col-8">
                                                                        <button type="submit" class="btn btn-success">Submit</button>
                                                                    </div>
                                                                </div>

                                                            </form>

                                                        </div> 

                                                    </div>
                                                </div>

                                            </div>




                                        </div>
                                        <br>

                                        <div class="row justify-content-center p-0">



                                        </div>

                                        </div>
                                                                <div>
                                                                    
                                                                    
                                                                    <%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    PreparedStatement preparedStatementReader = null;
    ResultSet resultSet = null;
    ResultSet resultSetReader = null;
  

    try {
        connection = DatabaseConnector.getConnection();
        String query = "SELECT * FROM bookreview WHERE bookId=?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, BookId);
        resultSet = preparedStatement.executeQuery();
%>
 <div class="h5 mt-4">Others Review</div>
 <div class=" p-4 mt-4" style="text-align: center; height: 99%;background-color: #EEF1FF; overflow: scroll;max-height: 600px;">
<%
    while (resultSet.next()) {
        int id = resultSet.getInt("reviewId");
        int readerIdd = resultSet.getInt("readerId");
        String reviewText = resultSet.getString("reviewText");
        float ratingValue = resultSet.getFloat("ratingValue");
        String queryReder = "SELECT * FROM reader WHERE readerId =?";
        preparedStatementReader = connection.prepareStatement(queryReder);
        preparedStatementReader.setInt(1, readerIdd);
        resultSetReader = preparedStatementReader.executeQuery();
         if (resultSetReader.next()) {
          String ReaderName = resultSetReader.getString("readerName");
              byte[] imageBytes = resultSetReader.getBytes("image");
%>

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

                                String ratingStarss = RatingUtils.generateRatingStars(floatIntoInt.convertFloatToInt((float) ratingValue));%>

                            <%= ratingStarss%>


                        </div>
                        <div class="p" style="color: black;font-size: 12px;"><%= reviewText%></div>
                    </div>

                </div>






            </div>



            </div>

     


        <%
            }}
        %>

   </div>

                                                                </div>





                                        <script src="js/ReviewJs.js"></script>
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
<% }}else{
response.sendRedirect("Login/login.jsp");
}




} catch (Exception e) {
        e.printStackTrace();
        
    }



%>