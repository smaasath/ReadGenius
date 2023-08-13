<%@page import="java.sql.SQLException"%>
<%@page import="classes.Author"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHPWebPage.php to edit this template
-->
<html>
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <title>Admin DashBoard</title>
        <link rel="stylesheet" href="css/admin.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">

        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Arvo:wght@400;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    </head>
    <body>
        <div class="container-fluid">
            <div class="row flex-wrap flex-row-reverse">
                <!-- large Side bar start-->

                <div id="col2" class="col-2 colordashbord fixed-top">

                    <hr class="dashboardhr">
                    <div class="nav nav-pills flex-column mb-auto logoutheight" >
                        <button onclick="bigtosmal()" style="background-color: transparent;
                                border: none;"><i class="fa-solid fa-arrow-right-to-bracket fa-flip-horizontal fa-lg" style="color: #000;"></i></button>

                        <div style="text-align-last: center;">
                            <img src="../Images/logo.png" alt="Home"  class="w-75">
                        </div>
                    </div>
                    <hr class="dashboardhr">
                    <div class="nav nav-pills flex-column mb-1">


                        <li>
                            <a href="#" class="nav-link navbarcolor"  aria-current="page">

                                <i class="fa-solid fa-book fa-xl icondash"></i>

                                Book

                            </a>

                        </li>


                        <li><a class="dropdown-item" href="../Login/login.jsp">
                                <div class="d-flex align-items-center me-2">
                                    <i class="fa fa-sign-out justify-content-center fs-5"></i>
                                    <p class="m-0 ms-2">Log out</p>
                                </div>
                            </a></li>





                    </div>


                </div>

                <!--  large Side bar end-->



                <!--  body-->
                <div id="col10"class="col-10 col10edit">

                    <!-- nav bar start -->
                    <div class="sticky-top bg-white shadownav" style="height: 50px;">
                        <div class="row d-flex justify-content-end p-2">
                            <div class="col-3">
                                <div class="row">
                                    <div class="col-3">
                                        <b>Admin</b>
                                    </div>
                                    <div class="col-2">
                                        <i class="fa-solid fa-user fa-xl"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- nav bar end -->


                    <!-- Table -->

                    <div class="p-5">


                        <div class="rounded-top-4 p-0 border border-dark-subtle">
                            <div class="row align-items-center">
                                <div class="col-3">           
                                    <div class="input-group rounded p-3">
                                        <input type="search" class="form-control rounded" placeholder="Search ID" aria-label="Search" aria-describedby="search-addon" >



                                    </div>
                                </div>



                                <div class="col-2"> 
                                    <button type="button" class="btn btn-primary bgcol" data-bs-toggle="modal" data-bs-target="#AddBook">Add Book</button>
                                </div>

                                <div class="col-2"> 
                                    <button type="button" class="btn btn-primary bgcol" data-bs-toggle="modal" data-bs-target="#AddAuthor">Add Author</button>
                                </div>


                            </div>









                        </div>


                    </div>

                    <!-- Table -->







                    <!-- Add book -->
                    <div class="modal fade" id="AddBook" tabindex="-1" aria-labelledby="AddBook" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="AddBook">Add Book</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="../book" method="post" enctype="multipart/form-data">
                                    <div class="modal-body">

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>Book Title</h6>
                                            </div>
                                            <div class="col-9">
                                                <input type="text"   name="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
                                            </div>
                                        </div>

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>isbn</h6>
                                            </div>
                                            <div class="col-9">
                                                <input type="text"   name="isbn" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
                                            </div>
                                        </div>

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>publicationDate</h6>
                                            </div>
                                            <div class="col-9">
                                                <input type="date"   name="publicationDate" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
                                            </div>
                                        </div>

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>Category</h6>
                                            </div>
                                            <div class="col-9">
                                                <select  name="category" class="form-select" aria-label="Default select example" required>

                                                    <option value="Horror">Horror</option>
                                                    <option value="Historical">Historical</option>
                                                    <option value="Love">Love</option>
                                                    <option value="Fiction">Fiction</option>

                                                </select>
                                            </div>
                                        </div>


                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>Description</h6>
                                            </div>
                                            <div class="col-9">
                                                <textarea class="form-control" name="Description" rows="4" required></textarea>
                                            </div>
                                        </div>

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>Image</h6>
                                            </div>
                                            <div class="col-9">
                                                <input type="file" accept="image/jpeg"  name="image" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
                                            </div>
                                        </div>

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>Author</h6>
                                            </div>
                                            <div class="col-9">
                                                <select  name="authorId" class="form-select" aria-label="Default select example" required>
                                                    <%

                                                        Class.forName("com.mysql.jdbc.Driver");

                                                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/readgenius", "root", "");
                                                        String query = "SELECT * FROM author";
                                                        PreparedStatement preparedStatement = connection.prepareStatement(query);

                                                        ResultSet resultSet = preparedStatement.executeQuery();
                                                        while (resultSet.next()) {
                                                            int id = resultSet.getInt("authorId");
                                                            String authorName = resultSet.getString("authorName");
                                                            String contactNum = resultSet.getString("contactNum");
                                                            String authorEmail = resultSet.getString("authorEmail");
                                                            String about = resultSet.getString("about");
                                                            byte[] imageBytes = resultSet.getBytes("image");


                                                    %>



                                                    <option value="<%=id%>"><%=authorName%></option>



                                                    <%
                                                        }


                                                    %>




                                                </select>
                                            </div>
                                        </div>




                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="button">save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Add book -->











                    <!-- Add Author -->
                    <div class="modal fade" id="AddAuthor" tabindex="-1" aria-labelledby="AddAuthor" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="AddAuthor">Add Author</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="../author" method="post" enctype="multipart/form-data">
                                    <div class="modal-body">

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>Author Name</h6>
                                            </div>
                                            <div class="col-9">
                                                <input type="text"   name="authorName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
                                            </div>
                                        </div>

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>Contact Num</h6>
                                            </div>
                                            <div class="col-9">
                                                <input type="text"   name="contactNum" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
                                            </div>
                                        </div>

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>Author Email</h6>
                                            </div>
                                            <div class="col-9">
                                                <input type="text"   name="authorEmail" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
                                            </div>
                                        </div>



                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>about</h6>
                                            </div>
                                            <div class="col-9">
                                                <textarea class="form-control" name="about" rows="4" required></textarea>
                                            </div>
                                        </div>

                                        <div class="row align-items-center pb-3">
                                            <div class="col-3">
                                                <h6>Image</h6>
                                            </div>
                                            <div class="col-9">
                                                <input type="file" accept="image/jpeg"  name="image" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
                                            </div>
                                        </div>





                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="button">save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Add Author -->

                </div>







            </div>
        </div>







        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="js/admin.js"></script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
