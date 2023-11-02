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
import com.fssa.books.exception.DataException;

/**
 * EditBookServlet handles the editing of book information through a POST request.
 * It retrieves book details from the request parameters, updates the book information
 * in the database using BookService, and redirects to the BookServlet upon completion.
 */
@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles HTTP GET requests. Currently, it does nothing as there is no
     * GET-specific functionality in this servlet.
     *
     * @param request  The HttpServletRequest object containing the client's request.
     * @param response The HttpServletResponse object for sending responses.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while handling the request.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request,response);
    }

    /**
     * Handles HTTP POST requests for editing book information.
     * It retrieves book details from the request parameters, updates the book information
     * in the database using BookService, and redirects to the BookServlet upon completion.
     *
     * @param request  The HttpServletRequest object containing the client's request.
     * @param response The HttpServletResponse object for sending responses.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs while handling the request.
     */
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
        int stock = Integer.parseInt(request.getParameter("stock"));
        
        BookCategory category = BookCategory.valueOf(categoryName);
        
        Book book = new Book();
        book.setId(bookId);
        book.setTitle(title);
        book.setAuthor(author);
        book.setPublisheddate(publishedDate);
        book.setPublishername(publisherName);
        book.setBookimageurl(bookImageUrl);
        book.setEdition(edition);
        book.setCategoryname(category);
        book.setStock(stock);
         
        // Set the book object as an attribute to be used in the JSP
        BookService bookService = new BookService();
        try {
            bookService.updateBooks(book);
        } catch (DataException | BookDAOCRUDException | SQLException | ConnectionException e) {
            e.printStackTrace();
        }

        response.sendRedirect("./BookServlet");
    }
}
