<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fssa.books.model.BorrowHistory"%>
<%@ page import="com.fssa.books.dao.TransferDAO"%>
<%@ page import="com.fssa.books.dao.UserDAO"%>
<%@ page import="com.fssa.books.service.UserService"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.books.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrow History</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h1 class="mt-4">Borrow History</h1>
		<table class="table table-bordered mt-3">
			<thead class="thead-dark">
				<tr>
					<th>S.No.</th>
					<th>User Name</th>
					<th>User Email</th>
					<th>Book Title</th>
					<th>Transfer Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				User obj = (User) session.getAttribute("user");
				String email=obj.getEmail();
				User user=UserService.details(email);
				String role=user.getRole().toString();
				String status=user.isTransfer_status().toString();
				int id = user.getId();
				List<BorrowHistory> borrowHistoryList = null; // Initialize the list

				if (role.equals("BORROWER")) {
					borrowHistoryList = UserDAO.getUserBorrowDetails(id);
				} else {
					borrowHistoryList = TransferDAO.showAllBorrowHistory();
				}

				int serialNumber = 1;
				for (BorrowHistory history : borrowHistoryList) {
				%>
				<tr>
					<td><%=serialNumber++%></td>
					<td><%=history.getUserName()%></td>
					<td><%=history.getUserEmail()%></td>
					<td><%=history.getBookName()%></td>
					<td>
						<%
						if (role.equals("BORROWER")) {
						%> <%=history.getTransferStatus().toString()%>
						<%
						} 
						else {
						String transferStatus = history.getTransferStatus().toString();
						if ("PENDING".equals(transferStatus)) {
						%>
						<form action="<%=request.getContextPath()%>/UpdateStatusServlet"
							method="POST">
							<!-- Hidden input to store the BorrowHistory ID -->
							<input type="hidden" name="borrowHistoryId"
								value="<%=history.getRequestId()%>"> 
								<input
								type="hidden" name="bookId" value="<%=history.getBookId()%>">
								<% User borrower=UserService.details(history.getUserEmail()) ; %>
								<input type="hidden" name="userId" value="<%=borrower.getId() %>">
							<%=transferStatus%>
							<!-- Button for rejecting the request -->
							<button class="btn btn-danger" type="submit" name="newStatus"
								value="REJECTED">Rejected</button>
							<!-- Button for accepting the request -->
							<button class="btn btn-primary" type="submit" name="newStatus"
								value="ACCEPTED">Accepted</button>

							
						</form> <%
 } else {
 out.print(transferStatus);
 }
 }
 %>
					</td>
				</tr>
				<%
				}
				%>

			</tbody>

		</table>
	</div>
</body>
</html>
