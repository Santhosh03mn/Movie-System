<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Entry Page</title>
    <style>
       body {
            background-image: url('https://t3.ftcdn.net/jpg/09/34/12/72/360_F_934127274_UN2bD654c5u4aMJMaQBcGFQaD2y9VAFE.jpg'); /* Replace with your dark background image */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            color: #ffffff;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-top: 0;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input[type="text"], .form-group input[list] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
            font-size: 16px;
        }
        th {
            background-color: #007bff;
            color: #ffffff;
        }
        td input {
            width: 100%;
            padding: 8px;
            font-size: 16px;
        }
        .button-group {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .button-group button {
            padding: 10px 20px;
            font-size: 16px;
            margin: 0 10px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button-group button[type="reset"] {
            background-color: #6c757d;
        }
        .button-group button:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Movie Entry Page</h2>
    <form:form id="movieForm" action="/addMovie" method="post" modelAttribute="movieRecord">

        <!-- Movie Details -->
        <div class="form-group">
            <label for="movieId">Enter Movie Id</label>
            <form:input path="movieId" id="movieId"/>
        </div>

        <div class="form-group">
            <label for="movieName">Enter Movie Name</label>
            <form:input path="movieName" id="movieName"/>
        </div>

        <div class="form-group">
            <label for="language">Enter Movie Language</label>
            <form:input path="language" id="language"/>
        </div>

        <div class="form-group">
            <label for="genre">Enter Genre</label>
            <form:input path="genre" id="genre"/>
        </div>

        <div class="form-group">
            <label for="duration">Enter Duration</label>
            <form:input path="duration" id="duration"/>
        </div>

        <div class="form-group">
            <label for="rating">Enter Ratings</label>
            <form:input path="rating" id="rating"/>
        </div>

        <!-- Showtime Details -->
        <h2>Showtime Entry</h2>
        <table>
            <tr>
                <th>Show Time</th>
                <th>Premier Seats</th>
                <th>Royal Seats</th>
            </tr>

            <!-- Loop to create 6 entries -->
            <c:forEach var="index" begin="1" end="6">
                <tr>
                    <!-- Showtime Input -->
                    <td>
                        <input list="shows" name="show${index}" placeholder="Select or enter time"/>
                    </td>

                    <!-- Premier Seats -->
                    <td>
                        <input type="text" name="premier${index}" value="---"/>
                    </td>

                    <!-- Royal Seats -->
                    <td>
                        <input type="text" name="royal${index}" value="---"/>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <!-- Showtimes Datalist (one list for all rows) -->
        <datalist id="shows">
            <c:forEach items="${showTimeList}" var="sid">
                <option value="${sid}"></option>
            </c:forEach>
        </datalist>

        <!-- Submit and Reset Buttons -->
        <div class="button-group">
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </div>

    </form:form>
</div>

</body>
</html>
