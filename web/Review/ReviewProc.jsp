<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="classes.totalReview" %>

<%
    String Review = request.getParameter("Review");
    String rating = request.getParameter("rating");
    String BookId = request.getParameter("BookId");
    String ReaderId = request.getParameter("ReaderId");
totalReview.AddReview(BookId, ReaderId, Review, rating);
response.sendRedirect("Review.jsp");
   
%>
