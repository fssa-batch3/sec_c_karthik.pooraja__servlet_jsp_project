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
		if(request.getParameter("title") != null){
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
    <label for="categoryname">Category Name:</label>
    <select class="form-control" id="categoryname" name="categoryname" required>
        <option value="" selected disabled>Select a category</option>
        <option value="FICTION" <%= "FICTION".equals(request.getParameter("categoryname")) ? "selected" : "" %>>FICTION</option>
        <option value="NON_FICTION" <%= "NON_FICTION".equals(request.getParameter("categoryname")) ? "selected" : "" %>>NON_FICTION</option>
        <option value="SCIENCE_FICTION" <%= "SCIENCE_FICTION".equals(request.getParameter("categoryname")) ? "selected" : "" %>>SCIENCE_FICTION</option>
        <option value="MYSTERY" <%= "MYSTERY".equals(request.getParameter("categoryname")) ? "selected" : "" %>>MYSTERY</option>
        <option value="ROMANCE" <%= "ROMANCE".equals(request.getParameter("categoryname")) ? "selected" : "" %>>ROMANCE</option>
        <option value="FANTASY" <%= "FANTASY".equals(request.getParameter("categoryname")) ? "selected" : "" %>>FANTASY</option>
        <option value="THRILLER" <%= "THRILLER".equals(request.getParameter("categoryname")) ? "selected" : "" %>>THRILLER</option>
        <option value="HORROR" <%= "HORROR".equals(request.getParameter("categoryname")) ? "selected" : "" %>>HORROR</option>
        <option value="HISTORY" <%= "HISTORY".equals(request.getParameter("categoryname")) ? "selected" : "" %>>HISTORY</option>
        <option value="BIOGRAPHY" <%= "BIOGRAPHY".equals(request.getParameter("categoryname")) ? "selected" : "" %>>BIOGRAPHY</option>
        <option value="SELF_HELP" <%= "SELF_HELP".equals(request.getParameter("categoryname")) ? "selected" : "" %>>SELF_HELP</option>
        <option value="POETRY" <%= "POETRY".equals(request.getParameter("categoryname")) ? "selected" : "" %>>POETRY</option>
        <option value="OTHER" <%= "OTHER".equals(request.getParameter("categoryname")) ? "selected" : "" %>>OTHER</option>
    </select>
</div>
			

			<button type="submit" class="btn btn-primary">Add Book</button>
		</form>
		
		<%}else{ %>
		
		<h1 class="mb-4">Add a New Book</h1>
		<form action="AddBookServlet" method="post">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="title" name="title" required>
			</div>

			<div class="form-group">
				<label for="author">Author:</label> <input type="text"
					class="form-control" id="author" name="author" required >
			</div>

			<div class="form-group">
				<label for="publisheddate">Published Date:</label> <input
					type="date" class="form-control" id="publisheddate"
					name="publisheddate" max="<%=todayDate%>" required >
			</div>

			<div class="form-group">
				<label for="publishername">Publisher Name:</label> <input
					type="text" class="form-control" id="publishername"
					name="publishername" required >
			</div>

			<div class="form-group">
				<label for="bookimageurl">Book Image URL:</label> <input type="text"
					class="form-control" id="bookimageurl" name="bookimageurl" required>
			</div>

			<div class="form-group">
				<label for="edition">Edition:</label> <input type="number"
					class="form-control" id="edition" name="edition" required min=1
					max=25>
			</div>

			<div class="form-group">
    <label for="categoryname">Category Name:</label>
    <select class="form-control" id="categoryname" name="categoryname" required>
        <option value="" selected disabled>Select a category</option>
        <option value="FICTION">FICTION</option>
        <option value="NON_FICTION">NON_FICTION</option>
        <option value="SCIENCE_FICTION">SCIENCE_FICTION</option>
        <option value="MYSTERY">MYSTERY</option>
        <option value="ROMANCE">ROMANCE</option>
        <option value="FANTASY">FANTASY</option>
        <option value="THRILLER">THRILLER</option>
        <option value="HORROR">HORROR</option>
        <option value="HISTORY">HISTORY</option>
        <option value="BIOGRAPHY">BIOGRAPHY</option>
        <option value="SELF_HELP">SELF_HELP</option>
        <option value="POETRY">POETRY</option>
        <option value="OTHER">OTHER</option>
    </select>
</div>
			

			<button type="submit" class="btn btn-primary">Add Book</button>
		</form>
		
		<%} %>
		
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

