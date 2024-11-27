<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    // Assuming "movie" and "showTime" objects are passed to this page as request attributes
    com.infosys.movieSystem.bean.Movie movie = (com.infosys.movieSystem.bean.Movie) request.getAttribute("movie");
    com.infosys.movieSystem.bean.ShowTime showTime = (com.infosys.movieSystem.bean.ShowTime) request.getAttribute("showTime");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { width: 50%; margin: auto; background: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1 { text-align: center; color: #4CAF50; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Booking Confirmation</h1>
        <p>Thank you for your booking! Below are your details:</p>
        <table>
            <tr>
                <th>Movie Title:</th>
                <td>${movie.title}</td>
            </tr>
            <tr>
                <th>Language:</th>
                <td>${movie.language}</td>
            </tr>
            <tr>
                <th>Genre:</th>
                <td>${movie.genre}</td>
            </tr>
            <tr>
                <th>Show Time:</th>
                <td>${showTime.showTimeName}</td>
            </tr>
            <tr>
                <th>Date:</th>
                <td>${showTime.showDate}</td>
            </tr>
        </table>
        <p style="text-align: center;">
            <a href="movieBookingConfirmationPage" style="text-decoration: none; padding: 10px 20px; background: #4CAF50; color: white; border-radius: 5px;">Back to Home</a>
        </p>
    </div>
</body>
</html>
