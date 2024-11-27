<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Time Entry Page</title>
<style>
    /* General page styling */
     body {
          font-family: Arial, sans-serif;
        background-image: url('https://t4.ftcdn.net/jpg/08/22/59/95/360_F_822599549_eEPXVjerp7iAedUaNnUVWEA8PbRIcx3s.jpg'); /* Replace with your image URL */
        background-size: cover;
        background-position: center;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
        padding: 0;
    }
    div {
        width: 400px;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h1 {
        color: #4CAF50;
        text-align: center;
    }
    h2 {
        color: #555;
        text-align: center;
        margin-bottom: 20px;
    }
    
    /* Form styling */
    label {
        display: block;
        margin: 12px 0 4px;
        font-weight: bold;
        color: #333;
    }
    form input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 1em;
    }
    
    /* Button styling */
    .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
        margin-left: -20px;
    }
    button[type="submit"], button[type="reset"] {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1em;
    }
    button[type="submit"] {
        background-color: #4CAF50;
        color: #fff;
    }
    button[type="submit"]:hover {
        background-color: #45a049;
    }
    button[type="reset"] {
        background-color: #e74c3c;
        color: #fff;
    }
    button[type="reset"]:hover {
        background-color: #c0392b;
    }
</style>
</head>
<body>
    <div>
        <h1>Show Time Entry</h1>
        <form:form action="/addShowTime" method="post" modelAttribute="ShowTimeRecord">
            <form:hidden path="showTimeId"/>
            <form:hidden path="showTimeRoyalPrice"/>
            <h2>Enter Show Time Details Below:</h2>
            
            <label>Show Time Name:</label>
            <form:input path="showTimeName" />
            
            <label>Premier Price:</label>
            <form:input path="showTimePremierPrice" />
            
            <div class="button-group">
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </div>
        </form:form>
    </div>
</body>
</html>
