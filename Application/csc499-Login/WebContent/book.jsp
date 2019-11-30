<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="org.bandtracker.hibernate.entity.Booking" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp">
<c:param name="title" value="Index"/>
</c:import>

<jsp:include page="header.jsp"></jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking</title>
</head>
<body>

<center>

<h1>Book a Show</h1>
<br>
<h2>Enter booking details:</h2>
<form action="${pageContext.request.contextPath}/operation" method="post">
	Datetime:<input type="text" name="datetime" required="required"/><br/>
	Duration: <input type="text" name="duration" required="required"/><br/>
<h2>Select show:</h2>
<jsp:include page="displayUserShows.jsp"></jsp:include>
<input type="hidden" name="form" value="bookOperation">
<input type="submit" value="Send Request">
</form>
</center>
<br>
<c:import url="footer.jsp"></c:import>