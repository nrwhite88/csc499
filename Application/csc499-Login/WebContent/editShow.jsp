<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="org.bandtracker.hibernate.entity.Booking" %>
<%@ page import="org.bandtracker.hibernate.dao.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp">
<c:param name="title" value="Index"/>
</c:import>

<jsp:include page="header.jsp"></jsp:include>

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
List<Booking> bookings = (List)request.getAttribute("bookings");
%>

<div class="container">
	<h1>Show Details</h1>
	<div class="row">
		<div class="col-lg-6">
			<h3>Associated bookings:</h3>
			<hr/>
			<table>
				<thead>
					<th>ID</th>
					<th>Date & Time</th>
					<th>Duration</th>
					<th>Date & Time of Request</th>
					<th>Status</th>
					</thead>
					<%
					for(Booking booking : bookings) {
						out.print("<tr>");
						out.print("<td>" + booking.getBookingId() + "</td>");
						out.print("<td>" + booking.getRequestedDatetime() + "</td>");
						out.print("<td>" + booking.getDuration() + "</td>");
						out.print("<td>" + booking.getDatetimeOfRequest() + "</td>");
						out.print("<td>" + booking.getConfirmed() + "</td>");
						out.print("</tr>");
						}
					%>
			</table>
		</div>
	</div>
</div>

<br>

<c:import url="footer.jsp"></c:import>