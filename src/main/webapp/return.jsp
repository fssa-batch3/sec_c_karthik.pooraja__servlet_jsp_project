<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.fssa.books.model.ReturnHistory"%>
<%@ page import="com.fssa.books.dao.TransferDAO"%>
<%@ page import="com.fssa.books.dao.UserDAO"%>
<%@ page import="com.fssa.books.model.User"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
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
		<h1 class="mt-4">Return History</h1>
<table class="table table-bordered mt-3">
    <thead class="thead-dark">
        <tr>
            <th>S.No.</th>
            <th>User Name</th>
            <th>User Email</th>
            <th>Book Title</th>
            <th>Start Date</th>
            <th>End Date</th>
        </tr>
    </thead>
    <tbody>
        <%
        User obj = (User) session.getAttribute("user");
        String role = obj.getRole().toString();
        int id = obj.getId();
        List<ReturnHistory> returnHistoryList = null; // Initialize the list

        if (role.equals("BORROWER")) {
            returnHistoryList = UserDAO.getUserReturnDetails(id);
        } else {
            returnHistoryList = TransferDAO.showAllReturnHistory();
        }
        int serialNumber = 1;
        for (ReturnHistory history : returnHistoryList) {
        %>
        <%User user=UserDAO.details(history.getUserEmail()); %>
        <tr>
            <td><%=serialNumber++%></td>
            <td><%=history.getUserName()%></td>
            <td><%=history.getUserEmail()%></td>
            <td><%=history.getBookName()%></td>
            <td><%=history.getStartDate().toString()%></td>
            <td>
                <%
                String endDate = history.getEndDate() != null ? history.getEndDate().toString() : null;

                if (role.equals("LIBRARIAN")) {
                    if (endDate == null) {
                %>
                    <!-- Show "Return" button -->
                    <form action="<%=request.getContextPath()%>/ReturnBookServlet" method="POST">
                        <input type="hidden" name="borrowHistoryId" value="<%=history.getRequestId()%>">
                        <input type="hidden" name="bookId" value="<%=history.getBookId()%>">
                        <input type="hidden" name="userId" value="<%=user.getId()%>">
                        <button class="btn btn-warning" type="submit" name="returnStatus" value="RETURNED">Return</button>
                    </form>
                <%
                    } else {
                        out.print(endDate);
                    }
                } 
                else {
                	if(endDate==null){
                		out.print("Yet to return");
                	}
                	else{
                		out.print(endDate);
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
