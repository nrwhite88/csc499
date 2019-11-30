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
import javax.servlet.http.HttpSession;

import org.bandtracker.hibernate.dao.BookingDAO;
import org.bandtracker.hibernate.dao.ShowDAO;
import org.bandtracker.hibernate.dao.UserDAO;
import org.bandtracker.hibernate.entity.Booking;
import org.bandtracker.hibernate.entity.Show;
import org.bandtracker.hibernate.entity.User;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/site")
public class SiteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SiteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch(action) {
		case "userHome":
			goHome(request, response);
			break;
		case "destroy":
			request.getSession().invalidate();	
			response.sendRedirect(request.getContextPath()+"/operation?page=login");
			break;
		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	public void goHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Homepage");
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

}
