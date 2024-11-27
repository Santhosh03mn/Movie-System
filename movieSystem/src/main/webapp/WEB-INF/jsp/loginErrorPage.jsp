<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login Error</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(to right, #ff5722, #ff7043);
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }

    .error-container {
        background: rgba(0, 0, 0, 0.7);
        padding: 40px 60px;
        border-radius: 10px;
        width: 100%;
        max-width: 500px;
        text-align: center;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
    }

    h1 {
        margin-bottom: 20px;
        color: #ffcc00;
        font-size: 2.5em;
        text-shadow: 2px 2px 5px #333;
    }

    .message {
        font-size: 1.2em;
        color: #ffcc00;
        margin-bottom: 20px;
    }

    .retry-link {
        font-size: 1.1em;
        color: #ff5722;
        text-decoration: none;
        font-weight: bold;
    }

    .retry-link:hover {
        color: #ffcc00;
    }
</style>
</head>
<body>

<div class="error-container">
    <h1>Oops! Wrong Credentials...</h1>
    <p class="message">Please check your username and password and try again.</p>
    <a href="/login" class="retry-link">Re-enter Credentials</a>
</div>

<jsp:include page="loginPage.jsp" flush="true"/>

</body>
</html>
