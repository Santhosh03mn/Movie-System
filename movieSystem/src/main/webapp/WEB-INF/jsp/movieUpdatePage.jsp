<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Update Page</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 400px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form-group input[readonly] {
            background-color: #e9ecef;
            color: #495057;
        }

        .buttons {
            margin-top: 20px;
            display: flex;
            justify-content: space-around;
        }

        .buttons input[type="submit"],
        .buttons input[type="reset"] {
            padding: 8px 16px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .buttons input[type="reset"] {
            background-color: #6c757d;
        }

        .buttons input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .buttons input[type="reset"]:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Movie Update Page</h2>
    <form action="/movieUpdate" method="post">
        <div class="form-group">
            <label for="movieId">The Movie Id:</label>
            <input type="text" id="movieId" name="movieId" value="${movie.movieId}" readonly>
        </div>

        <div class="form-group">
            <label for="movieName">Movie Name:</label>
            <input type="text" id="movieName" name="movieName" value="${movie.movieName}" readonly>
        </div>

        <div class="form-group">
            <label for="language">Movie Language:</label>
            <input type="text" id="language" name="language" value="${movie.language}" readonly>
        </div>

        <div class="form-group">
            <label for="genre">Movie Genre:</label>
            <input type="text" id="genre" name="genre" value="${movie.genre}" readonly>
        </div>

        <div class="form-group">
            <label for="duration">Update Duration:</label>
            <input type="text" id="duration" name="duration" value="${movie.duration}" readonly>
        </div>

        <div class="form-group">
            <label for="rating">Update Ratings:</label>
            <input type="number" id="rating" name="rating" step="0.01" min="0" max="10" value="${movie.rating}">
        </div>

        <div class="buttons">
            <input type="submit" value="Submit">
            <input type="reset" value="Reset">
        </div>
    </form>
</div>

</body>
</html>
