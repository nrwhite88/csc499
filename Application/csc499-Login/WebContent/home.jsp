<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.entity.User" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>

<%
String username = null, sessionID = null;
if(request.getSession().getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
}
else {
	username = request.getSession().getAttribute("username").toString();
	sessionID = request.getSession().getId();
}

List<User> user = (List)request.getAttribute("user");
String publicName = user.get(0).getPublicName();
String userType = user.get(0).getUserType();

List<User> userList = (List)request.getAttribute("userList");
%>

<h1>Welcome, <%= publicName %></h1>

<div class="container mtb">
	<div class="row">
		<div class="col-lg-6">
			<strong>Check out these bands or bars:</strong>
			<hr/>
			<table>
				<thead>
					<th><%= userList.get(0).getUserType() %></th>
					<th>TOWN</th>
					<th>WEBSITE</th>
					</thead>
					<%
					for(int i=0; i<userList.size(); i++) {
						out.print("<tr>");
						out.print("<td>" + userList.get(i).getPublicName() + "</td>");
						out.print("<td>" + userList.get(i).getTown() + "</td>");
						out.print("<td>" + userList.get(i).getWebsiteURL() + "</td>");
						out.print("<td><form action='" + request.getContextPath() + "/operation' method='get'>" +
								"<input type='hidden' name='form' value='bookingOperation'>" +
								"<input type='submit' value='BOOK'></td>");
						
					}
					%>
			</table>
		</div>
	</div>
</div>

<form action="<%= request.getContextPath()%>/site" method="get">
<input type="hidden" name="action" value="destroy">
<input type="submit" value="Logout">
</form>

</body>
</html>