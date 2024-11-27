<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Booking</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { width: 50%; margin: auto; background: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1 { text-align: center; color: #e53935; }
        form { display: flex; flex-direction: column; align-items: center; }
        input[type="text"] { padding: 10px; width: 80%; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; }
        button { padding: 10px 20px; background: #e53935; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background: #d32f2f; }
        .message { text-align: center; margin-top: 20px; color: #555; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Cancel Booking</h1>
        <form action="/cancelBooking" method="post">
            <label for="ticketId">Enter Booking ID:</label>
            <input type="text" id="ticketId" name="ticketId" required>
            <button type="submit">Cancel Booking</button>
        </form>
        <div class="message">
            <!-- Display cancellation status (success/failure) if present -->
            <c:if test="${not empty cancellationMessage}">
                <p>${"Cancelled Booking"}</p>
            </c:if>
        </div>
    </div>
</body>
</html>
