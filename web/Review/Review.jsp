
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

<%
    //   int bookId = Integer.parseInt(request.getParameter("bookId")); // Get book ID from request parameter
    int bookId = 4;
    
    Book book = BookDetails.getBookDetailsById(bookId);
    Author author = AuthorDetails.getAuthorDetailsById(book.getAuthorId());


%>
<!DOCTYPE html>
<html lang="en">

    <head>
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
    </head>

    <body>
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

                                   String ratingStars = RatingUtils.generateRatingStars(floatIntoInt.convertFloatToInt((float)totalReview.getOverollRating(bookId))); %>

                                <%= ratingStars%>

                                <div class="h3">
                                    <%= decimalFormat.format(totalReview.getOverollRating(bookId))  %></div>
                                <span class="h7 m-2"><%= (int)totalReview.getReviewCount(bookId)  %> Reviews<span>
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

                                                    <div class="h6 disabled mt-3">Mark Haddon</div>

                                                    <div class="h6 disabled mt-3">Category : <%= book.getCategory()%></div>

                                                    <div class="h6 disabled mt-3">ISBN : <%= book.getIsbn()%></div>

                                                    <div class="h6 disabled mt-3">Published Date : <%= book.getPublicationDate()%></div>



                                                    <div class="mt-3">
                                                        <%= book.getDescription()%>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="h5 mt-4">Review</div>
                                            <div class="col-lg-12 p-0" style="background-color: #F2F3F4 ;">
                                                <header class="ps-3">
                                                    <nav>
                                                        <div id="bgSlider"></div>
                                                        <button class='active'>My Review</button>
                                                        <button>Reviews</button>
                                                        <div class="slideBar"></div>
                                                    </nav>
                                                </header>
                                                <main>

                                                </main>
                                            </div>

                                        </div>




                                        </div>
                                        <br>

                                        <div class="row justify-content-center p-0">



                                        </div>

                                        </div>






                                        <script src="js/ReviewJs.js"></script>
                                        </body>

                                        </html>

