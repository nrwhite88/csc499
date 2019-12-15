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

<%
User user = (User)request.getAttribute("user");
String public_name = user.getPublicName();
String user_type = user.getUserType();

List<User> userList = (List)request.getAttribute("userList");
%>

<center><h1>Welcome, <%= public_name %></h1></center>
<div class="container mtb">

<div class="col-lg-6">
<% 
	user_type = user_type.toString().toLowerCase();
	if (user_type.toLowerCase().equals("bar")) {
		out.print(
					"<strong>Your upcoming shows:</strong>" +
						"<hr/>" +
							"<table>" +
								"<thead>" +
									"<th>SHOW</th>" +
									"<th>START</th>" +
									"<th>END</th>" +
								"</thead>");

					List<Show> showList = (List)request.getAttribute("shows");
					int show_id;
					for(int i=0; i<showList.size(); i++) {
						show_id = showList.get(i).getShowId();
						out.print("<tr class='bordered'>");
						out.print("<td>" + showList.get(i).getShowName() + "</td>");
						out.print("<td>" + showList.get(i).getStartDatetime() + "</td>");
						out.print("<td>" + showList.get(i).getEndDatetime() + "</td>");
						out.print("<td><form action='" + request.getContextPath() + "/operation?"
								+ "&show_id=" + show_id + "' method='get'>"
								+ "<input type='submit' value='VIEW'>"
								+ "<input type='hidden' name='page' value='editShow'>"
								+ "<input type='hidden' name='user_id' value='" + userId + "'>"
								+ "<input type='hidden' name='show_id' value='" + show_id + "'>"
								+ "</form></td>");
					}
		out.print(					
					"</table>" +
				"</div>"
				);
	}
	
	else if (user_type.toLowerCase().equals("band")) {%>
		<jsp:include page="displayUserBookings.jsp"></jsp:include>
					<%
		out.print("</div>");
	}

	if (user_type.toLowerCase().equals("fan")) {
		out.print(
					"<strong>Upcoming shows:</strong>" +
						"<hr/>" +
							"<table>" +
								"<thead>" +
									"<th>SHOW</th>" +
									"<th>START</th>" +
									"<th>END</th>" +
								"</thead>");
					
					List<Show> showList = (List)request.getAttribute("shows");
					int show_id;
					for(int i=0; i<showList.size() && i<10; i++) {
						show_id = showList.get(i).getShowId();
						out.print("<tr class='bordered'>");
						out.print("<td>" + showList.get(i).getShowName() + "</td>");
						out.print("<td>" + showList.get(i).getStartDatetime() + "</td>");
						out.print("<td>" + showList.get(i).getEndDatetime() + "</td>");
						out.print("<td><form action='" + request.getContextPath() + "/operation?"
								+ "&show_id=" + show_id + "' method='get'>"
								+ "<input type='hidden' name='user_id' value='" + userId+ "'>"
								+ "<input type='hidden' name='show_id' value='" + show_id + "'>"
								+ "<input type='hidden' name='page' value='show'>"
								+ "<input type='submit' value='VIEW SHOW'>"
								+ "</form></td>");
					}
						out.print("</table><br>");
						out.print("<center><form action='" + request.getContextPath() + "/operation? method='get'>"
								+ "<input type='hidden' name='page' value='upcomingShows'>"
								+ "<input type='submit' value='EVEN MORE SHOWS'>"
								+ "</form></center>");
					out.print("</div>");
	}
%>
		<div class="col-lg-6">
			<strong>Check out these local folks:</strong>
			<hr />
			<table>
				<thead>
					<th>
						<%
							if (!user_type.equals("FAN")) {
								out.print(userList.get(0).getUserType());
							} else {
								out.print("FOLK");
								out.print("<th>TYPE</th>");
							}
						%>
					</th>
					<th>TOWN</th>
					<th>WEBSITE</th>
				</thead>
				<%
					int booker_id = user.getUserId();
					for (int i = 0; i < userList.size(); i++) {
						int bookee = userList.get(i).getUserId();
						out.print("<tr class='bordered'>");
						out.print("<td>" + userList.get(i).getPublicName() + "</td>");
						if (user_type.toLowerCase().equals("fan")) {
							out.print("<td>" + userList.get(i).getUserType() + "</td>");
						}
						out.print("<td>" + userList.get(i).getTown() + "</td>");
						out.print("<td>" + userList.get(i).getWebsiteURL() + "</td>");
						out.print("<td><form action='" + request.getContextPath() + "/operation?" + "&user_id=" + booker_id
								+ "' method='get'>" + "<input type='submit' value='VIEW PROFILE'>"
								+ "<input type='hidden' name='page' value='profile'>"
								+ "<input type='hidden' name='booker' value='" + booker_id + "'>"
								+ "<input type='hidden' name='bookee' value='" + bookee + "'>" + "</form></td>");
						if (! user_type.toLowerCase().equals("fan")) {
							out.print("<td><form action='" + request.getContextPath() + "/operation?booker_id=" + booker_id
									+ "&bookee_id=" + userList.get(i).getUserId() + "' method='get'>"
									+ "<input type='submit' value='BOOK'>" + "<input type='hidden' name='page' value='book'>"
									+ "<input type='hidden' name='booker' value='" + booker_id + "'>"
									+ "<input type='hidden' name='bookee' value='" + bookee + "'>"
									+ "<input type='hidden' name='user_type' value='" + user_type + "'>" + "</form></td>");
						}
					}
				%>
			</table>
		</div>
		<br>
</div>
<c:import url="footer.jsp"></c:import>