<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking</title>
</head>
<body>

<%
String bar_id = request.getParameter("bar_id").toString();
%>

<h1>Enter booking details:</h1>
<form action="${pageContext.request.contextPath}/operation" method="post">
	Start Datetime:<input type="text" name="start_datetime" required="required"/><br/>
	End Datetime: <input type="text" name="end_datetime" required="required"/><br/>
<br/>
<input type="hidden" name="bar_id" value="${bar_id}">
<input type="hidden" name="form" value="addShowOperation">
<input type="submit" value="Create Show">
</form>

</body>
</html>
