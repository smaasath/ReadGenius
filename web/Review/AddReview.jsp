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
    int BookId = 4;
    int ReaderId = 4;
    

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
    <body>
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
                     <input type="hidden" name="BookId" value='<%=BookId %>'>  
                      <input type="hidden" name="ReaderId" value='<%=ReaderId %>'>  
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
              
</body>
</html>
