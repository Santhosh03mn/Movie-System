<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Time Report</title>
<style>
    /* General page styling */
 body {
        font-family: Arial, sans-serif;
        background-image: url('https://img.freepik.com/premium-photo/concept-watching-movies-online-home-vr-headset-surrounded-by-movie-equipment-movie-tickets-film-reels-movie-cameras-popcorn-drinks-isolated-background-3d-rendering_1226542-1848.jpg'); /* Replace with your image URL */
        background-size: cover;
        background-position: center;
        justify-content: center;
        align-items: center;
         display: flex;
        margin: 0;
        padding: 0;
    }
        div {
        width: 800px;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        border-radius: 8px;
    }
    h1 {
        text-align: center;
        color: #4CAF50;
        margin-bottom: 10px;
    }
    h2 {
        text-align: center;
        color: #555;
        font-weight: 400;
        margin-bottom: 20px;
    }
    h3 {
        text-align: center;
        margin-top: 20px;
    }
    a {
        color: #4CAF50;
        text-decoration: none;
        font-weight: bold;
    }
    a:hover {
        text-decoration: underline;
    }

    /* Table styling */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #4CAF50;
        color: white;
        text-transform: uppercase;
    }
    tr:hover {
        background-color: #f1f1f1;
    }

    /* Button-like links for Delete and Update */
    .action-link {
        color: #fff;
        padding: 8px 12px;
        border-radius: 4px;
        font-size: 0.9em;
    }
    .delete {
        background-color: #e74c3c;
    }
    .delete:hover {
        background-color: #c0392b;
    }
    .update {
        background-color: #3498db;
    }
    .update:hover {
        background-color: #2980b9;
    }
</style>
</head>
<body>

<div>
    <h1>Show Time Report</h1>
    <h2>List of All Show Times</h2>
    
    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Royal Price</th>
            <th>Premier Price</th>
            <th>ShowTime Deletion</th>
            <th>ShowTime Updation</th>
        </tr>
        
        <c:forEach items="${showTimeList}" var="showtime">
            <tr>
                <td>${showtime.showTimeId}</td>
                <td>${showtime.showTimeName}</td>
                <td>${showtime.showTimeRoyalPrice}</td>
                <td>${showtime.showTimePremierPrice}</td>
                <td><a href="/showTimeDeletion/${showtime.showTimeId}" class="action-link delete">Delete</a></td>
                <td><a href="/showTimeUpdation/${showtime.showTimeId}" class="action-link update">Update</a></td>
            </tr>
        </c:forEach>
        
    </table>
    <h3><a href="/index">Return</a></h3>
</div>

</body>
</html>
