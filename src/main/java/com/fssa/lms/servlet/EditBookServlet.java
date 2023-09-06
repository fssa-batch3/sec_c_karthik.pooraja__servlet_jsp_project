package com.fssa.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

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
import com.fssa.books.exception.BookDataException;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 // Retrieve the book ID from the request parameter
    	 
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        LocalDate publishedDate = LocalDate.parse(request.getParameter("publisheddate"));
        String publisherName = request.getParameter("publishername");
        String bookImageUrl = request.getParameter("bookimageurl");
        int edition = Integer.parseInt(request.getParameter("edition"));
        String categoryName = request.getParameter("categoryname");
        
        BookCategory category=BookCategory.valueOf(categoryName);
        
        Book book = new Book();
        book.setId(bookId);
        book.setTitle(title);
        book.setAuthor(author);
        book.setPublisheddate(publishedDate);
        book.setPublishername(publisherName);
        book.setBookimageurl(bookImageUrl);
        book.setEdition(edition);
        book.setCategoryname(category);
        // Set the book object as an attribute to be used in the JSP
        BookService bookService= new BookService();
        try {
			bookService.updateBooks(book);
		} catch (BookDataException | BookDAOCRUDException | SQLException | ConnectionException e) {
			e.printStackTrace();
		}

        response.sendRedirect("./BookServlet");
    }
}

