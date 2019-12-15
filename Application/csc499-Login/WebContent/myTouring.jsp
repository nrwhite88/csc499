<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Booking" %>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Touring</title>
</head>
<body>
<center><h1>Add Bookings to Tours</h1></center>
<form action="${pageContext.request.contextPath}/operation" method="post">
<div class="container mtb">
	<div class="col-lg-6">
		<h2>Your gigs:</h2>
		<jsp:include page="displayUserBookings.jsp"></jsp:include>
	</div>
		<h2>Your tours:</h2>
	<div class="col-lg-6">
		<jsp:include page="displayUserTours.jsp"></jsp:include>
	</div>
</div>
<center>
<input type="hidden" name="userId" value=<%= userId %>>
<input type="hidden" name="userType" value=<%= userType %>>
<input type="hidden" name="form" value="bookTourOperation">
<input type="submit" value="Book to Tour">
</center>

</form>
<br>
<c:import url="footer.jsp"></c:import>