<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Booking Details</title>
    <style>
        /* General Body Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 0;
        }

        /* Container Styling */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        /* Header Styling */
        h1 {
            text-align: center;
            color: #4CAF50;
            font-size: 2em;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        table td, table th {
            padding: 12px 15px;
            text-align: left;
            font-size: 1.1em;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table th {
            background-color: #4CAF50;
            color: #fff;
            font-weight: bold;
        }

        /* Form Styling */
        .form-group {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .form-group label {
            font-weight: bold;
            color: #333;
            font-size: 1.1em;
            margin-bottom: 10px;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            font-size: 1em;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
            transition: all 0.3s ease;
        }

        .form-group input[type="text"]:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
        }

        /* Button Styling */
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .button-group button {
            padding: 12px 25px;
            font-size: 1.1em;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 48%;
            transition: all 0.3s ease;
        }

        .button-group .submit-btn {
            background-color: #4CAF50;
        }

        .button-group .reset-btn {
            background-color: #f44336;
        }

        .button-group button:hover {
            transform: translateY(-2px);
        }

        .button-group .submit-btn:hover {
            background-color: #45a049;
        }

        .button-group .reset-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>

<!-- Main Container -->
<div class="container">
    <h1>Ticket Booking Details</h1>

    <!-- Table to Display Ticket Details -->
    <table>
        <tr>
            <td><b>Movie Name:</b></td>
            <td>${movieName}</td>
        </tr>
        <tr>
            <td><b>Show Time:</b></td>
            <td>${showTimeName}</td>
        </tr>
        <tr>
            <td><b>Seat Type:</b></td>
            <td>${seatType}</td>
        </tr>
        <tr>
            <td><b>Number of Seats Booked:</b></td>
            <td>${numberOfSeats}</td>
        </tr>
        <tr>
            <td><b>Total Amount Payable:</b></td>
            <td>₹ ${totalAmount}</td>
        </tr>
    </table>

    <!-- Form to Accept Transaction ID -->
    <form method="post" action="/ticketPay/${movieId}">
        <div class="form-group">
            <label for="transactionId"><b>Enter Transaction Id:</b></label>
            <input type="text" name="transactionId" id="transactionId" required />
        </div>

        <!-- Button Group -->
        <div class="button-group">
            <button type="submit" class="submit-btn">Create Ticket</button>
            <button type="reset" class="reset-btn">Clear</button>
        </div>
    </form>
</div>

</body>
</html>
