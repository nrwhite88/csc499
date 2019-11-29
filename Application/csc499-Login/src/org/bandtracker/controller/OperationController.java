package org.bandtracker.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.bandtracker.hibernate.entity.Booking;
import org.bandtracker.hibernate.entity.Show;
import org.bandtracker.hibernate.entity.User;
import org.bandtracker.model.BookingModel;
import org.bandtracker.model.ShowModel;
import org.bandtracker.model.UserModel;

@WebServlet("/operation")
public class OperationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/project")
	private DataSource dataSource;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		page = page.toLowerCase();
		
		switch (page) {
		case "register":
			registerFormLoader(request, response);
			break;
		case "login":
			loginFormLoader(request, response);
			break;
		case "book":
			bookFormLoader(request, response);
			break;
		case "addshow":
			addShowFormLoader(request, response);
			break;
		default:
			errorPage(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("form");
		System.out.println("Operation: " + operation);
		operation = operation.toLowerCase();
		switch (operation) {
		case "registeroperation":
			User newUser = new User(request.getParameter("username"), request.getParameter("password"),
					request.getParameter("usertype"),
					request.getParameter("publicname"), request.getParameter("firstname"),
					request.getParameter("lastname"), request.getParameter("streetaddress"),
					request.getParameter("town"), request.getParameter("zipcode"),
					request.getParameter("email"), Integer.parseInt(request.getParameter("phone")));
			registerOperation(newUser);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		case "loginoperation":
			loginOperation(request, response, dataSource, request.getParameter("username"),
					request.getParameter("password"));
			break;
		case "bookoperation":
			LocalDateTime timestamp = LocalDateTime.now();
			Booking newBooking = new Booking(timestamp.toString(), Integer.parseInt(request.getParameter("duration").toString()),
					request.getParameter("datetime").toString());
			bookOperation(request, response, dataSource, newBooking);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		case "addshowoperation":
			Show newShow = new Show(request.getParameter("start_datetime").toString(), request.getParameter("end_datetime").toString());
			addShowOperation(request, response, dataSource, newShow);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		default:
			break;
		}
	}
	
	private void registerOperation(User newUser) {
		new UserModel().addUser(dataSource, newUser);
		return;	
	}
	
	private void loginOperation(HttpServletRequest request, HttpServletResponse response, 
				DataSource datasource, String username, String password) throws ServletException, IOException {
		// Get current user attributes
		List<User> currentUser = new ArrayList<>();
		currentUser = new UserModel().validateCredentials(dataSource, username, password);
		request.setAttribute("user", currentUser);
		
		// Get list based on user type
		List<User> userList = new ArrayList<>();
		String user_type = currentUser.get(0).getUserType();
		request.setAttribute("type", user_type);
		userList = new UserModel().listUsers(dataSource, user_type);
		request.setAttribute("userList", userList);
		
		// Start session and forward user to their home page
		if(! currentUser.isEmpty()) {
			authenticate(request, response, username);
		}
		else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		return;
	}
	
	protected void authenticate(HttpServletRequest request, HttpServletResponse response, String username) throws ServletException, IOException {
		request.getSession().invalidate();
		HttpSession newSession = request.getSession(true);
		newSession.setMaxInactiveInterval(3);
		newSession.setAttribute("username", username);
		String encode = response.encodeURL(request.getContextPath());
		
		request.getRequestDispatcher("home.jsp").forward(request, response);
		//response.sendRedirect(encode+"/site?action=userHome");

	}
	
	public void bookOperation(HttpServletRequest request, HttpServletResponse response, DataSource dataSource,
			Booking newBooking) throws ServletException, IOException {
		new BookingModel().addBooking(dataSource, newBooking);
		
	}
	
	public void addShowOperation(HttpServletRequest request, HttpServletResponse response, DataSource dataSource,
			Show newShow) throws ServletException, IOException {
		new ShowModel().addShow(dataSource, newShow, Integer.parseInt(request.getParameter("bar_id")));
		
	}
	
	public void registerFormLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Registration");
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}
	
	public void loginFormLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Login");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	
	public void bookFormLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Book");
		request.getRequestDispatcher("book.jsp").forward(request, response);
	}
	
	public void addShowFormLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Add Show");
		request.getRequestDispatcher("addShow.jsp").forward(request, response);
	}
	
	public void errorPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Error Page");
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}
	
}
