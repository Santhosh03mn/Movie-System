<%@ page language="java" contentType="text/html; charset=ISO-8859-4"
    pageEncoding="ISO-8859-4"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-4">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>Select Language</h1>
	<form action="/selectLanguage" method="post">
	<lable for="Language">Choose a Language:</lable>
	<select id="language" name="language" required>
	<option value="English">English</option>
	<option value="Spanish">Spanish</option>
	<option value="French">French</option>
	<option value="Chinese">Chinese</option>
	<option value="Japanese">Japanese</option>
	<option value="Hindhi">Hindhi</option>
	</select>
	
	<button type="submit" class="btn">Submit</button>
	</form>
	</div>
	
</body>
</html>