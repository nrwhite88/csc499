<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
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
List<User> userList = (List)request.getAttribute("userList");
String user_type = request.getAttribute("user_type").toString();

System.out.println("User type: " + user_type);

if(! userType.toString().toLowerCase().equals("fan")) {

		out.print(
		"<div class='container mb'>" +
			"<div class='row'>" +
				"<div class='col-lg-6'>" +
					"<strong>Available shows:</strong>" +
						"<hr/>" +
							"<table>" +
								"<thead>" +
									"<th>SHOW ID</th>" +
									"<th>START</th>" +
									"<th>END</th>" +
								"</thead>");
					
					List<Show> showList = (List)request.getAttribute("shows");
					int booker_id = Integer.parseInt(request.getParameter("booker"));
					int show_id;
					for(int i=0; i<showList.size(); i++) {
						show_id = showList.get(i).getShowId();
						out.print("<tr>");
						out.print("<td>" + show_id + "</td>");
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
					"</table>" +
				"</div>" +
			"</div>" +
		"</div>"
				);

}
%>
<br>

<c:import url="footer.jsp"></c:import>