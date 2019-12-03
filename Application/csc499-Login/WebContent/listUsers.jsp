<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="org.bandtracker.hibernate.entity.Booking" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Users</title>
</head>
<body>

<h1>Listing users:</h1>

<%
List<User> users = (List)request.getAttribute("userList");
for(User user : users) {
	out.println("<p>" + user.getUsername() + "</p>");
}
%>

</body>
</html>