<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.books.model.Book"%>
<%@ page import="com.fssa.books.model.User"%>
<%@page import="com.fssa.books.dao.TransferDAO" %>
<%@ page import="com.fssa.books.service.UserService"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<!-- Search Form -->
		<form action="BookServlet" method="get">
			<div class="input-group mb-3">
				<select class="form-control" name="bookcat">
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
				</select> <input type="hidden" name="id" value="results">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="submit">Search</button>
				</div>
			</div>
		</form>
        <% User obj=(User) session.getAttribute("user"); %>
        <%String email=obj.getEmail();%>
        <%User user=UserService.details(email);%>
        <%int answer=TransferDAO.getBookIdWithPendingStatus(user.getId()); %>
        
		<h3>List of books</h3>

		<!-- Display Error Message if Present -->
		<%
		String errorMessage = request.getParameter("errorMessage");
		if (errorMessage != null) {
		%>
		<h3><%=errorMessage%></h3>
		<%
		}
		%>

		<!-- Get Current Date -->
		<%
		LocalDate date = LocalDate.now();
		String todayDate = date.toString();
		%>
        <% int id=user.getId(); %>

		<!-- Display List of Books -->
		<%
		List<Book> bookList = (List<Book>) request.getAttribute("bookList");
		if (bookList != null && !bookList.isEmpty()) {
		%>
		<div class="row">
			<%
			for (Book book : bookList) {
			%>
			
			<!-- Individual Book Card -->
			<div class="col-md-4 mb-4">
				<div class="card">
				
					<img class="card-img-top" src="<%=book.getBookimageurl()%>"
						alt="<%=book.getTitle()%>">
					<div class="card-body">
						<h5 class="card-title"><%=book.getTitle()%></h5>
						<p class="card-text">
							Author:
							<%=book.getAuthor()%></p>
						<p class="card-text">
							Publisher:
							<%=book.getPublishername()%></p>
						<p class="card-text">
							Edition:
							<%=book.getEdition()%></p>
						<p class="card-text">
							Publish Date:
							<%=book.getPublisheddate()%></p>
					    <p class="card-text">
							Stock:
							<%=book.getStock()%></p>
						<p class="card-text">
							Category:
							<%=book.getCategoryname()%></p>
							<%String status=user.isTransfer_status().toString(); %>
							
							<%if(book.getStock()>0){ %>
							<% if(status.equals("INLIMIT")){%>
							<form action="borrow" method="post">
							<input type="hidden" name="bookId" value="<%=book.getId()%>">
							<input type="hidden" name="userId" value="<%=id%>">
							<input type="hidden" name="userTransferStatus" value="<%=status%>">
							<button type="submit" class="btn btn-primary update-button">Borrow</button>
						    </form>
						    <% }
							else if(status.equals("BORROWED")){
								out.print("Return book to borrow books");
							}
							else if(status.equals("ABOVELIMIT")&&answer==book.getId()){%>
							<form action="borrow" method="post">
							<input type="hidden" name="bookId" value="<%=book.getId()%>">
							<input type="hidden" name="userId" value="<%=id%>">
							<input type="hidden" name="userTransferStatus" value="REJECTED">
							<button type="submit" class="btn btn-primary update-button">Cancel Request to Borrow</button>
						    </form>						
							<%}else{
								out.print("you can't borrow");
							}%>
							<%}else{
							  out.print("out of stock");
							}%>
					
					
							

					</div>
						
				</div>
			</div>
			<%}%>
		</div>
		<%} %>
		

		<!-- End of Card Deck -->
		
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