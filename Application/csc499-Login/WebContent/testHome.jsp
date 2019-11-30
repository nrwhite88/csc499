<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Home</title>
</head>
<body>

<%
String username = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user"))
		username = cookie.getValue();
}
}

if(username == null) response.sendRedirect("login.jsp");
%>

<h1>You are logged in, <%= username %></h1>

</body>
</html>