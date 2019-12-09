<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="org.bandtracker.hibernate.entity.Booking" %>
<%@ page import="java.util.List" %>
 
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
	out.print(
				"<strong>Bookings:</strong>" +
					"<hr/>" +
						"<table>" +
							"<thead>" +
								"<th>BAR</th>" +
								"<th>SHOW</th>" +
								"<th>LOCATION</th>" +
								"<th>START</th>" +
								"<th>LENGTH</th>" +
							"</thead>");
				
				List<List<Object>> bookingList = (List)request.getAttribute("bookings");
				int booker_id = Integer.parseInt(userId);
				int booking_id;
				for(int i=0; i<bookingList.size(); i++) {
					booking_id = Integer.parseInt(bookingList.get(i).get(0).toString());
					out.print("<tr>");
					out.print("<td>" + bookingList.get(i).get(10).toString() + "</td>");
					out.print("<td>" + bookingList.get(i).get(8).toString() + "</td>");
					out.print("<td>" + bookingList.get(i).get(12).toString() + ", " +
							bookingList.get(i).get(13).toString() + "</td>");
					out.print("<td>" + bookingList.get(i).get(1).toString() + "</td>");
					out.print("<td>" + bookingList.get(i).get(2).toString() + " hrs</td>");
				}
				
	out.print(					
				"</table>"
			);
%>
<br>

<c:import url="footer.jsp"></c:import>