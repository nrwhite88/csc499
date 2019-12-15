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
				"<strong>Tour bookings:</strong>" +
					"<hr/>" +
						"<table>" +
							"<thead>" +
								"<th>TOUR</th>" +
								"<th>START</th>" +
								"<th>END</th>" +
							"</thead>");
				
				List<List<Object>> tourList = (List)request.getAttribute("tours");
				int tour_id;
				for(int i=0; i<tourList.size(); i++) {
					tour_id = Integer.parseInt(tourList.get(i).get(0).toString());
					out.print("<tr class='bordered'>");
					out.print("<td>" + tourList.get(i).get(1).toString() + "</td>");
					out.print("<td>" + tourList.get(i).get(2).toString() + "</td>");
					out.print("<td>" + tourList.get(i).get(3).toString() + "</td>");
					if(request.getParameter("page").equals("myTouring")) {
						out.print("<td>"
								+ "<input type='radio' name='tour_id' value='" + tour_id + "'>"
								+ "</td>");
					}
				}
				
	out.print(					
				"</table>"
			);
%>
<br>

<c:import url="footer.jsp"></c:import>