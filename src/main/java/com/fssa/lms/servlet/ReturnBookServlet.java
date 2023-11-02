package com.fssa.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.books.dao.BookDao;
import com.fssa.books.dao.TransferDAO;
import com.fssa.books.dao.UserDAO;
import com.fssa.connection.exception.ConnectionException;

/**
 * Servlet implementation class ShowingReturnHistory
 */
@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Get borrowHistoryId and bookId from request parameters
			int borrowHistoryId = Integer.parseInt(request.getParameter("borrowHistoryId"));
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			int userId = Integer.parseInt(request.getParameter("userId"));
			String status = request.getParameter("returnStatus");
			boolean updatedTransferStatus = TransferDAO.updateReturnStatusAndDates(borrowHistoryId, status);
			boolean updated = BookDao.updateStockBasedOnAdminAction(bookId,borrowHistoryId);
			boolean updatedUserTransfer=UserDAO.updateTransferStatus(status,userId);
			if (updatedTransferStatus && updated&&updatedUserTransfer) {
				response.sendRedirect(request.getContextPath() + "/return.jsp");
			}

		} catch (NumberFormatException | SQLException | ConnectionException e) {
			e.printStackTrace();
		}
	}
}
