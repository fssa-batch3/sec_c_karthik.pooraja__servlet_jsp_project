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

import com.fssa.books.dao.BookDao;
import com.fssa.books.dao.TransferDAO;
import com.fssa.books.dao.UserDAO;
import com.fssa.books.model.BorrowHistory;
import com.fssa.connection.exception.ConnectionException;

/**
 * Servlet implementation class UpdateStatusServlet
 */
@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("borrowHistoryId"));
		String status = request.getParameter("newStatus");
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		int userId=Integer.parseInt(request.getParameter("userId"));

		

		try {
			if (status.equals("ACCEPTED")) {
				boolean update = TransferDAO.updateAcceptStatusAndDates(id, status);
				boolean count = BookDao.updateStockBasedOnAdminAction(bookId, id);
				boolean user = UserDAO.updateTransferStatus(status,userId);
				if (update && count && user) {
					response.sendRedirect(request.getContextPath() + "/borrow.jsp");
				} 
			}
			else if (status.equals("REJECTED")){	
				boolean updatedStatus = UserDAO.updateTransferStatus(status,userId);
				boolean TransferStatus=TransferDAO.updateAcceptStatusAndDates(id, status);
				if (updatedStatus&&TransferStatus) {
					response.sendRedirect(request.getContextPath() + "/borrow.jsp");
				}
			}

		} catch (SQLException | ConnectionException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
}
