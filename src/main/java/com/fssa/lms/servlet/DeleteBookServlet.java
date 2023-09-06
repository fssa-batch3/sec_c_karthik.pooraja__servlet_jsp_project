package com.fssa.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.books.exception.BookDAOCRUDException;
import com.fssa.books.exception.BookDataException;
import com.fssa.books.service.BookService;
import com.fssa.connection.exception.ConnectionException;

/**
 * Servlet implementation class DeleteBookServlet
 */

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int bookId = Integer.parseInt(request.getParameter("bookId"));

		// Call the deleteBooks method with the bookId
		
		try {
			boolean success = BookService.deleteBooks(bookId);

			if (success) {
				// Redirect to a success page or show a success message
				response.sendRedirect("BookServlet");
			} else {
				// Handle the case where book deletion fails
				response.sendRedirect("BookServlet");
			}

		} catch (SQLException | BookDataException | BookDAOCRUDException | ConnectionException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

	}
}
