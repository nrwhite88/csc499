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

<%
List<List<Object>> bookingList = (List)request.getAttribute("bookings");
String bookee = request.getAttribute("bookee").toString();
String barRef = null;
String bandRef = null;
if(userType.toLowerCase().equals("bar")) {
	barRef = "Your";
	bandRef = bookee + "'s";
}
if(userType.toLowerCase().equals("band")) {
	barRef = bookee + "'s";
	bandRef = "Your";
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking</title>
</head>
<body>

<div class="container mtb">
	<center>
	<h2>Enter booking details:</h2>
	<form action="${pageContext.request.contextPath}/operation" method="post">
		Datetime:<input type="text" name="datetime" required="required"/><br/>
		Duration: <input type="text" name="duration" required="required"/><br/>
		<br><br>
	</center>
	<div class="col-lg-6">
		<h2><%= barRef %> shows:</h2>
		<jsp:include page="displayUserShows.jsp"></jsp:include>
	</div>
		<h2><%= bandRef %> gigs:</h2>
	<div class="col-lg-6">
		<jsp:include page="displayUserBookings.jsp"></jsp:include>
	</div>
</div>
<center>
<input type="hidden" name="userId" value=<%= userId %>>
<input type="hidden" name="userType" value=<%= userType %>>
<input type="hidden" name="form" value="bookOperation">
<input type="submit" value="Send Request">
</center>

</form>
<br>
<c:import url="footer.jsp"></c:import>