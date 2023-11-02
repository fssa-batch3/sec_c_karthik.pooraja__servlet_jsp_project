package com.fssa.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.books.dao.BookDao;
import com.fssa.books.exception.BookDAOCRUDException;
import com.fssa.connection.exception.ConnectionException;

/**
 * Servlet implementation class UpdateStockServlet
 */
@WebServlet("/UpdateStockServlet")
public class UpdateStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int bookId = Integer.parseInt(request.getParameter("bookId"));
	     int newStock = Integer.parseInt(request.getParameter("newStock"));
          
	     try {
			BookDao.updateBookStocks(newStock,bookId);			
	    	 response.sendRedirect("BookServlet");
	     }
	     catch(IOException|SQLException|ConnectionException|BookDAOCRUDException e){
	    	 e.printStackTrace();
	        response.sendRedirect("User.jsp");
	     }

    }

}
