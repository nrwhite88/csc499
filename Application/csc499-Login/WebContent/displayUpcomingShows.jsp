<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		<div class="col-lg-14">
			<strong><center>Check out these upcoming shows:</center></strong>
			<hr/>
			<table>
				<thead>
					<th><center>Show</center></th>
					<th><center>Venue</center></th>
					<th><center>Town</center></th>
					<th><center>State</center></th>
					<th><center>Start</center></th>
					<th><center>End</center></th>
					<th><center>Description</center></th>
				</thead>
					<%
					List<List<Object>> showList = (List)request.getAttribute("shows");
					int show_id;
					for(int i=0; i<showList.size(); i++) {
						show_id = Integer.parseInt(showList.get(i).get(3).toString());
						out.print("<tr>");
						out.print("<td>" + showList.get(i).get(6).toString() + "</td>");
						out.print("<td>" + showList.get(i).get(0).toString() + "</td>");
						out.print("<td>" + showList.get(i).get(1).toString() + "</td>");
						out.print("<td>" + showList.get(i).get(2).toString() + "</td>");
						out.print("<td>" + showList.get(i).get(4).toString() + "</td>");
						out.print("<td>" + showList.get(i).get(5).toString() + "</td>");
						out.print("<td>" + showList.get(i).get(7).toString() + "</td>");
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