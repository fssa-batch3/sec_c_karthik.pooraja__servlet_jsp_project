<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Title Here</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Montserrat|Quicksand');

* {
	font-family: 'quicksand', Arial, Helvetica, sans-serif;
	box-sizing: border-box;
}

body {
	background: #fff;
	
}

.form-modal {
    margin-top: 15%;
	position: relative;
	width: 30%; height : auto; left : 50%;
	transform: translateX(-50%);
	background: #fff;
	border-top-right-radius: 20px;
	border-top-left-radius: 20px;
	border-bottom-right-radius: 20px;
	box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
	left: 50%;
	height: auto;
}

.form-modal button {
	cursor: pointer;
	position: relative;
	text-transform: capitalize;
	font-size: 1em;
	z-index: 2;
	outline: none;
	background: #fff;
	transition: 0.2s;
}

.form-modal .btn {
	border-radius: 20px;
	border: none;
	font-weight: bold;
	font-size: 1.2em;
	padding: 0.8em 1em 0.8em 1em !important;
	transition: 0.5s;
	border: 1px solid #ebebeb;
	margin-bottom: 0.5em;
	margin-top: 0.5em;
}

.form-modal .login, .form-modal .signup {
	background: #57b846;
	color: #fff;
}

.form-modal .login:hover, .form-modal .signup:hover {
	background: #222;
}

.form-toggle {
	position: relative;
	width: 100%;
	height: auto;
	display: flex;
}

.form-toggle button {
	width: 50%;
	float: left;
	padding: 1.5em;
	margin-top: 4 em;
	border: none;
	transition: 0.2s;
	font-size: 1.1em;
	font-weight: bold;
	border-top-right-radius: 20px;
	border-top-left-radius: 20px;
}

.form-toggle button:nth-child(1) {
	border-bottom-right-radius: 20px;
}

.form-toggle button:nth-child(2) {
	border-bottom-left-radius: 20px;
}

#login-toggle {
	background: #57b846;
	color: #ffff;
}

.form-modal form {
	position: relative;
	width: 90%;
	height: auto;
	left: 50%;
	transform: translateX(-50%);
}

#login-form, #signup-form {
	position: relative;
	width: 100%;
	height: auto;
	padding-bottom: 1em;
}

#signup-form {
	display: none;
}

#login-form button, #signup-form button {
	width: 100%;
	margin-top: 0.5em;
	padding: 0.6em;
}

.form-modal input {
	position: relative;
	width: 100%;
	font-size: 1em;
	padding: 1.2em 1.7em 1.2em 1.7em;
	margin-top: 0.6em;
	margin-bottom: 0.6em;
	border-radius: 20px;
	border: none;
	background: #ebebeb;
	outline: none;
	font-weight: bold;
	transition: 0.4s;
}

.form-modal input:focus, .form-modal input:active {
	transform: scaleX(1.02);
}

.form-modal input::-webkit-input-placeholder {
	color: #222;
}

.form-modal p {
	font-size: 16px;
	font-weight: bold;
}

.form-modal p a {
	color: #57b846;
	text-decoration: none;
	transition: 0.2s;
}

.form-modal p a:hover {
	color: #222;
}

.form-modal i {
	position: absolute;
	left: 10%;
	top: 50%;
	transform: translateX(-10%) translateY(-50%);
}

.fa-google {
	color: #dd4b39;
}

.fa-linkedin {
	color: #3b5998;
}

.fa-windows {
	color: #0072c6;
}

.-box-sd-effect:hover {
	box-shadow: 0 4px 8px hsla(210, 2%, 84%, .2);
}

@media only screen and (max-width:500px) {
	.form-modal {
		width: 100%;
	}
}

@media only screen and (max-width:400px) {
	i {
		display: none !important;
	}
}
</style>
</head>
<body>
<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		if (errorMessage != null) {
		%>
		<h3><%=errorMessage%></h3>
		<%
		}%>
	<div class="form-modal">
		<div class="form-toggle">
			<button id="login-toggle" onclick="toggleLogin()">log in</button>
			<button id="signup-toggle" onclick="toggleSignup()">sign up</button>
		</div>

		<div id="login-form">
			<form action="LoginServlet" method="post">
				<input type="text" placeholder="Enter email or username" name="email"  required />
				<input type="password" placeholder="Enter password" name="password" required />
				<button type="submit" class="btn login">login</button>
			</form>
		</div>

		<div id="signup-form">
				<form action="AddUserServlet" method ="post">
				     <input type="text" name="name" placeholder="Choose username"  required/> 
					<input type="email" name="email" placeholder="Enter your email"  required/> 
					<input type="password" name="password" placeholder="Create password"  required/> 
					<input type="tel" name="phoneNumber" placeholder=" Phone number" required/>
					<button type="submit" class="btn signup" >create account</button>
				</form>
			</div>
		</div>

	<script>
		function toggleSignup() {
			document.getElementById("login-toggle").style.backgroundColor = "#fff";
			document.getElementById("login-toggle").style.color = "#222";
			document.getElementById("signup-toggle").style.backgroundColor = "#57b846";
			document.getElementById("signup-toggle").style.color = "#fff";
			document.getElementById("login-form").style.display = "none";
			document.getElementById("signup-form").style.display = "block";
		}

		function toggleLogin() {
			document.getElementById("login-toggle").style.backgroundColor = "#57B846";
			document.getElementById("login-toggle").style.color = "#fff";
			document.getElementById("signup-toggle").style.backgroundColor = "#fff";
			document.getElementById("signup-toggle").style.color = "#222";
			document.getElementById("signup-form").style.display = "none";
			document.getElementById("login-form").style.display = "block";
		}

	</script>
</body>
</html>
