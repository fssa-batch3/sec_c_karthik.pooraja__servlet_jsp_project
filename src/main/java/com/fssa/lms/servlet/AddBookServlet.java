package com.fssa.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.books.model.*;
import com.fssa.books.service.BookService;
import com.fssa.connection.exception.ConnectionException;
import com.fssa.books.dao.*;
import com.fssa.books.exception.BookDAOCRUDException;
import com.fssa.books.exception.DataException;
/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ADD_BOOKS = "/addbooksform.jsp";
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Retrieve data from the form
      
    }
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
      */
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	  String title = request.getParameter("title");
	          String author = request.getParameter("author");
	          LocalDate publishedDate = LocalDate.parse(request.getParameter("publisheddate"));
	          String publisherName = request.getParameter("publishername");
	          String bookImageUrl = request.getParameter("bookimageurl");
	          int edition = Integer.parseInt(request.getParameter("edition"));
	          String categoryName = request.getParameter("categoryname");
	          int stock=Integer.parseInt(request.getParameter("stock"));
	          
	          BookCategory category=BookCategory.valueOf(categoryName);

	       // Create a Book object with the form data
	          Book book = new Book();
	          book.setTitle(title);
	          book.setAuthor(author);
	          book.setPublisheddate(publishedDate);
	          book.setPublishername(publisherName);
	          book.setBookimageurl(bookImageUrl);
	          book.setEdition(edition);
	          book.setCategoryname(category);
	          book.setStock(stock);


	          try {
	              // Call the addBooks method to add the book to the database
	              boolean success = BookService.addBooks(book);

	              if (success) {
	                  // Redirect to a success page or show a success message
	                  response.sendRedirect("BookServlet");
	              } else {
	                  // Handle the case where book insertion fails
	                  response.sendRedirect("addbooksform.jsp");
	              }
	          } catch (SQLException|ConnectionException|DataException|BookDAOCRUDException e) {
	        	  request.setAttribute("errorMessage", e.getMessage());
	  	        RequestDispatcher dispatcher = request.getRequestDispatcher(ADD_BOOKS);
	  	        dispatcher.forward(request, response);
	          }
	          
	     
	}


}
