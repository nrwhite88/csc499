package org.bandtracker.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bandtracker.hibernate.dao.BookingDAO;
import org.bandtracker.hibernate.dao.ShowDAO;
import org.bandtracker.hibernate.dao.UserDAO;
import org.bandtracker.hibernate.entity.Booking;
import org.bandtracker.hibernate.entity.Show;
import org.bandtracker.hibernate.entity.User;

@WebServlet("/test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch(action) {
		case "listUsers":
			listUsers(request, response);
		default:
			break;
		}
	}

	private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Add user with persistence
		//User user = new User("Timby", "timspw");
		//new UserDAO().addUserDetails(user);
		//System.out.println(user);
		//request.setAttribute("user", user);
		
		//Add booking with persistence, default user. Need to have db check to make sure the booking will fit first.
		//LocalDateTime timestamp = LocalDateTime.now();
		//DateTimeFormatter dtFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		//String datetimeOfRequest = LocalDateTime.parse(timestamp.toString()).format(dtFormat);
		//Booking booking = new Booking(datetimeOfRequest, 1, "2019-12-12 20:00:00");
		//new BookingDAO().addBooking(booking);
		
		Object shows = new ShowDAO().listShowsByUserId(12);
		
		//Add show with persistence, default user
		//Show show = new Show("2019-12-12 19:00:00", "2019-12-12 23:00:00");
		//new ShowDAO().addShow(show);
		
		//Retrieve list of all users
		List<User> userList = new UserDAO().listUsers();
		System.out.println(userList);
		request.setAttribute("userList", userList);
		request.setAttribute("shows", shows);
		
		request.getRequestDispatcher("listUsers.jsp").forward(request, response);
	}
}