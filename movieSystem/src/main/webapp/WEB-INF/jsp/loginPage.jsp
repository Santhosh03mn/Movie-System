<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
 <!-- Add CSS for styling -->
<style>
      /* General Reset */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
      }

      /* Full-screen background with gradient */
      body {
       background-image: url("https://wallpaperaccess.com/full/4680598.jpg");
        background-size: cover; /* Ensures the image covers the entire screen */
        background-position: center; /* Centers the image */
        background-repeat: no-repeat; /* Prevents repeating */
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      /* Centered login container with modern look */
      .login-container {
        background: rgba(255, 255, 255, 0.15);
        padding: 50px;
        border-radius: 15px;
        backdrop-filter: blur(10px);
        box-shadow: 0 15px 25px rgba(0, 0, 0, 0.1);
        text-align: center;
        width: 360px;
        animation: fadeIn 1s ease-out forwards;
         margin-left: -760px;
        margin-top: -70px;
      }

      /* Animation for container fade in */
      @keyframes fadeIn {
        0% {
          opacity: 0;
          transform: translateY(30px);
        }
        100% {
          opacity: 1;
          transform: translateY(0);
        }
      }

      /* Header styling */
      h3 {
        margin-bottom: 20px;
        font-size: 28px;
        color: #fff;
        letter-spacing: 1px;
        font-weight: 600;
      }

      /* Input fields styling */
      .login-container input[type="text"],
      .login-container input[type="password"] {
        width: 100%;
        padding: 12px 20px;
        margin: 10px 0;
        border: none;
        border-radius: 30px;
        background-color: rgba(255, 255, 255, 0.3);
        color: #fff;
        font-size: 16px;
        outline: none;
        transition: 0.3s ease;
      }

      /* Add focus effect to input fields */
      .login-container input[type="text"]:focus,
      .login-container input[type="password"]:focus {
        background-color: rgba(255, 255, 255, 0.5);
        transform: scale(1.02);
      }

      /* Modern, gradient button */
      .login-container input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: linear-gradient(45deg, #ef32d9, #89fffd);
        color: white;
        border: none;
        border-radius: 30px;
        font-size: 18px;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease;
        font-weight: 600;
      }

      /* Button hover effects */
      .login-container input[type="submit"]:hover {
        background: linear-gradient(45deg, #89fffd, #ef32d9);
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      }

      /* Register link styles */
      .login-container a {
        display: block;
        margin-top: 15px;
        font-size: 14px;
        color: #fff;
        text-decoration: none;
        transition: color 0.3s ease;
      }

      /* Link hover effect */
      .login-container a:hover {
        color: #ef32d9;
      }

      /* Glow effect for inputs and container */
      .login-container:hover {
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
      }

      .login-container input:hover {
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
      }

      /* Subtle pulse animation for the whole form */
      @keyframes pulse {
        0% {
          transform: scale(1);
        }
        50% {
          transform: scale(1.01);
        }
        100% {
          transform: scale(1);
        }
      }

      /* Apply pulse animation to the form container */
      .login-container {
        animation: pulse 3s infinite;
      }
       /* Register link styles */
      h2 a {
        text-decoration: none;
        color: blue;
        font-size: 12px;
        animation: colorChange 2s infinite;
      }
       @keyframes colorChange {
        0% {
          color: white;
        }
        100% {
          color: blue;
        }
      }

      h2 a:hover {
        color: #e64a19;
      }
    </style>
</head>
<body>

<div class="login-container">
    <h3>Login</h3>
    <form action="/login" method="post">
        <input type="text" name="username" placeholder="Enter User Id" required/><br/>
        <input type="password" name="password" placeholder="Enter Password" required/><br/>
        <input type="submit" value="Submit"/>
    </form>
    <div class="register-link">
        <h2><a href="/register">Register for New User</a></h2>
    </div>
</div>

</body>
</html>
