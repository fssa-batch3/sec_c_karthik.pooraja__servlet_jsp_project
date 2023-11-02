package com.fssa.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.books.model.*;
import com.fssa.books.service.UserService;
import com.fssa.books.exception.DataException;
import com.fssa.connection.exception.ConnectionException;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user input from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        // Create a User object with the retrieved data
        User user = new User(name, phoneNumber, email, password);

        try {
            // Attempt to add the user to the database
            boolean userAdded = UserService.addUser(user);

            if (userAdded) {
                // Redirect to a success page
                response.sendRedirect("./User.jsp");
            } else {
                // Redirect to an error page
            	System.out.println("err");
                response.sendRedirect("./User.jsp");
            }
        } catch (ConnectionException | SQLException|DataException e) {
            // Handle exceptions appropriately
            e.printStackTrace();
            response.sendRedirect("./User.jsp");
        } 
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}


