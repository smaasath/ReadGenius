<%-- 
    Document   : UserProfileView
    Created on : Aug 12, 2023, 8:04:56 PM
    Author     : Texus
--%>

<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    try {

        Integer userIdObj = (Integer) session.getAttribute("userId");

        if (userIdObj != null) {
            int userId = userIdObj.intValue(); // Convert Integer to int
            User user = UserDetails.getUserDetailsById(userId);
            if (user != null) {

                Reader reader = ReaderDetails.getReaderDetailsById(user.getReaderId());


%>
<!DOCTYPE html>
<html>
    <head>
          <link rel="stylesheet" href="../Home/nav.css"/> 
        <link rel="stylesheet" href="../Home/home.css"/>
        <meta charset="UTF-8">
        <title>ReadGenius</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"/>
        <script src="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <!--fontawesom-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!--animation-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" integrity="sha512-doJrC/ocU8VGVRx3O9981+2aYUn3fuWVWvqLi1U+tA2MWVzsw+NVKq1PrENF03M+TYBP92PnYUlXFH1ZW0FpLw==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
        <!--main css-->

        <link rel="stylesheet" href="mynav.css"/> 
        <link rel="stylesheet" href="home.css"/> 
        <link rel="stylesheet" href="userprofile.css"/> 
        <link rel="stylesheet" href="profile.css"/>

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






    <div class="m-5" >


        <div class="container mt-5">

            <div class="row d-flex justify-content-center"style="margin-top:150px;">

                <div class="col-md-7">

                    <div class="card p-3 py-4">

                        <div class="text-center">
                            <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(reader.getImageBytes())%>" width="250" class="rounded-circle">
                        </div>

                        <div class="text-center mt-3">
                            <span class="bg-secondary p-1 px-4 rounded text-white">Reader</span>
                            <h5 class="mt-2 mb-0"><%=reader.getReaderName()%></h5>
                            <br>
                            <span>User Name: <%=user.getUserName()%></span>
                            <br>
                            <span>Email: <%=reader.getReaderEmail()%></span>
                            <br><br><br>




                            <div class="buttons">
                                <form method="POST" action="userprofile.jsp">
                                    
                                    <input type="hidden" name="UserId" value='<%= user.getUserId() %>'>
                                    <input type="hidden" name="ReaderId" value='<%= reader.getReaderId()%>'>
                                    <button class="btn btn-primary px-4 ms-3" type="submit">Edit</button>
                                </form>

                            </div>


                        </div>




                    </div>

                </div>

            </div>

        </div>    
    </div>


</body>
</html>
<% }
        } else {
            response.sendRedirect("Login/login.jsp");
        }

    } catch (Exception e) {
        e.printStackTrace();

    }


%>