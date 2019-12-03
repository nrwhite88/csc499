<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="org.bandtracker.hibernate.entity.Booking" %>
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

if(username == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<%
List<Booking> bookings = (List)request.getAttribute("bookings");
Boolean edit = Boolean.parseBoolean(request.getAttribute("edit").toString());
Show show = (Show)request.getAttribute("show");
%>

<div class="container">
	<h1>Show Details</h1>
	<div class="row">
		<div class="col-lg-6">
			<h3>Show details:</h3>
			<hr/>
			<table>
				<thead>
					<th>ID</th>
					<th>Name</th>
					<th>Start</th>
					<th>End</th>
					<th>Description</th>
				</thead>
					<% 
					if(! edit) {
						out.print("<td>" + show.getShowId() + "</td>");
						out.print("<td>" + show.getShowName() + "</td>");
						out.print("<td>" + show.getStartDatetime() + "</td>");
						out.print("<td>" + show.getEndDatetime() + "</td>");
						out.print("<td>" + show.getShowDescription() + "</td>");
					}
					else {
							int showId = show.getShowId();
							out.print("<tr>");
							out.print("<td>" + showId + "</td>");
							out.print("<form action='" + request.getContextPath() + "/operation' method='post'>"
									+ "<td><input type='text' name='name' value='" + show.getShowName() + "'></td>"
									+ "<td><input type='text' name='start' value='" + show.getStartDatetime() + "'></td>"
									+ "<td><input type='text' name='end' value='" + show.getEndDatetime() + "'></td>"
									+ "<td><input type='text' name='description' value='" + show.getShowDescription() + "'></td>"
									+ "<input type='hidden' name='showId' value='" + showId + "'>"
									+ "<input type='hidden' name='form' value='editShowOperation'>"
									+ "<td><input type='submit' value='Submit'></td></form>"
									);
							out.print("<form action='" + request.getContextPath() + "/operation' method='post'>"
									+ "<input type='hidden' name='showId' value='" + showId + "'>"
									+ "<input type='hidden' name='form' value='deleteShowOperation'>"
									+ "<td><input type='submit' value='Delete'></td></form>"
									);
							out.print("</tr>");
							}
					%>
			</table>
		</div>
	</div>
</div>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-6">
			<h3>Associated bookings:</h3>
			<hr/>
			<table>
				<thead>
					<th>ID</th>
					<th>Date & Time of Request</th>
					<th>Start</th>
					<th>Duration</th>
					<th>Status</th>
					</thead>
					<%
					if(! edit) {
					for(Booking booking : bookings) {
						out.print("<tr>");
						out.print("<td>" + booking.getBookingId() + "</td>");
						out.print("<td>" + booking.getDatetimeOfRequest() + "</td>");
						out.print("<td>" + booking.getRequestedDatetime() + "</td>");
						out.print("<td>" + booking.getDuration() + "</td>");
						out.print("<td>" + booking.getBarConfirmed() + "</td>");
						out.print("<td>" + booking.getBandConfirmed() + "</td>");
						out.print("</tr>");
						}
					}
					else{
						for(Booking booking : bookings) {
							int bookingId = booking.getBookingId();
							out.print("<tr>");
							out.print("<td>" + bookingId + "</td>");
							out.print("<td>" + booking.getDatetimeOfRequest() + "</td>");
							out.print("<form action='" + request.getContextPath() + "/operation' method='post'>"
									+ "<td><input type='text' name='requestedDatetime' value='" + booking.getRequestedDatetime() + "'></td>"
									+ "<td><input type='text' name='duration' value='" + booking.getDuration() + "'></td>"
									//+ "<td><input type='radio' name='confirmed' value='true'>Confirm</td>"
									//+ "<td><input type='radio' name='confirmed' value='false'>Deny</td>"
									+ "<td>Bar: " + booking.getBarConfirmed() + "</td>"
									+ "<td>Band: " + booking.getBandConfirmed() + "</td>"
									+ "<input type='hidden' name='bookingId' value='" + bookingId + "'>"
									+ "<input type='hidden' name='form' value='editBookingOperation'>"
									+ "<td><input type='submit' value='Submit'></td></form>"
									);
							out.print("<form action='" + request.getContextPath() + "/operation' method='post'>"
									+ "<input type='hidden' name='bookingId' value='" + bookingId + "'>"
									+ "<input type='hidden' name='form' value='deleteBookingOperation'>"
									+ "<td><input type='submit' value='Delete'></td></form>"
									);
							out.print("</tr>");
							}
						}
					%>
			</table>
		</div>
	</div>
</div>

<br>

<c:import url="footer.jsp"></c:import>