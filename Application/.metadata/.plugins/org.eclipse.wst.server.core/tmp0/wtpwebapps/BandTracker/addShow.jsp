<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp">
<c:param name="title" value="Index"/>
</c:import>

<jsp:include page="header.jsp"></jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Host a Show</title>
</head>
<body>
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
String bar_id = request.getParameter("bar_id");
%>

<center>
<h1>Enter show details:</h1>
<form action="${pageContext.request.contextPath}/operation" method="post">
	Start Datetime:<br/><input type="text" name="start_datetime" required="required"/><br/><br/>
	End Datetime: <br/><input type="text" name="end_datetime" required="required"/><br/><br/>
	Show name: <br/><input type="text" name="show_name" required="required"/><br/><br/>
	Description: <br/><textarea rows="4" cols="50" name="show_description" maxlength="500"/></textarea><br/>
<br/>
<input type="hidden" name="bar_id" value=<% out.println(bar_id); %>>
<input type="hidden" name="userId" value=<%= userId %>>
<input type="hidden" name="userType" value=<%= userType %>>
<input type="hidden" name="form" value="addShowOperation">
<input type="submit" value="Create Show">
</form>
</center>
<br><br>
<c:import url="footer.jsp"></c:import>