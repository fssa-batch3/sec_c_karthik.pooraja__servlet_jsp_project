<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.books.model.Book"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Book List</title>
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
        </select>
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="submit">Search</button>
        </div>
    </div>
</form>

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

        <!-- Display List of Books -->
        <%
        List<Book> bookList = (List<Book>) request.getAttribute("bookList");
        if (bookList != null && !bookList.isEmpty()) {
        %>
        <div class="card-deck">
            <%
            for (Book book : bookList) {
            %>
            <!-- Individual Book Card -->
            <div class="card">
                <img class="card-img-top" src="<%=book.getBookimageurl()%>" alt="<%=book.getTitle()%>">
                <div class="card-body">
                    <h5 class="card-title"><%=book.getTitle()%></h5>
                    <p class="card-text">Author: <%=book.getAuthor()%></p>
                    <p class="card-text">Publisher: <%=book.getPublishername()%></p>
                    <p class="card-text">Edition: <%=book.getEdition()%></p>
                    <p class="card-text">Publish Date: <%=book.getPublisheddate()%></p>
                    <p class="card-text">Category: <%=book.getCategoryname()%></p>
                    
                    	<!-- Update Button -->
					
						<input type="hidden" name="bookId" value="<%=book.getId()%>">
						<button type="button" class="btn btn-primary update-button"
							data-toggle="modal" data-target="#updateModal<%=book.getId()%>">Update</button>

					<!-- Delete Button -->
					<form action="DeleteBookServlet" method="post" class="d-inline">
						<input type="hidden" name="bookId" value="<%=book.getId()%>">
						<button type="submit" class="btn btn-danger">Delete</button>
					</form>
					</div>
					</div>

					<!-- Add an update form (hidden by default) -->
					<div class="modal fade" id="updateModal<%=book.getId()%>"
						tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<form action="./EditBookServlet" method="post">
									<div class="modal-header">
										<h5 class="modal-title" id="updateModalLabel">Update Book</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<input type="hidden" name="bookId" value="<%=book.getId()%>">
										<div class="form-group">
											<label for="title">Title:</label> <input type="text"
												class="form-control" id="title" name="title"
												value="<%=book.getTitle()%>" required>
										</div>
										<div class="form-group">
											<label for="author">Author:</label> <input type="text"
												class="form-control" id="author" name="author"
												value="<%=book.getAuthor()%>" required>
										</div>

										<div class="form-group">
											<label for="publisheddate">Published Date:</label> <input
												type="date" class="form-control" id="publisheddate"
												name="publisheddate" max="<%=todayDate %>" value="<%=book.getPublisheddate()%>"
												required>
										</div>

										<div class="form-group">
											<label for="publishername">Publisher Name:</label> <input
												type="text" class="form-control" id="publishername"
												name="publishername" value="<%=book.getPublishername()%>"
												required>
										</div>

										<div class="form-group">
											<label for="bookimageurl">Book Image URL:</label> <input
												type="text" class="form-control" id="bookimageurl"
												name="bookimageurl" value="<%=book.getBookimageurl()%>"
												required>
										</div>

										<div class="form-group">
											<label for="edition">Edition:</label> <input type="number"
												class="form-control" id="edition" name="edition"
												value="<%=book.getEdition()%>" required>
										</div>

										<div class="form-group">
    <label for="categoryname">Category Name:</label>
    <select class="form-control" id="categoryname" name="categoryname" required>
        <option value="" selected disabled>Select a category</option>
        <option value="FICTION" <% if ("FICTION".equals(book.getCategoryname())) { %>selected<% } %>>FICTION</option>
        <option value="NON_FICTION" <% if ("NON_FICTION".equals(book.getCategoryname())) { %>selected<% } %>>NON_FICTION</option>
        <option value="SCIENCE_FICTION" <% if ("SCIENCE_FICTION".equals(book.getCategoryname())) { %>selected<% } %>>SCIENCE_FICTION</option>
        <option value="MYSTERY" <% if ("MYSTERY".equals(book.getCategoryname())) { %>selected<% } %>>MYSTERY</option>
        <option value="ROMANCE" <% if ("ROMANCE".equals(book.getCategoryname())) { %>selected<% } %>>ROMANCE</option>
        <option value="FANTASY" <% if ("FANTASY".equals(book.getCategoryname())) { %>selected<% } %>>FANTASY</option>
        <option value="THRILLER" <% if ("THRILLER".equals(book.getCategoryname())) { %>selected<% } %>>THRILLER</option>
        <option value="HORROR" <% if ("HORROR".equals(book.getCategoryname())) { %>selected<% } %>>HORROR</option>
        <option value="HISTORY" <% if ("HISTORY".equals(book.getCategoryname())) { %>selected<% } %>>HISTORY</option>
        <option value="BIOGRAPHY" <% if ("BIOGRAPHY".equals(book.getCategoryname())) { %>selected<% } %>>BIOGRAPHY</option>
        <option value="SELF_HELP" <% if ("SELF_HELP".equals(book.getCategoryname())) { %>selected<% } %>>SELF_HELP</option>
        <option value="POETRY" <% if ("POETRY".equals(book.getCategoryname())) { %>selected<% } %>>POETRY</option>
        <option value="OTHER" <% if ("OTHER".equals(book.getCategoryname())) { %>selected<% } %>>OTHER</option>
    </select>
</div>
										
									</div>
									<div class="modal-footer">
										
										<button type="submit" class="btn btn-success">Save
											Changes</button>
									</div>
								</form>
							</div>
						</div>
					</div>
            <!-- End of Update Modal -->
            <%
            }
            %>
        </div>
        <!-- End of Card Deck -->
        <%
        }
        %>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- JavaScript for Modal Display -->
    <script>
        // Get all elements with the class "update-form"
        const updateForms = document.querySelectorAll('.update-form');

        // Add an event listener to each "Update" button
        updateForms.forEach(form => {
            const updateButton = form.querySelector('.btn-primary');
            const cancelButton = form.querySelector('.btn-success');

            updateButton.addEventListener('click', () => {
                form.style.display = 'block';
            });

            cancelButton.addEventListener('click', () => {
                form.style.display = 'none';
            });
        });
    </script>
</body>

</html>
