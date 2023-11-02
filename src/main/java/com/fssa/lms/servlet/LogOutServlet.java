package com.fssa.lms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOutServlet
 */
@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Get the current session, or create one if it doesn't exist
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Invalidate the session (log the user out)
            session.invalidate();
        }

        // Redirect to the login page or a logout confirmation page
        response.sendRedirect("User.jsp"); // Replace with the appropriate URL
	
	}


}
