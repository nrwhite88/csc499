package org.bandtracker.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.bandtracker.hibernate.dao.BookingDAO;
import org.bandtracker.hibernate.dao.ShowDAO;
import org.bandtracker.hibernate.dao.UserDAO;
import org.bandtracker.hibernate.entity.User;
import org.bandtracker.model.BookingModel;
import org.bandtracker.model.UserModel;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	
	@Resource(name="jdbc/project")
	private DataSource dataSource;
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// get request parameters for userID and password
		String user = request.getParameter("username");
		String pwd = request.getParameter("password");
		HttpSession session = loginOperation(request, response, dataSource, user, pwd);
		
		if (! session.equals(null)) {
			Cookie loginCookie = new Cookie("user", user);
			
			//Set cookie expiration
			loginCookie.setMaxAge(15*60);
			response.addCookie(loginCookie);
			request.getRequestDispatcher("testHome.jsp").forward(request, response);
			
		}else{
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>User name or password is incorrect.</font>");
			rd.include(request, response);
		}

	}

	private HttpSession loginOperation(HttpServletRequest request, HttpServletResponse response, 
				DataSource datasource, String username, String password) throws ServletException, IOException {
			
		HttpSession session = null;
			
		// Get current user attributes
		List<User> currentUser = new ArrayList<>();
		currentUser = new UserModel().validateCredentials(dataSource, username, password);
		User currUser = new UserDAO().getUserById(currentUser.get(0).getUserId());
		request.setAttribute("user", currUser);
		
		// Get recommendations list based on user type
		List<User> userList = new ArrayList<>();
		String user_type = currentUser.get(0).getUserType();
		String user_id = Integer.toString(currentUser.get(0).getUserId());
		request.setAttribute("userId", user_id);
		request.setAttribute("type", user_type);
		request.setAttribute("userType", user_type);
		userList = new UserModel().listUsers(dataSource, user_type);
		request.setAttribute("userList", userList);
		
		// Get calendar list based on user type
		if(user_type.equals("BAR")) {
			Object shows = new ShowDAO().listShowsByUserId(currentUser.get(0).getUserId());
			System.out.println("It's " + currentUser);
			request.setAttribute("shows", shows);
		}
		else if (user_type.equals("BAND")) {
			List<Object> bookings = new BookingModel().listBookingsWithEverythingByBandId(dataSource,
					Integer.parseInt(user_id));
			System.out.println("It's " + currentUser);
			request.setAttribute("bookings", bookings);
		}
		if(user_type.equals("FAN")) {
			Object shows = new ShowDAO().listShows();
			System.out.println("It's " + currentUser);
			request.setAttribute("shows", shows);
		}
		
		// Start session and forward user to their home page
		if(! currentUser.isEmpty()) {
			session = authenticate(request, response, username);
			Cookie userTypeCookie = new Cookie("userType", user_type);
			Cookie userIdCookie = new Cookie("userId", user_id);
			userTypeCookie.setMaxAge(15*60);
			userIdCookie.setMaxAge(15*60);
			response.addCookie(userTypeCookie);
			response.addCookie(userIdCookie);
			
			return session;
		}
		else {
			return session;
		}
	}

	protected HttpSession authenticate(HttpServletRequest request, HttpServletResponse response, String username) throws ServletException, IOException {
		request.getSession().invalidate();
		HttpSession newSession = request.getSession(true);
		//newSession.setMaxInactiveInterval(3);
		newSession.setAttribute("username", username);
		String encode = response.encodeURL(request.getContextPath());
		
		return newSession;
		
		//request.getRequestDispatcher("home.jsp").forward(request, response);
		//response.sendRedirect(encode+"/site?action=userHome");
	
	}
	
		public void errorPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setAttribute("title", "Error Page");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	
	}
