<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h1 class="mb-4">Add a New Book</h1>
		<form action="AddBookServlet" method="post">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="title" name="title" required>
			</div>

			<div class="form-group">
				<label for="author">Author:</label> <input type="text"
					class="form-control" id="author" name="author" required>
			</div>

			<div class="form-group">
				<label for="publisheddate">Published Date:</label> <input
					type="date" class="form-control" id="publisheddate"
					name="publisheddate" required>
			</div>

			<div class="form-group">
				<label for="publishername">Publisher Name:</label> <input
					type="text" class="form-control" id="publishername"
					name="publishername" required>
			</div>

			<div class="form-group">
				<label for="bookimageurl">Book Image URL:</label> <input type="text"
					class="form-control" id="bookimageurl" name="bookimageurl" required>
			</div>

			<div class="form-group">
				<label for="edition">Edition:</label> <input type="number"
					class="form-control" id="edition" name="edition" required min=1 max=25>
			</div>

			<div class="form-group">
				<label for="categoryname">Category Name:</label> <input type="text"
					class="form-control" id="categoryname" name="categoryname" required>
			</div>

			<button type="submit" class="btn btn-primary">Add Book</button>
		</form>
	</div>

	<!-- Include Bootstrap JS and jQuery (optional) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

