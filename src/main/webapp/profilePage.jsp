<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.fssa.books.model.User"%>
	<%@ page import="com.fssa.books.service.UserService"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
/* Import Google font - Poppins */
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 20px;
	background: rgb(130, 106, 251);
}

.container {
	position: relative;
	max-width: 700px;
	width: 100%;
	background: #fff;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.container header {
	font-size: 1.5rem;
	color: #333;
	font-weight: 500;
	text-align: center;
}

.container .form {
	margin-top: 30px;
}

.form .input-box {
	width: 100%;
	margin-top: 20px;
}

.input-box label {
	color: #333;
}

.form :where(.input-box input, .select-box) {
	position: relative;
	height: 50px;
	width: 100%;
	outline: none;
	font-size: 1rem;
	color: #707070;
	margin-top: 8px;
	border: 1px solid #ddd;
	border-radius: 6px;
	padding: 0 15px;
}

.input-box input:focus {
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}

.form .column {
	display: flex;
	column-gap: 15px;
}

.form .gender-box {
	margin-top: 20px;
}

.gender-box h3 {
	color: #333;
	font-size: 1rem;
	font-weight: 400;
	margin-bottom: 8px;
}

.form :where(.gender-option, .gender) {
	display: flex;
	align-items: center;
	column-gap: 50px;
	flex-wrap: wrap;
}

.form .gender {
	column-gap: 5px;
}

.gender input {
	accent-color: rgb(130, 106, 251);
}

.form :where(.gender input, .gender label) {
	cursor: pointer;
}

.gender label {
	color: #707070;
}

.address :where(input, .select-box) {
	margin-top: 15px;
}

.select-box select {
	height: 100%;
	width: 100%;
	outline: none;
	border: none;
	color: #707070;
	font-size: 1rem;
}

.form button {
	height: 55px;
	width: 100%;
	color: #fff;
	font-size: 1rem;
	font-weight: 400;
	margin-top: 30px;
	border: none;
	cursor: pointer;
	transition: all 0.2s ease;
	background: rgb(130, 106, 251);
}

.form button:hover {
	background: rgb(88, 56, 250);
}
/*Responsive*/
@media screen and (max-width: 500px) {
	.form .column {
		flex-wrap: wrap;
	}
	.form :where(.gender-option, .gender) {
		row-gap: 15px;
	}
}
</style>
</head>
<body>
	<section class="container">
		<header>Profile details</header>
		<form action="/DeleteUserServlet" class="form">
		  <%User user=(User) request.getAttribute("User");%>
			<div class="input-box">
				<label>Name</label> <input type="text" required disabled value="<%=user.getName()%>"/>
			</div>

			<div class="input-box">
				<label>Email Address</label> <input type="text" required disabled value="<%=user.getEmail()%>"/>
			</div>
			<div class="input-box">
				<label>Password</label> <input type="text" required disabled value="<%=user.getPassword()%>"/>
			</div>
			<div class="input-box">
				<label>Phone number</label> <input type="tel" min=10 required disabled  value="<%=user.getPhoneNumber()%>" />
			</div>
			<input type="hidden" name="bookId" value="<%=user.getId()%>">
			<button type="button" class="btn btn-primary update-button"
				data-toggle="modal" data-target="#updateModal<%=user.getId()%>">Update</button>
			<button>Delete</button>
		</form>
		<div class="modal fade" id="updateModal<%=user.getId()%>"
			tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="EditUserServlet" method="post">
						<div class="modal-header">
							<h5 class="modal-title" id="updateModalLabel">Update Book</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="hidden" name="userId" value="<%=user.getId()%>">
							<div class="form-group">
								<label for="name">Name:</label> <input type="text"
									class="form-control" id="title" name="name1"
									value="<%=user.getName()%>" required>
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input type="text"
									class="form-control" id="author" name="email"
									value="<%=user.getEmail()%>" required>
							</div>
							<div class="form-group">
								<label for="phoneNumber">Phone number:</label> <input
									type="text" class="form-control" id="author" name="phoneno"
									value="<%=user.getPhoneNumber()%>" required>
							</div>
							<div class="form-group">
								<label for="password">Password:</label> <input type="text"
									class="form-control" id="author" name="pass"
									value="<%=user.getPassword()%>" required>
							</div>
							<div class="modal-footer">

								<button type="submit" class="btn btn-success">Save
									Changes</button>
							</div>
					</form>
				</div>
			</div>
		</div>

	</section>
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>