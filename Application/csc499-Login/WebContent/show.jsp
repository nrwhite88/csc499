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
List<List<Object>> bookingList = (List)request.getAttribute("bookings");
List<List<Object>> attendingList = (List)request.getAttribute("attending");
Boolean edit = Boolean.parseBoolean(request.getAttribute("edit").toString());
Show show = (Show)request.getAttribute("show");
%>
<center>
	<h1><% out.print(show.getShowName()); %></h1>
		<%
		out.print("</br>");
		int showId = show.getShowId();
		out.print("<td><form action='" + request.getContextPath() + "/operation' method='post'>"
				+ "<input type='submit' value='ATTEND'>"
				+ "<input type='hidden' name='form' value='attend'>"
				+ "<input type='hidden' name='userId' value='" + userId + "'>"
				+ "<input type='hidden' name='userType' value='" + userType + "'>"
				+ "<input type='hidden' name='showId' value='" + showId + "'>" + "</form></td>");
		out.print("</br>");
		%>
			<h3>Show details:</h3>
			<hr/>
			<table>
				<thead>
					<th>Show</th>
					<th>Start</th>
					<th>End</th>
					<th>Description</th>
				</thead>
					<% 
					if(! edit) {
						out.print("<td>" + show.getShowName() + "</td>");
						out.print("<td>" + show.getStartDatetime() + "</td>");
						out.print("<td>" + show.getEndDatetime() + "</td>");
						out.print("<td>" + show.getShowDescription() + "</td>");
					}
					else {
							showId = show.getShowId();
							out.print("<tr>");
							out.print("<form action='" + request.getContextPath() + "/operation' method='post'>"
									+ "<td><input type='text' name='name' value='" + show.getShowName() + "'></td>"
									+ "<td><input type='text' name='start' value='" + show.getStartDatetime() + "'></td>"
									+ "<td><input type='text' name='end' value='" + show.getEndDatetime() + "'></td>");
							out.print("<td><input type='text' name='description' value='" + show.getShowDescription() + "'></td>"
									+ "<input type='hidden' name='userId' value='" + userId + "'>"
									+ "<input type='hidden' name='userType' value='" + userType + "'>"
									+ "<input type='hidden' name='showId' value='" + showId + "'>"
									+ "<input type='hidden' name='show_id' value='" + showId + "'>"
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
</center>
<br>
<div class="container">
		<div class="col-lg-8">
			<h3>Associated bookings:</h3>
			<hr/>
			<table>
				<thead>
					<th>Band</th>
					<th>Date & Time of Request</th>
					<th>Start</th>
					<th>Duration</th>
					<% if (! userType.toLowerCase().equals("fan")) {
						out.print("<th>Status</th>");
					}%>
					</thead>
					<%
					if(! edit) {
					for(int i=0; i<bookingList.size(); i++) {
						Boolean bar_conf = Boolean.parseBoolean(bookingList.get(i).get(4).toString());
						Boolean band_conf = Boolean.parseBoolean(bookingList.get(i).get(5).toString());
						String bar_confirmed = null, band_confirmed = null;
						if (bar_conf.equals(null)) {
							bar_confirmed = "Pending";
						}
						else if (bar_conf == false) {
							bar_confirmed = "Denied";
						}
						else if (bar_conf == true) {
							bar_confirmed = "Confirmed";
						}
						if (band_conf.equals(null)) {
							band_confirmed = "Pending";
						}
						else if (band_conf == false) {
							band_confirmed = "Denied";
						}
						else if (band_conf == true) {
							band_confirmed = "Confirmed";
						}
						out.print("<tr>");
						out.print("<td>" + bookingList.get(i).get(6).toString() + "</td>");
						out.print("<td>" + bookingList.get(i).get(3).toString() + "</td>");
						out.print("<td>" + bookingList.get(i).get(1).toString() + "</td>");
						out.print("<td> " + bookingList.get(i).get(2).toString() + "</td>");
						if (! userType.toLowerCase().equals("fan")) {
							out.print("<td>Bar: " + bar_confirmed + "</td>");
							out.print("<td>Band: " + band_confirmed + "</td>");
							out.print("</tr>");	
						}
						}
					}
					else{
						for(int i=0; i<bookingList.size(); i++) {
							Boolean bar_conf = Boolean.parseBoolean(bookingList.get(i).get(4).toString());
							Boolean band_conf = Boolean.parseBoolean(bookingList.get(i).get(5).toString());
							String bar_confirmed = null, band_confirmed = null;
							if (bar_conf == null) {
								bar_confirmed = "Pending";
							}
							else if (bar_conf == false) {
								bar_confirmed = "Denied";
							}
							else if (bar_conf == true) {
								bar_confirmed = "Confirmed";
							}
							if (band_conf == null) {
								band_confirmed = "Pending";
							}
							else if (band_conf == false) {
								band_confirmed = "Denied";
							}
							else if (band_conf == true) {
								band_confirmed = "Confirmed";
							}
							int bookingId = Integer.parseInt(bookingList.get(i).get(0).toString());
							out.print("<tr>");
							out.print("<td>" + bookingList.get(i).get(6).toString() + "</td>");
							out.print("<td>" + bookingList.get(i).get(3).toString() + "</td>");
							out.print("<form action='" + request.getContextPath() + "/operation' method='post'>"
									+ "<td><input type='text' size='20' name='requestedDatetime' value='" + bookingList.get(i).get(1).toString() + "'></td>"
									+ "<td><input type='text' size='2' name='duration' value='" + bookingList.get(i).get(2).toString() + "'></td>"
									//+ "<td><input type='radio' name='confirmed' value='true'>Confirm</td>"
									//+ "<td><input type='radio' name='confirmed' value='false'>Deny</td>"
									+ "<td>Bar: " + bar_confirmed + "</td>"
									+ "<td>Band: " + band_confirmed + "</td>"
									+ "<input type='hidden' name='userId' value='" + userId + "'>"
									+ "<input type='hidden' name='show_id' value='" + showId + "'>"
									+ "<input type='hidden' name='userType' value='" + userType + "'>"
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
		<div class="col-lg-4">
			<h3>Attending:</h3>
			<hr/>
			<table>
				<thead>
					<th>Fan</th>
					<th>Town</th>
					<th>State</th>
					</thead>
					<%
					for(int i=0; i<bookingList.size(); i++) {
						out.print("<tr>");
						out.print("<td>" + attendingList.get(i).get(0).toString() + "</td>");
						out.print("<td>" + attendingList.get(i).get(1).toString() + "</td>");
						out.print("<td>" + attendingList.get(i).get(2).toString() + "</td>");
						out.print("</tr>");	
						}
					%>
			</table>
</div>
</div>

<br>

<c:import url="footer.jsp"></c:import>