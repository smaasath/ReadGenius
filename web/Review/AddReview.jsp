<%-- 
    Document   : AddReview
    Created on : Aug 11, 2023, 8:18:24 PM
    Author     : Texus
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="classes.DatabaseConnector" %>
<%@ page import="classes.Book" %>
<%@ page import="classes.BookDetails" %>
<%@ page import="classes.Author" %>
<%@ page import="classes.AuthorDetails" %>
<%@ page import="classes.RatingUtils" %>
<%@ page import="classes.floatIntoInt" %>
<%@ page import="classes.totalReview" %>
<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    int BookId = 4; // Replace with the actual BookId

  %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/ReviewStyle.css">
        <title>Add Review Page</title>
    </head>
    <body>
        <div class="row">
           
            <div class="col-lg-5 m-2 ms-5 p-3 rounded-3" style="background-color: #D2DAFF;">

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">5 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar bg-success" style="width: <%= totalReview.getreviewbystartvalue(BookId, 5)  %>%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black"><%= (int)totalReview.getreviewcountbystarvalue(BookId, 5)  %></div>     
                </div>

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">4 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar  bg-info" style="width:<%= totalReview.getreviewbystartvalue(BookId, 4)  %>%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black"><%= (int)totalReview.getreviewcountbystarvalue(BookId, 4)  %></div>     
                </div>

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">3 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar" style="width: <%= totalReview.getreviewbystartvalue(BookId, 3)  %>%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black"><%= (int)totalReview.getreviewcountbystarvalue(BookId, 3)  %></div>     
                </div>

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">2 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar bg-warning" style="width: <%= totalReview.getreviewbystartvalue(BookId, 2)  %>%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black"><%= (int)totalReview.getreviewcountbystarvalue(BookId, 2)  %></div>     
                </div>

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">1 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar  bg-danger" style="width: <%= totalReview.getreviewbystartvalue(BookId, 1)  %>%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black"><%= (int)totalReview.getreviewcountbystarvalue(BookId, 1)  %></div>     
                </div>


            </div> 
   
            
             <div class="col-lg-5 m-2 ms-5 p-3 rounded-3" style="background-color: #D2DAFF;">

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">5 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar bg-success" style="width: 20%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black">100</div>     
                </div>

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">4 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar  bg-info" style="width: 40%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black">200</div>     
                </div>

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">3 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar" style="width: 50%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black">50</div>     
                </div>

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">2 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar bg-warning" style="width: 35%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black">35</div>     
                </div>

                <div class="row p-1 justify-content-center align-items-center">
                    <div class="col-3 p-1" style="color: black">1 Star</div> 
                    <div class="col-7 p-1">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar  bg-danger" style="width: 10%"></div>
                        </div>
                    </div>   
                    <div class="col-2 p-1" style="color: black">50</div>     
                </div>


            </div> 
            
             </div>
    </body>
</html>
