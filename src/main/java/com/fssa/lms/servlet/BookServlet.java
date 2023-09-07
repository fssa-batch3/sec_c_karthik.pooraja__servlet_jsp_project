package com.fssa.lms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.books.exception.BookDAOCRUDException;
import com.fssa.books.exception.BookDataException;
import com.fssa.books.model.Book;
import com.fssa.books.service.BookService;
import com.fssa.connection.exception.ConnectionException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//private static final String BOOK_SEARCH_JSP = "./booksearch.jsp";

	// Inside your servlet's doGet method
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {

		    String categoryName = request.getParameter("bookcat");
		    String id = request.getParameter("id");
		    

		    try {
		        List<Book> bookList;

		        if (categoryName != null && !categoryName.isEmpty()) {
		            // User entered a specific category, fetch books in that category
		            bookList = BookService.getAllBookByCategory(categoryName);
		        } 
		        else {
		            // Show all books
		            bookList = BookService.readBooks();

		        }

		        request.setAttribute("bookList", bookList);

		        if (id == null) {
					RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/booksearch.jsp");
					 dispatcher.include(request, response);
				} else {
					RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/UserList.jsp");
					dispatcher.include(request, response);
				}

		    } catch (SQLException | BookDataException | BookDAOCRUDException | ConnectionException e) {
		        e.getMessage();
		    }
		}


}
