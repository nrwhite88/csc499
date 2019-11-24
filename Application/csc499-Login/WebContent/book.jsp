<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="org.bandtracker.entity.Booking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking</title>
</head>
<body>

<%
String booker = request.getParameter("booker").toString();
String bookee = request.getParameter("bookee").toString();
%>

<h1>Enter booking details:</h1>
<form action="${pageContext.request.contextPath}/operation" method="post">
	Datetime:<input type="text" name="datetime" required="required"/><br/>
	Duration: <input type="text" name="duration" required="required"/><br/>
<br/>
<input type="hidden" name="booker" value="${booker}">
<input type="hidden" name="bookee" value="${bookee}">
<input type="hidden" name="form" value="bookOperation">
<input type="submit" value="Send Request">
</form>

</body>
</html>
