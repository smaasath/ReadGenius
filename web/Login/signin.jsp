<%-- 
    Document   : signin
    Created on : Aug 8, 2023, 12:01:07 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class="container">
            <form action="../tset" method="post" enctype="multipart/form-data">
                <h1>Sign In</h1>

                
                <div class="input">
                    <input name="name" type="text" placeholder="Name"  required>
                    <i class='bx bxs-user'></i>
                </div>
                <div class="input">
                    <input name="username" type="text" placeholder="User Name"  required>
                    <i class='bx bxs-user'></i>
                </div>
                <div class="input">
                    <input type="file" accept="image/jpeg"  name="image" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
                </div>
                <div class="input">
                    <input name="password" type="password" placeholder="Password" required>
                    <i class='bx bx-key'></i>
                </div>

                <div class="input">
                    <input type="email" placeholder="Eamil" required name="email">
                    <i class='bx bxs-envelope' ></i>
                </div>
                 



                <button type="submit" class="button">save</button>

            </form>
        </div>
    </body>
</html>
