<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="classes.totalReview" %>

<%
    String Review = request.getParameter("Review");
    String rating = request.getParameter("rating");
    String BookId = request.getParameter("BookId");
    String ReaderId = request.getParameter("ReaderId");
    String AuthorId = request.getParameter("AuthorId");
    totalReview.AddReview(BookId, ReaderId, Review, rating);


%>


<form action="../Review/Review.jsp" id="myForm" method="post">
    <input type="hidden" name="BookId" value='<%=BookId %>'>  
    <input type="hidden" name="AuthorId" value='<%=ReaderId %>'>
    <input type="hidden" name="ReaderId" value='<%=AuthorId %>'>
  
</form>

<script>
    // Automatically submit the form when the page loads
    window.onload = function() {
        document.getElementById("myForm").submit();
    };
</script>