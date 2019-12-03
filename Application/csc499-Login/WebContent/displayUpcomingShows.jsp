<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="java.util.List" %>

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

<center><h1>Upcoming Shows</h1></center>
<div class="container mtb">
	<div class="row">
		<div class="col-lg-6">
			<strong>Check out these upcoming shows:</strong>
			<hr/>
			<table>
				<thead>
					<th>Show</th>
					<th>Start</th>
					<th>End</th>
					<th>Description</th>
				</thead>
					<%
					List<Show> showList = (List)request.getAttribute("shows");
					int show_id;
					for(int i=0; i<showList.size(); i++) {
						show_id = showList.get(i).getShowId();
						out.print("<tr>");
						out.print("<td>" + showList.get(i).getShowName() + "</td>");
						out.print("<td>" + showList.get(i).getStartDatetime() + "</td>");
						out.print("<td>" + showList.get(i).getEndDatetime() + "</td>");
						out.print("<td>" + showList.get(i).getShowDescription() + "</td>");
						if(! userType.toLowerCase().equals("barf") ) {
							out.print("<td><form action='" + request.getContextPath() + "/operation?"
									+ "&show_id=" + show_id + "' method='get'>"
									+ "<input type='hidden' name='user_id' value='" + userId+ "'>"
									+ "<input type='hidden' name='show_id' value='" + show_id + "'>"
									+ "<input type='hidden' name='page' value='show'>"
									+ "<input type='submit' value='VIEW SHOW'>"
									+ "</form></td>");
							}
					}
					 %>
			</table>
		</div>
	</div>
</div>
<br>

<c:import url="footer.jsp"></c:import>