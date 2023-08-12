<%-- 
    Document   : login
    Created on : Aug 7, 2023, 4:45:46 AM
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
            <form action="check.jsp" method="POST">
                <h1>Sign Up</h1>
                <div class="input">
                    <input name="userName" type="text" placeholder="User Name"  required>
                    <i class='bx bxs-user'></i>
                </div>
                <div class="input">
                    <input name="Password" type="password" placeholder="Password" required>
                    <i class='bx bx-key'></i>
                </div>

                <div class="forgot">
                    <label >
                        <input type="checkbox">Remember me
                    </label>
                    <a href="forgot.jsp">forgot password?</a>
                </div>
                <button type="submit" class="button" >sign up</button>

                <div class="register">
                    <p>Don't have an account?</p>
                    <a href="signin.jsp">register</a>
                </div>
            </form>
        </div>
    </body>
</html>
