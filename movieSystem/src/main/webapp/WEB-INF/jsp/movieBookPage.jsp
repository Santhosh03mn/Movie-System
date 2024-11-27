<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Details</title>
    <style>
      
        h1, h2 {
            text-align: center;
            color: #333;
        }
        h1 {
            margin-bottom: 10px;
            font-size: 2.5em;
        }
        h2 {
            margin-top: 20px;
            font-size: 1.8em;
            color: #4CAF50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 0.9em;
        }
        th {
            background-color: #f4f4f4;
            font-weight: bold;
            text-transform: uppercase;
        }
        td {
            background-color: #fafafa;
        }
        td:nth-child(even) {
            background-color: #f7f9fc;
        }
        button {
            padding: 10px 20px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background: #45a049;
        }
        .form-group {
            margin: 20px 0;
        }
        .form-label {
            font-weight: bold;
            font-size: 1em;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }
        .form-control {
            padding: 8px 10px;
            width: 100%;
            font-size: 0.9em;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: inset 0 1px 5px rgba(76, 175, 80, 0.5);
        }
        .form-container {
            margin: 30px 0;
            text-align: left;
        }
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
        .button-group button {
            margin: 0 10px;
        }
        .radio-label {
            display: inline-block;
            margin-right: 15px;
            font-size: 1em;
        }
        .highlight {
            color: #4CAF50;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><u>Movie Details</u></h1>
    <div class="form-container">
        <form action="/bookMovie/${movie.movieId}" method="post">
            <table>
                <tr>
                    <td class="highlight">The Movie Id:</td>
                    <td>${movie.movieId}</td>
                </tr>
                <tr>
                    <td class="highlight">Movie Name:</td>
                    <td>${movie.movieName}</td>
                </tr>
                <tr>
                    <td class="highlight">Movie Language:</td>
                    <td>${movie.language}</td>
                </tr>
                <tr>
                    <td class="highlight">Movie Genre:</td>
                    <td>${movie.genre}</td>
                </tr>
                <tr>
                    <td class="highlight">Movie Duration:</td>
                    <td>${movie.duration} minutes</td>
                </tr>
                <tr>
                    <td class="highlight">Movie Rating:</td>
                    <td>${movie.rating} / 10</td>
                </tr>
            </table>
    </div>
</div>

<div class="container">
    <h2><u>ShowTimes</u></h2>
    <table>
        <tr>
            <th>Show Time Name</th>
            <th>Royal Seat Number</th>
            <th>Premier Seat Number</th>
            <th>Royal Seat Available</th>
            <th>Premier Seat Available</th>
            <th>Select</th>
        </tr>
        <c:forEach items="${movieShowDTOList}" var="movieShowDTO">
            <tr>
                <td>${movieShowDTO.showTimeName}</td>
                <td>${movieShowDTO.royalSeat}</td>
                <td>${movieShowDTO.premierSeat}</td>
                <c:set var="availableSeats" scope="session" value="${movieShowDTO.royalSeat-movieShowDTO.royalBooked}"/>  
                <td>${availableSeats}</td>
                <c:set var="availableSeats" scope="session" value="${movieShowDTO.premierSeat-movieShowDTO.premierBooked}"/>  
                <td>${availableSeats}</td>
                <td><input type="radio" name="selection" value="${movieShowDTO.showTimeName}" required/></td>
            </tr>
        </c:forEach>
    </table>
</div>

<div class="container">
    <!-- Seat Type Selection -->
    <div class="form-group">
        <label class="form-label">Select Seat Type:</label>
        <select name="seatType" class="form-control" required>
            <option value="Royal">Royal</option>
            <option value="Premier">Premier</option>
        </select>
    </div>

    <!-- Number of Seats -->
    <div class="form-group">
        <label class="form-label">Number of Seats:</label>
        <select name="numberOfSeats" class="form-control" required>
            <c:forEach var="i" begin="1" end="6">
                <option value="${i}">${i}</option>
            </c:forEach>
        </select>
    </div>

    <!-- Payment Mode -->
    <div class="form-group">
        <label class="form-label">Payment Mode:</label>
        <select name="paymentMode" class="form-control" required>
            <option value="NetBanking">Net Banking</option>
            <option value="DebitCreditCard">Debit/Credit Card</option>
            <option value="UPI">UPI</option>
        </select>
    </div>
</div>

<!-- Book Ticket Button -->
<div class="button-group">
    <button type="submit">Book Ticket</button>
    <button type="reset">Reset</button>
</div>
</form>
</body>
</html>
