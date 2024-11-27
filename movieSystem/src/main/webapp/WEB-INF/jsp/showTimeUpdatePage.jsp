<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Show Time</title>
<style>
    /* General page styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    div {
        max-width: 600px;
        width: 100%;
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
    form {
        display: flex;
        flex-direction: column;
    }
    label {
        margin: 10px 0 5px;
        font-weight: bold;
    }
    input[type="text"], input[type="number"] {
        padding: 8px;
        font-size: 1em;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    button {
        margin-top: 20px;
        padding: 10px;
        font-size: 1em;
        color: #fff;
        background-color: #4CAF50;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    button:hover {
        background-color: #45a049;
    }
    a {
        text-align: center;
        display: block;
        margin-top: 20px;
        color: #4CAF50;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<h1>Update ShowTime</h1>
    <form action="/showTimeUpdation" method="post">
       
        <!-- Display showTimeName (read-only) -->
       <div>
            <label>ShowTime ID:</label>
            <input type="text" value="${ShowTimeRecord.showTimeId}" readonly>
            <input type="hidden" name="showTimeId" value="${ShowTimeRecord.showTimeId}">
        </div>
       
        <div>
            <label>ShowTime Name:</label>
            <input type="text" value="${ShowTimeRecord.showTimeName}" readonly>
        </div>
        <div>
            <label>Royal Price:</label>
            <input type="text" value="${ShowTimeRecord.showTimeRoyalPrice}" readonly>
        </div>

        <!-- Input field for Premier Price -->
        <div>
            <label for="premierPrice">Premier Price:</label>
            <input type="number" step="0.01" name="showTimePremierPrice" value="${ShowTimeRecord.showTimePremierPrice}" required>
        </div>

        <!-- Submit button -->
        <button type="submit">Update Show Time</button>
    </form>
    
    <div>
        <a href="/showTimeReport">Back to Show Time Report</a>
    </div>

</body>
</html>
