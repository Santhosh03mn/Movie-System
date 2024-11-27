<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

 <style>
        /* Full-screen gradient background */
        body {
            background-image: url("https://i.pinimg.com/originals/54/6c/a8/546ca87919608aa7032aa378be456d08.jpg");
            background-size: cover;
            background-position: center;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
            color: white;
        }

        /* Registration form container */
        .registration-container {
            background-color: rgba(255, 255, 255, 0.1); /* Semi-transparent white background */
            backdrop-filter: blur(10px); /* Frosted glass effect */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            width: 350px;
            animation: fadeIn 1s ease-out forwards;
            text-align: center;
        }

        /* Fade-in effect */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Heading style */
        h2 {
            margin-bottom: 20px;
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }

        /* Form input fields */
        .form-control {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: none;
            border-radius: 30px;
            outline: none;
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
            font-size: 1rem;
            text-align: center;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }

        /* Submit button styles */
        .btn-primary {
            background-color: #f39c12; /* Vibrant yellow-orange */
            color: #fff;
            border: none;
            padding: 15px;
            width: 100%;
            border-radius: 30px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            margin-top: 20px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-primary:hover {
            background-color: #e67e22;
            transform: scale(1.05);
        }

        /* Button for switching to login */
        .btn-secondary {
            background-color: transparent;
            color: #fff;
            border: 2px solid #fff;
            padding: 15px;
            width: 100%;
            border-radius: 30px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: #f39c12;
        }

        /* Responsive layout */
        @media (max-width: 768px) {
            .registration-container {
                width: 90%;
            }
        }

        /* Subtle hover effect on the container */
        .registration-container:hover {
            box-shadow: 0 10px 30px rgba(255, 255, 255, 0.2);
        }
    </style>

    <script type="text/javascript">
        function passwordCheck() {
            var pass1 = (document.getElementById("pass1").value).toString();
            var pass2 = (document.getElementById("pass2").value).toString();
			if(pass1.length<5 || pass1.length>10){
				alert("Password length must ne between 5 to 10 characters");
				return;
			}
            
            if (pass1 === pass2) {
                document.getElementById("registrationForm").submit();
            } else {
                alert("Passwords do not match!");
            }
        }
    </script>
</head>
<body>

<div class="registration-container">
    <h2 style="color:white">Register New User</h2>
    <form:form id="registrationForm" action="/register" method="post" modelAttribute="userRecord" class="mt-4">

        <div class="mb-3">
            <label for="username" class="form-label">Enter New User Id</label>
            <form:input path="username" id="username" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="pass1" class="form-label">Enter New Password</label>
            <form:input type="password" id="pass1" path="password" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="pass2" class="form-label">Re-type New Password</label>
            <input type="password" id="pass2" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="name" class="form-label">Enter User's Full Name</label>
            <form:input path="name" id="name" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Enter Email</label>
            <form:input path="email" id="email" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="role" class="form-label">Select User Role</label>
            <form:input list="types" name="type" id="type" path="role" class="form-control" />
            <datalist id="types">
                <option value="Customer"></option>
                <option value="Admin"></option>
            </datalist>
        </div>

        <div class="d-grid gap-2">
            <button type="button" class="btn btn-primary" onclick="passwordCheck();">Submit</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </div>

    </form:form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>