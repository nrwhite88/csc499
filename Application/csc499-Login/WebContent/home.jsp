<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.entity.User" %>
<%@ page import="java.util.List" %>
    
    
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
%>

<h1>Welcome, <%= publicName %></h1>



<form action="<%= request.getContextPath()%>/site" method="get">
<input type="hidden" name="action" value="destroy">
<input type="submit" value="Logout">
</form>

</body>
</html>