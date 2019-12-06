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
if(username == null) response.sendRedirect("login.jsp");
%> 
<div class="container mtb">
<%
	out.print(
				"<strong>Bookings:</strong>" +
					"<hr/>" +
						"<table>" +
							"<thead>" +
								"<th>BAND</th>" +
								"<th>SHOW</th>" +
								"<th>START</th>" +
								"<th>LENGTH</th>" +
								"<th>STATUS</th>" +
							"</thead>");
				
				List<List<Object>> bookingList = (List)request.getAttribute("bookings");
				int booker_id = Integer.parseInt(userId);
				int booking_id;
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
					booking_id = Integer.parseInt(bookingList.get(i).get(0).toString());
					out.print("<tr>");
					out.print("<td>" + bookingList.get(i).get(6).toString() + "</td>");
					out.print("<td>" + bookingList.get(i).get(8).toString() + "</td>");
					out.print("<td>" + bookingList.get(i).get(1).toString() + "</td>");
					out.print("<td>" + bookingList.get(i).get(2).toString() + " hrs</td>");
					out.print("<td>Bar: " + bar_confirmed + "</td>");
					out.print("<td>Band: " + band_confirmed + " </td>");
					out.print("<td><form action='" + request.getContextPath() + "/operation?"
							+ "&booking_id=" + booking_id + "' method='post'>"
							+ "<input type='hidden' name='form' value='bookingResponseOperation'>"
							+ "<input type='hidden' name='user_id' value='" + userId+ "'>"
							+ "<input type='hidden' name='response' value='1'>"
							+ "<input type='submit' value='CONFIRM'>"
							+ "</form></td>");
					out.print("<td><form action='" + request.getContextPath() + "/operation?"
							+ "&booking_id=" + booking_id + "' method='post'>"
							+ "<input type='hidden' name='form' value='bookingResponseOperation'>"
							+ "<input type='hidden' name='user_id' value='" + userId+ "'>"
							+ "<input type='hidden' name='response' value='0'>"
							+ "<input type='submit' value='DENY'>"
							+ "</form></td>");
				}
				
	out.print(					
				"</table>"
			);
%>
</div>

<c:import url="footer.jsp"></c:import>