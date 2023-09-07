<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
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
	<%
	LocalDate date = LocalDate.now();
	String todayDate = date.toString();
	%>
	<div class="container mt-5">
		<!-- Display Error Message if Present -->
		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		if (errorMessage != null) {
		%>
		<h3><%=errorMessage%></h3>
		<%
		}
		%>
		<h1 class="mb-4">Add a New Book</h1>
		<form action="AddBookServlet" method="post">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="title" name="title" required
					value="<%=request.getParameter("title")%>">
			</div>

			<div class="form-group">
				<label for="author">Author:</label> <input type="text"
					class="form-control" id="author" name="author" required value="<%=request.getParameter("author")%>">
			</div>

			<div class="form-group">
				<label for="publisheddate">Published Date:</label> <input
					type="date" class="form-control" id="publisheddate"
					name="publisheddate" max="<%=todayDate%>" required value="<%=request.getParameter("publisheddate")%>">
			</div>

			<div class="form-group">
				<label for="publishername">Publisher Name:</label> <input
					type="text" class="form-control" id="publishername"
					name="publishername" required value="<%=request.getParameter("publishername")%>">
			</div>

			<div class="form-group">
				<label for="bookimageurl">Book Image URL:</label> <input type="text"
					class="form-control" id="bookimageurl" name="bookimageurl" required value="<%=request.getParameter("bookimageurl")%>">
			</div>

			<div class="form-group">
				<label for="edition">Edition:</label> <input type="number"
					class="form-control" id="edition" name="edition" required min=1
					max=25 value="<%=request.getParameter("edition")%>">
			</div>

			<div class="form-group">
				<label for="categoryname">Category Name:</label> <input type="text"
					class="form-control" id="categoryname" name="categoryname" required value="<%=request.getParameter("categoryname")%>">
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

