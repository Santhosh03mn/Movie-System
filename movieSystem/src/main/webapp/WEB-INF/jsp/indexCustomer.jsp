<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Movie Booking System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-image: url("https://cosmosujjain.in/images/enter/pvr-banner.jpg"); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            margin: 0;
            padding: 20px;
            

		    background-attachment: fixed;

        }

        h1 {
            font-family: "Monotype Corsiva", cursive;
            text-align: center;
            margin-top: 50px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
        }

        .navbar {
            display: flex; /* Use flexbox for even spacing */
            justify-content: space-between; /* Space elements evenly */
            align-items: center; /* Center items vertically */
            background-color: rgba(51, 51, 51, 0.8);
            border-radius: 5px;
            padding: 10px 20px; /* Adjust padding for better spacing */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        .navbar a, .dropdown .dropbtn {
            font-size: 18px; /* Increase font size for better readability */
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            border: none; /* Remove border */
            background: none; /* Remove background */
            cursor: pointer; /* Show pointer cursor */
            transition: background-color 0.3s, transform 0.3s; /* Added transform for scaling */
        }

        .navbar a:hover, .dropdown .dropbtn:hover {
            background-color: red;
            transform: scale(1.05); /* Scale effect on hover */
        }

        .dropdown {
            position: relative; /* Needed for absolute positioning of dropdown */
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            opacity: 0; /* Start hidden */
            transition: opacity 0.3s ease; /* Smooth fade effect */
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
            transition: background-color 0.3s; /* Smooth background color transition */
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
            opacity: 1; /* Fade in */
        }

        /* Additional styling for responsiveness */
        @media screen and (max-width: 600px) {
            .navbar a, .dropdown .dropbtn {
                font-size: 16px; /* Slightly smaller on small screens */
                padding: 10px;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div align="center">
        <h1>Welcome To Online Movie Booking System</h1>
        <div class="navbar">
            <div class="dropdown">
                <button class="dropbtn">Movie Management</button>
                <div class="dropdown-content">
                    <a href="/movieReport">Movie List</a>
                </div>
            </div>


            <div class="dropdown">
                <button class="dropbtn">Booking Management</button>
                <div class="dropdown-content">
                    <a href="/movieReportLanguage">New Booking</a>
                    <a href="/cancelBooking">Cancellation</a>
                </div>
            </div>
            
            <a href="/logout">Logout</a>
        </div>
    </div>
</body>
</html>
