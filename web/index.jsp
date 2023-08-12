<%-- 
    Document   : index.jsp
    Created on : Aug 12, 2023, 8:42:05 PM
    Author     : Texus
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.Base64"%>
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
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>ReadGenius</title>
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <!--fontawesom-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!--animation-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" integrity="sha512-doJrC/ocU8VGVRx3O9981+2aYUn3fuWVWvqLi1U+tA2MWVzsw+NVKq1PrENF03M+TYBP92PnYUlXFH1ZW0FpLw==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
        <!--main css-->

        <link rel="stylesheet" href="Home/nav.css"/> 
        <link rel="stylesheet" href="Home/home.css"/> 

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
        <div class="comm">
            <nav class="navbar navbar-expand-lg fixed-top" style="background-color:#B2B2B2 ;height: 90px;" >
                <div class="container">

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a class="navbar-brand " href="#"><img src="Home/img/logo.png" width="137px" height="43px" alt="ReadGenius"/></a>
                    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                        <ul class="navbar-nav">

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href=" ">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href=" ">Book Feed</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href=" ">Review</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href=" ">Wishlist</a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"  >
                                    Category
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Education</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Fiction</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Non-Fiction</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Poetry</a></li>
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
                            <li><a class="dropdown-item" href="Home/UserProfileView.jsp">
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
                            <li><a class="dropdown-item" href="./Login.php">
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


    <div id="carouselExampleDark" class="carousel carousel-dark slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>

        </div>
        <div class="carousel-inner">
            <div class="carousel-item carousel-image bg-img-1 active" data-bs-interval="10000">
                <!--<img src="Images/coffee-cup-with-book-eyeglasses.jpg" class="d-block w-100 h-1000" alt="...">-->
                <div class="carousel-caption">
                    <h5 class="animated fadeInDown" style="animation-delay: 1s">ReadGenius</h5>
                    <h4 class="animated fadeInDown d-none d-md-block" style="animation-delay: 2s">"Where Words Transcend
                        Boundaries and Imagination Knows No Limits."</h4>
                </div>
            </div>
            <div class="carousel-item carousel-image bg-img-2" data-bs-interval="2000">
                <!--<img src="Images/portrait-beautiful-young-woman-holding-books-showing-thumb-up_caro2.jpg" class="d-block w-100" alt="...">--> 
                <div class="carousel-caption">
                    <h5 class="animated fadeInDown" style="animation-delay: 1s">Find Your Next Literary Adventure</h5>
                    <h4 class="animated fadeInDown d-none d-md-block" style="animation-delay: 2s">"Dive into the World of
                        ReadGenius, Where Bookish Wonders Await Your Curiosity."</h4>
                </div>
            </div>
            <div class="carousel-item carousel-image bg-img-3">
                <!--<img src="Images/red-rose-inside-open-book.jpg" class="d-block w-100" alt="...">--> 
                <div class="carousel-caption">
                    <h5 class="animated fadeInDown" style="animation-delay: 1s">Unravel the Power of Words</h5>
                    <h4 class="animated fadeInDown d-none d-md-block" style="animation-delay: 2s">"Join ReadGenius, Where Books
                        Hold the Key to Unlocking Your Literary Genius."</h4>
                </div>
            </div>



        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>






    <div class="container marketing p-3">

        <!-- Three columns of text below the carousel -->
        <div class="row mt-4">
            <div class="col-lg-4" style="text-align: center;" >
                <img class="rounded mb-2" src="Home/Images/search.png" alt="Generic placeholder image" width="140" height="140">
                <h3 class="text-center ">Find Your Book Easier</h3>
                <p class="text-center" >Unleash Your Literary Journey with Ease: ReadGenius offers a seamless and 
                    powerful search experience, allowing you to effortlessly explore an extensive collection of 
                    literary wonders. Whether you're seeking a gripping mystery, a heartwarming romance, or an 
                    enlightening non-fiction, our intuitive search tool guides you to your perfect read in seconds.</p>

            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4" style="text-align: center;">
                <img class="rounded mb-2" src="Home/Images/Book2.png" alt="Generic placeholder image" width="160" height="135">
                <h3 class="text-center">Latest Book Releases</h3>
                <p class="text-center"> Embrace our Latest Book Release Feature with ReadGenius, your 
                    gateway to a world of fresh and captivating reads. Stay in the know with instant
                    access to the most exciting titles hitting the shelves. Immerse yourself in a 
                    treasure trove of genres, authors, and stories waiting to be explored.  Find 
                    your next favorite book among the latest releases. </p>

            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4" style="text-align: center;" >
                <img class="rounded mb-2" src="Home/Images/rating.png" alt="Generic placeholder image" width="140" height="140">
                <h3 class="text-center"> Ratings and Reviews</h3>
                <p class="text-center">Unlock the Power of Honest Opinions: Dive into a 
                    World of User-Generated Feedback, where every book comes to life 
                    with authentic experiences. Explore honest ratings and thought-provoking 
                    reviews that guide you to your perfect read. Connect with a vibrant 
                    community of passionate readers, and share your own literary insights. </p>

            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->           

    </div><!-- /.container -->



    <!--main content-->
    <div class="con">  
        <!--Card 1-->
        <div class="container">
            <h3 class="text-center" style="padding-top: 30px;">Book Categories</h3>
            <div class="row" style="margin-top: 50px;">
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card">
                        <img src="Home/Images/edu.jpg" alt="" class="card image-top" height="200px">
                        <div class="card-body">
                            <h5 class="card-title text-center">Education</h5>
                            <p class="text-center">Explore our Education Category for a diverse selection of books catering to students, teachers, and lifelong learners. From textbooks to teaching resources.</p>
                            <div id="btn2" class="text-center"><button>View more</button></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 py-3 py-md-0">
                    <div class="card">
                        <img src="Home/Images/literary.jpg" alt="" class="card image-top" height="200px">
                        <div class="card-body">
                            <h5 class="card-title text-center">Literary Fiction</h5>
                            <p class="text-center"> Our Literary Fiction Category awaits, offering a curated selection of thought-provoking and beautifully crafted narratives. Embark on a journey of literary.</p>
                            <div id="btn2" class="text-center"><button>View more</button></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 py-3 py-md-0">
                    <div class="card">
                        <img src="Home/Images/mystry.jpg" alt="" class="card image-top" height="200px">
                        <div class="card-body">
                            <h5 class="card-title text-center">Mystry</h5>
                            <p class="text-center">Unravel the Enigma of Mystery Books: Step into our Mystery Category, a captivating world of suspense, intrigue, and thrilling plots.</p>
                            <div id="btn2" class="text-center"><button>View more</button></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <div class="container">

            <div class="row" style="margin-top: 50px;">
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card">
                        <img src="Home/Images/romance.jpg" alt="" class="card image-top" height="200px">
                        <div class="card-body">
                            <h5 class="card-title text-center">Romance</h5>
                            <p class="text-center">Embrace the Magic of Romance: Enter our Romance Category, a realm of heartwarming tales and captivating love stories. </p>
                            <div id="btn2" class="text-center"><button>View more</button></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 py-3 py-md-0">
                    <div class="card">
                        <img src="Home/Images/poetry.jpg" alt="" class="card image-top" height="200px">
                        <div class="card-body">
                            <h5 class="card-title text-center">Poetry</h5>
                            <p class="text-center">Discover the Beauty of Poetry: Immerse yourself in our Poetry Category, where words become art and emotions take flight.Enjoy reading and explore poetry. </p>
                            <div id="btn2" class="text-center"><button>View more</button></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 py-3 py-md-0">
                    <div class="card">
                        <img src="Home/Images/fantacy.jpg" alt="" class="card image-top" height="200px">
                        <div class="card-body">
                            <h5 class="card-title text-center">Fantasy</h5>
                            <p class="text-center">Embark on an Epic Adventure: Step into our Fantasy Category, a realm of magic and mythical creatures.Wishing you a fantastical fantasy journey.</p>
                            <div id="btn2" class="text-center"><button>View more</button></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <!--Card 2-->


    </div>  


    <!--about-->
    <div class="conabout">
        <div class="container">
            <h1 class="text-center" style="margin-top: 50px;">ABOUT</h1>
            <div class="row" style="margin-top: 50px;">
                <div class="col-md-6 py-3 py-md-0">
                    <div class="card">
                        <img src="Home/Images/grayscale-shot-books.jpg" alt="">
                    </div>
                </div>
                <div class="col-md-6 py-3 py-md-0">
                    <h5 class="text-center">Welcome to ReadGenious - Your Literary Haven!</h5>

                    <p>At ReadGenious, we celebrate the joy of reading and the power of words. 
                        Our website is designed to be a haven for book enthusiasts, where you
                        can immerse yourself in a world of literary wonders. Whether you're an 
                        avid reader, a curious learner, or a passionate reviewer, our platform 
                        offers something special for everyone.</p>

                    <p>Explore a vast collection of books across genres and authors, from 
                        timeless classics to the latest bestsellers. Unravel the magic of
                        storytelling as you embark on adventures, experience heartwarming romances,
                        and solve gripping mysteries. Our curated book categories ensure that you 
                        find your perfect read, no matter your taste or interest.</p>

                    <p>Share your thoughts and insights with our vibrant community of readers 
                        through honest book reviews and ratings. Engage in meaningful conversations, 
                        exchange recommendations, and connect with like-minded bibliophiles from around the globe.</p>

                </div>
            </div>
        </div>
    </div>>
    <!--about-->

    <!--footer-->
    <div class="container-fluid back" style="background-color:#B2B2B2 ">
        <section class="footer">

            <div class="box-container">

                <div class="box">
                    <h5>Our Site</h5>
                    <a href="#"><i ></i><img src="Home/logo.png" alt="ReadGenius"></a><br><br>
                </div>



                <div class="box">
                    <h5>Quick Links</h5>
                    <a href="#"><i class="fas fa-arrow-right"></i> Home </a><br><br>
                    <a href="#"><i class="fas fa-arrow-right"></i> Book Feed </a><br><br>
                    <a href="#"><i class="fas fa-arrow-right"></i> Review </a><br><br>
                    <a href="#"><i class="fas fa-arrow-right"></i> Wishlist </a><br><br>
                    <a href="#"><i class="fas fa-arrow-right"></i> Category </a><br><br>
                </div>

                <div class="box">
                    <h5>follow us</h5>
                    <a href="#"><i class="fas fa-arrow-right"></i> Instargram </a><br><br>
                    <a href="#"><i class="fas fa-arrow-right"></i> facebook </a><br><br>
                    <a href="#"><i class="fas fa-arrow-right"></i> Linkedin </a><br><br>
                    <a href="#"><i class="fas fa-arrow-right"></i> pinterest </a><br><br>

                </div>

                <div class="box">
                    <h5>Contact info</h5>
                    <a href="#"><i class="fas fa-phone"></i> +94-765-0880 </a><br><br>
                    <a href="#"><i class="fas fa-phone"></i> +91-224-3080 </a><br><br>
                    <a href="#"><i class="fas fa-envelope"></i> readgenius@gmail.com </a><br><br>
                    <img src="Home/Images/O9FG4R0.jpg" style="width:250px; height:200px;" class="map" alt=""><br><br>
                </div>

            </div>

            <div class="center-container">
                <div class="share align-items-center" style="äli">
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                    <a href="#" class="fab fa-pinterest"></a>
                </div> 
            </div>

            <div class="credit">created by <span>mr. ReadGenius</span> | all rights reserved!</div>
        </section>
        <!--footer-->



    </div>
    <!--bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <!--main js-->
    <script src="Home/mainjs.js"></script>
    <script>
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    </script>




    <!--jquery--> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!--separate-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


</body>
</html>
<% }}else{
response.sendRedirect("Login/login.jsp");
}




} catch (Exception e) {
        e.printStackTrace();
        
    }



%>