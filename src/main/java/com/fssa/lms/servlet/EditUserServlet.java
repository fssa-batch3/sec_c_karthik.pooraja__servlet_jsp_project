package com.fssa.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.books.exception.BookDAOCRUDException;
import com.fssa.books.exception.DataException;
import com.fssa.books.model.User;
import com.fssa.books.service.BookService;
import com.fssa.connection.exception.ConnectionException;
import com.fssa.books.service.UserService;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
        String name= request.getParameter("name1");
        String phoneNumber = request.getParameter("phoneno");
       // String email = request.getParameter("publishername");
        String password = request.getParameter("pass");
        User user=new User();
        user.setId(userId);
        user.setName(name);
        user.setPhoneNumber(phoneNumber);
        user.setPassword(password);
        UserService userService = new UserService();
        try {
            userService.updateUser(user);
        } catch (DataException | SQLException | ConnectionException e) {
            e.printStackTrace();
        }

        response.sendRedirect("ProfileServlet");
        
	}

}
