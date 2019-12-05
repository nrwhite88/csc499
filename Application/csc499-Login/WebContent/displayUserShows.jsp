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
String user_type = request.getAttribute("user_type").toString();
System.out.println("User type: " + user_type);
if(user_type.toString().toLowerCase().equals("bar")) {
		out.print(
					"<strong>Available shows:</strong>" +
						"<hr/>" +
							"<table>" +
								"<thead>" +
									"<th>SHOW</th>" +
									"<th>START</th>" +
									"<th>END</th>" +
								"</thead>");
					
					List<Show> showList = (List)request.getAttribute("shows");
					int booker_id = Integer.parseInt(request.getParameter("booker"));
					int show_id;
					for(int i=0; i<showList.size(); i++) {
						show_id = showList.get(i).getShowId();
						out.print("<tr>");
						out.print("<td>" + showList.get(i).getShowName() + "</td>");
						out.print("<td>" + showList.get(i).getStartDatetime() + "</td>");
						out.print("<td>" + showList.get(i).getEndDatetime() + "</td>");
						if(request.getParameter("page").equals("book")) {
							out.print("<td>"
									+ "<input type='radio' name='show_id' value='" + show_id + "'>"
									+ "<input type='hidden' name='booker_id' value='" + booker_id + "'>"
									+ "<input type='hidden' name='bookee_id' value='" + request.getParameter("bookee") + "'>"
									+ "</td>");
						}
					}
					
		out.print(					
					"</table>"
				);
}
if(user_type.toString().toLowerCase().equals("band")) {
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
				int booker_id = Integer.parseInt(request.getParameter("booker"));
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
}
%>
<br>

<c:import url="footer.jsp"></c:import>