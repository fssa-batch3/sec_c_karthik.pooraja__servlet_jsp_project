package com.fssa.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.books.dao.TransferDAO;
import com.fssa.books.dao.UserDAO;
import com.fssa.connection.exception.ConnectionException;

/**
 * Servlet implementation class borrow
 */
@WebServlet("/borrow")
public class borrow extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int userId = Integer.parseInt(request.getParameter("userId")); // Replace with the actual user ID (e.g., from session or authentication)
	     int bookId = Integer.parseInt(request.getParameter("bookId"));
	     
	     String status=request.getParameter("userTransferStatus");


	        try {
	        	if(status.equals("INLIMIT")) {
	        		boolean success =  TransferDAO.insertTransferRequest(bookId,userId);
		            boolean updated=UserDAO.updateTransferStatus(status,userId);
		            
		            if (success&&updated) {
		                // Redirect to a success or confirmation page
		                response.sendRedirect("BookServlet");
		                
		            } else {
		                // Handle the case where the request was not successfully inserted
		                response.sendRedirect("addbooksform.jsp"); // Replace with the appropriate URL
		            }
	        	}
	        	else if(status.equals("REJECTED")){
	        		boolean updated=UserDAO.updateTransferStatus(status,userId);
	        		boolean setStatus=TransferDAO.UserRejection(bookId);
	        		if(updated&&setStatus) {
	        			response.sendRedirect("BookServlet");
	        		}
	        		else {
	        			response.sendRedirect("addbooksform.jsp");
	        		}
	        	}
	        } catch (SQLException | ConnectionException e) {
	            e.printStackTrace();
	            // Handle exceptions here, e.g., log the error or redirect to an error page
	            response.sendRedirect("User.jsp"); // Replace with the appropriate URL
	        }
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

}
