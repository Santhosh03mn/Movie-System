<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Details and Showtime Update</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        /* Container */
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Header Styling */
        h2, h3 {
            color: #007bff;
            text-align: center;
        }

        /* Movie Details Section */
        .details {
            margin-bottom: 20px;
        }
        .details p {
            margin: 10px 0;
            font-size: 16px;
            line-height: 1.5;
        }
        .details strong {
            color: #555;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        input[type="text"] {
            width: 90%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        /* Buttons */
        .buttons {
            text-align: center;
            margin-top: 20px;
        }
        .buttons button {
            padding: 10px 20px;
            margin: 5px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .buttons button:hover {
            background-color: #0056b3;
        }
        .buttons button:reset {
            background-color: #6c757d;
        }

        /* Responsive Styling */
        @media (max-width: 600px) {
            table, th, td {
                font-size: 14px;
            }
            input[type="text"] {
                font-size: 12px;
            }
            .buttons button {
                font-size: 14px;
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Movie Details</h2>
    <div class="details">
        <p><strong>Movie ID:</strong> ${movie.movieId}</p>
        <p><strong>Movie Name:</strong> ${movie.movieName}</p>
        <p><strong>Language:</strong> ${movie.language}</p>
        <p><strong>Genre:</strong> ${movie.genre}</p>
        <p><strong>Duration:</strong> ${movie.duration} minutes</p>
        <p><strong>Rating:</strong> ${movie.rating} / 10</p>
    </div>

    <h3>Showtime Update</h3>
    <form action="/updateMovieShow" method="post">
        <input type="hidden" name="movieId" value="${movie.movieId}" />

        <table>
            <thead>
                <tr>
                    <th>Show Time ID</th>
                    <th>Premier Seat Number</th>
                    <th>Royal Seat Number</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="i" begin="1" end="6">
                    <tr>
                        <td><input type="text" name="showTimeId${i}" placeholder="Show Time ID" /></td>
                        <td><input type="text" name="premierSeat${i}" placeholder="Premier Seat" /></td>
                        <td><input type="text" name="royalSeat${i}" placeholder="Royal Seat" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="buttons">
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </div>
    </form>
</div>

</body>
</html>
