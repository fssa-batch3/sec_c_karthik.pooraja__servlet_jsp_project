package com.fssa.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.books.dao.TransferDAO;
import com.fssa.books.model.BorrowHistory;
import com.fssa.books.model.Role;
import com.fssa.connection.exception.ConnectionException;

/**
 * Servlet implementation class BorrowHistory
 */
@WebServlet("/BorrowHistory")
public class ShowingBorrowHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<BorrowHistory> history;
		String role=request.getParameter("");
		String userEmail=request.getParameter("");
		try {
			if(role.equals("BORROWER")) {
				
			}
			else {
			    history=TransferDAO.showAllBorrowHistory();
			    RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/borrow.jsp");
				dispatcher.include(request, response);	
			}
		}
		catch(SQLException|ConnectionException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
