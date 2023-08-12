<%-- 
    Document   : forgot
    Created on : Aug 7, 2023, 5:14:11 AM
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
            <form action="change.jsp" method="POST">
            <h1>Change password</h1>
            <p>Enter your new password below, we're just being extra safe.</p>
            <div class="input">
                <input type="text" placeholder="User Name" required name="username">
               <i class='bx bxs-user'></i>
            </div>
            <div class="input">
                <input type="password" placeholder="New Password" required name="password">
               <i class='bx bx-key'></i>
            </div>
            <div class="input">
                <input type="password" placeholder="Confirm Password" required name="password2">
              <i class='bx bx-key'></i>
            </div>

           
            <button type="submit" class="button" name="action" value="password1">Change Password</button>

            
        </form>
    </div>
    
    </body>
</html>
