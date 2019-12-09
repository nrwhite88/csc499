<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="org.bandtracker.hibernate.entity.Booking" %>
<%@ page import="org.bandtracker.hibernate.dao.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String username = null;
String userId = null;
String userType = null;
Cookie[] cookies = request.getCookies();
	if(cookies !=null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("user"))
				username = cookie.getValue();
			if(cookie.getName().equals("userId"))
				userId = cookie.getValue();
			if(cookie.getName().equals("userType"))
				userType = cookie.getValue();
			
		}
	}

if(username == null) response.sendRedirect("login.jsp");
%>

<%
List<User> results = (List)request.getAttribute("results");
String myId = userId;
%>

<div class="container mb">
			<h3>Here are some results:</h3>
			<hr/>
			<table>
				<thead>
					<th>Name</th>
					<th>Is A</th>
					<th>From</th>
					<th>Zip Code</th>
					<th>Website</th>
					</thead>
					<%
					for(User user : results) {
						out.print("<tr class='bordered'>");
						out.print("<td>" + user.getPublicName() + "</td>");
						out.print("<td>" + user.getUserType() + "</td>");
						out.print("<td>" + user.getTown() + "</td>");
						out.print("<td>" + user.getZipCode() + "</td>");
						out.print("<td>" + user.getWebsiteURL() + "</td>");
						out.print("<td><form action='" + request.getContextPath() + "/operation?"
								+ "&user_id=" + myId + "' method='get'>"
								+ "<input type='submit' value='VIEW PROFILE'>"
								+ "<input type='hidden' name='page' value='profile'>"
								+ "<input type='hidden' name='booker' value='" + myId + "'>"
								+ "<input type='hidden' name='bookee' value='" + user.getUserId() + "'>"
								+ "</form></td>");
						out.print("</tr>");
						}
					%>
			</table>
</div>

<br>