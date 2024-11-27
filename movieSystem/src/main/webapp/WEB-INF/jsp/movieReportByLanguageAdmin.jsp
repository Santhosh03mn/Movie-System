<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Report by Language</title>
    <style>
        /* Page Styling */
        body {
             background-image: url('https://wallpapers.com/images/hd/home-cinema-1680-x-1050-wallpaper-2zjl66feuo5sezhx.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            color: #ffffff;
        }
        h2 {
            text-align: center;
            color: #007bff;
        }
        form {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            margin-right: 10px;
        }
        select, button {
            padding: 8px 12px;
            font-size: 16px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            border: none;
        }
        button:hover {
            background-color: #0056b3;
        }
        /* Table Styling */
        table {
            width: 90%;
            margin: 0 auto 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 5px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .showtime-details {
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        .no-movies {
            text-align: center;
            font-size: 18px;
            color: #999;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h2>Movie Report by Language</h2>

<!-- Search Form to Select Language -->
<form action="${pageContext.request.contextPath}/movieReportLanguage" method="post">
    <label for="language">Select Language:</label>
    <select name="language" id="language" required>
        <c:forEach var="lang" items="${languageSet}">
            <option value="${lang}" <c:if test="${lang == selectedLanguage}">selected</c:if>>${lang}</option>
        </c:forEach>
    </select>
    <button type="submit">Search</button>
</form>

<!-- Display Movie Report Table -->
<c:if test="${not empty movieList}">
    <h3 style="text-align:center; color: #333;">Movies in Language: <span style="color:#007bff;">${selectedLanguage}</span></h3>
   <table>
    <thead>
        <tr>
            <th>Movie ID</th>
            <th>Movie Name</th>
            <th>Rating</th>
            <th>Language</th>
            <th>Duration</th>
            <th>Show Times</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="movie" items="${movieList}">
           	<tr style="color : black;">
                <td>${movie.movieId}</td>
                <td>${movie.movieName}</td>
                <td>${movie.rating}</td>
                <td>${movie.language}</td>
                <td>${movie.duration} mins</td>
                <td>
                    <!-- Show time details for each movie -->
                    <c:forEach var="show" items="${movieMap[movie.movieId]}">
                        <div class="showtime-details">
                            <strong>Show Time:</strong> ${show.showTimeName}<br>
                            <strong>Royal Seats:</strong> ${show.royalSeat}<br>
                            <strong>Premier Seats:</strong> ${show.premierSeat}<br>
                            <hr style="border-top: 1px solid #ddd;">
                        </div>
                    </c:forEach>
        </c:forEach>
    </tbody>
</table>
   
</c:if>

<c:if test="${empty movieList}">
    <p class="no-movies">No movies found for the selected language.</p>
</c:if>

</body>
</html>
