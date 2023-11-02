package com.fssa.lms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fssa.books.dao.UserDAO;
import com.fssa.books.exception.DataException;
import com.fssa.books.service.UserService;
import com.fssa.books.util.CustomLogger;
import com.fssa.connection.exception.ConnectionException;
import com.mysql.cj.xdevapi.Session;
import com.fssa.books.model.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String USER_DETAILS="/User.jsp";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println(email + "\n" + password);
		
		try {
			if (UserService.isExists(email, password)) {
				HttpSession session=request.getSession();
	            User user=UserService.details(email);
	            session.setAttribute("user", user);
				response.sendRedirect("BookServlet");
			}
		} catch (SQLException | ConnectionException | DataException e) {
			request.setAttribute("errorMessage", e.getMessage());
  	        RequestDispatcher dispatcher = request.getRequestDispatcher(USER_DETAILS);
  	        dispatcher.forward(request, response);
			
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}