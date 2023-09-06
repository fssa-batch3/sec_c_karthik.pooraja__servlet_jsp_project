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
import com.fssa.connection.exception.ConnectionException;
import com.fssa.books.dao.*;
import com.fssa.books.exception.BookDAOCRUDException;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/EditBooksServlet")
public class EditBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        
        // Retrieve the updated book details from the form
        String updatedTitle = request.getParameter("updatedTitle");
        String updatedAuthor = request.getParameter("updatedAuthor");
        LocalDate updatedPublishedDate = LocalDate.parse(request.getParameter("publisheddate"));
        String updatedPublisherName = request.getParameter("publishername");
        String updatedBookImageUrl = request.getParameter("bookimageurl");
        int updatededition = Integer.parseInt(request.getParameter("edition"));
        String updatedCategoryName = request.getParameter("categoryname");
        
        BookCategory category=BookCategory.valueOf(updatedCategoryName);
        
        // ... (retrieve other fields as needed)

        // Create a Book object with the updated details
        Book updatedBook = new Book();
        updatedBook.setTitle(updatedTitle);
        updatedBook.setAuthor(updatedAuthor);
        updatedBook.setPublisheddate(updatedPublishedDate);
        updatedBook.setPublishername(updatedPublisherName);
        updatedBook.setBookimageurl(updatedBookImageUrl);
        updatedBook.setEdition(updatededition);
        updatedBook.setCategoryname(category);
        
        // Set the bookId in the updatedBook object
        updatedBook.setId(bookId);

            // Call the updateBooks method with the updatedBook object
            try {
				boolean success = BookDao.updateBooks(updatedBook);
			} 
			catch (BookDAOCRUDException | ConnectionException|SQLException  e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("booksearch.jsp");
			}

            
        }
}

