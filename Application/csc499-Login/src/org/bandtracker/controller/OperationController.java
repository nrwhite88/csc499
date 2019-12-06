package org.bandtracker.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.bandtracker.hibernate.dao.BookingDAO;
import org.bandtracker.hibernate.dao.ShowDAO;
import org.bandtracker.hibernate.dao.UserDAO;
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
		System.out.println("Page: " + page);
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
		case "profile":
			profileLoader(request, response);
			break;
		case "show":
			showLoader(request, response);
			break;
		case "search":
			searchFormLoader(request, response);
			break;
		case "editshow":
			editShowLoader(request, response);
			break;
		case "upcomingshows":
			upcomingShowsLoader(request, response);
			break;
		case "gohome":
			homeLoader(request, response);
			break;
		case "mybooking":
			myBookingLoader(request, response);
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
			System.out.println(request.getParameter("duration"));
			LocalDateTime timestamp = LocalDateTime.now();
			Booking newBooking = new Booking(timestamp.toString(), Integer.parseInt(request.getParameter("duration").toString()),
					request.getParameter("datetime").toString());
			bookOperation(request, response, dataSource, newBooking);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			break;
		case "addshowoperation":
			Show newShow = new Show(request.getParameter("start_datetime").toString(), request.getParameter("end_datetime").toString(),
					request.getParameter("show_name"), request.getParameter("show_description"));
			addShowOperation(request, response, dataSource, newShow);
			homeLoader(request, response);
			break;
		case "searchoperation":
			searchOperation(request, response);
			break;
		case "editshowoperation":
			editShowOperation(request, response);
			break;
		case "editbookingoperation":
			editBookingOperation(request, response);
		default:
		case "bookingresponseoperation":
			bookingResponseOperation(request, response);
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
		
		DateTimeFormatter dtFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String datetimeOfRequest = LocalDateTime.parse(newBooking.getDatetimeOfRequest()).format(dtFormat);
		newBooking.setDatetimeOfRequest(datetimeOfRequest);
		String bandId = request.getParameter("bookee_id").toString();
		String showId = request.getParameter("show_id").toString();
		new BookingDAO().addBookingDetails(newBooking, Integer.parseInt(bandId), Integer.parseInt(showId));
		homeLoader(request, response);
	}
	
	public void addShowOperation(HttpServletRequest request, HttpServletResponse response, DataSource dataSource,
			Show newShow) throws ServletException, IOException {
		new ShowDAO().addShowDetails(newShow, Integer.parseInt(request.getParameter("bar_id").toString()));
		//new ShowModel().addShow(dataSource, newShow, Integer.parseInt(request.getParameter("bar_id")));
		
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
		
		Object shows = null;
		List<Object> bookings = null;
		
		// Get recommendations list based on user type
		List<User> userList = new ArrayList<>();
		String user_type = request.getParameter("user_type").toString();
		request.setAttribute("user_type", user_type);
		userList = new UserModel().listUsers(dataSource, user_type);
		request.setAttribute("userList", userList);
		User user = new UserDAO().getUserById(Integer.parseInt(request.getParameter("bookee")));
		
		// Get list of shows
		if(user_type.equals("BAR")) {
			shows = new ShowDAO().listShowsByUserId(Integer.parseInt(request.getParameter("booker")));
			bookings = new BookingModel().listBookingsWithEverythingByBandId(dataSource,
					Integer.parseInt(request.getParameter("bookee")));
		}
		else if(user_type.equals("BAND")) {
			shows = new ShowDAO().listShowsByUserId(Integer.parseInt(request.getParameter("bookee")));
			bookings = new BookingModel().listBookingsWithEverythingByBandId(dataSource,
					Integer.parseInt(request.getParameter("booker")));
		}
		request.setAttribute("bookee", user.getPublicName());
		request.setAttribute("shows", shows);
		request.setAttribute("bookings", bookings);
		request.setAttribute("title", "Book");
		request.getRequestDispatcher("book.jsp").forward(request, response);
	}
	
	public void addShowFormLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Add Show");
		request.getRequestDispatcher("addShow.jsp").forward(request, response);
	}
	
	public void showLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Show");
		request.setAttribute("edit", false);
		
		int show_id = Integer.parseInt(request.getParameter("show_id").toString());
		
		List<Object> bookings = new BookingModel().listBookingsWithEverythingByShowId(dataSource, show_id);

		request.setAttribute("bookings", bookings);
		Object show = new ShowDAO().getShowById(show_id);
		request.setAttribute("show", show);
		request.setAttribute("bookings", bookings);
		
		request.getRequestDispatcher("show.jsp").forward(request, response);
	}
	
	public void editShowLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Show");
		request.setAttribute("edit", true);
		
		int show_id = Integer.parseInt(request.getParameter("show_id").toString());
		
		List<Object> bookings = new BookingModel().listBookingsWithEverythingByShowId(dataSource, show_id);
		Object show = new ShowDAO().getShowById(show_id);
		request.setAttribute("show", show);
		request.setAttribute("bookings", bookings);
		
		request.getRequestDispatcher("show.jsp").forward(request, response);

	}
	
	public void editBookingOperation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookingId = request.getParameter("bookingId").toString();
		String requestedDatetime = request.getParameter("requestedDatetime").toString();
		String duration = request.getParameter("duration").toString();
		new BookingDAO().editBookingDetails(Integer.parseInt(bookingId), requestedDatetime,
				Integer.parseInt(duration));
		homeLoader(request, response);
	}
	
	public void myBookingLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId").toString());
		String userType = request.getParameter("userType");
		List<Object> bookings = null;
		
		if (userType.toLowerCase().equals("bar")) {
			bookings = new BookingModel().listMyBookingsByBarId(dataSource, userId);	
		}
		else if (userType.toLowerCase().equals("band")) {
			bookings = new BookingModel().listMyBookingsByBandId(dataSource, userId);	
		}

		request.setAttribute("bookings", bookings);
		request.getRequestDispatcher("myBooking.jsp").forward(request, response);
	}
	
	public void bookingResponseOperation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookingId = Integer.parseInt(request.getParameter("booking_id").toString());
		String userType = request.getParameter("userType").toString();
		Boolean bookingResponse = Boolean.parseBoolean(request.getParameter("booking_response").toString());
		new BookingDAO().editBookingResponse(bookingId, userType, bookingResponse);
		myBookingLoader(request, response);
	}
	
	public void editShowOperation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String showId = request.getParameter("showId").toString();
		String start = request.getParameter("start").toString();
		String end = request.getParameter("end").toString();
		String name = request.getParameter("name").toString();
		String description = request.getParameter("description").toString();
		new ShowDAO().editShowDetails(Integer.parseInt(showId), start, end, name, description);
		//new ShowModel().addShow(dataSource, newShow, Integer.parseInt(request.getParameter("bar_id")));
		homeLoader(request, response);
	}
	
	public void deleteShowOperation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String showId = request.getParameter("showId").toString();
		new ShowDAO().deleteShow(Integer.parseInt(showId));
		homeLoader(request, response);
	}
	
	public void profileLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Profile");
		int user_id = Integer.parseInt(request.getParameter("bookee"));
		User user = new UserDAO().getUserById(user_id);
		Object shows = new ShowDAO().listShowsByUserId(user_id);
		//Object bookings = new ShowDAO().listShowsByUserId(Integer.parseInt(request.getParameter("bookee")));
		List<Object> bookings = new BookingModel().listBookingsWithEverythingByBandId(dataSource, user_id);
		System.out.println("Boooooooookings: " + bookings);
		
		request.setAttribute("user", user);
		request.setAttribute("user_type", user.getUserType());
		request.setAttribute("shows", shows);
		request.setAttribute("bookings", bookings);
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}
	
	public void searchFormLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Search");
		request.getRequestDispatcher("search.jsp").forward(request, response);
	}

	public void upcomingShowsLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Upcoming Shows");
		
		List<Object> shows = new ShowModel().listShowsWithVenue(dataSource);
		request.setAttribute("shows", shows);
		System.out.println("Done!");

		request.getRequestDispatcher("displayUpcomingShows.jsp").forward(request, response);
	}
	
	public void searchOperation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String search_phrase = request.getParameter("username");
	List<User> results = new UserDAO().getUsersByUsernameSearch(search_phrase);
	request.setAttribute("results", results);
	PrintWriter out = response.getWriter();
	RequestDispatcher rd = getServletContext().getRequestDispatcher("/search.jsp");
	rd.include(request, response);
	}
	
	public void homeLoader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "test home");

		String userType = request.getParameter("userType");
		int userId = Integer.parseInt(request.getParameter("userId").toString());
		request.setAttribute("userType", userType);
		request.setAttribute("userId", userId);
		
		User user = new UserDAO().getUserById(userId);
		request.setAttribute("user", user);
		
		// Get recommendations list based on user type
		List<User> userList = new ArrayList<>();
		String user_type = userType;
		String user_id = Integer.toString(userId);
		request.setAttribute("type", user_type);
		userList = new UserModel().listUsers(dataSource, user_type);
		request.setAttribute("userList", userList);
		
		// Get calendar list based on user type
		if(user_type.equals("BAR")) {
			Object shows = new ShowDAO().listShowsByUserId(userId);
			System.out.println("It's " + user);
			request.setAttribute("shows", shows);
		}
		else if (user_type.equals("BAND")) {
			Object bookings = new BookingDAO().listBookingsByBandId(userId);
			System.out.println("It's " + user);
			request.setAttribute("bookings", bookings);
		}
		if(user_type.equals("FAN")) {
			Object shows = new ShowDAO().listShows();
			System.out.println("It's " + user);
			request.setAttribute("shows", shows);
		}
		
		request.getRequestDispatcher("testHome.jsp").forward(request, response);
	}
	
	public void errorPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Error Page");
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}
	
}
