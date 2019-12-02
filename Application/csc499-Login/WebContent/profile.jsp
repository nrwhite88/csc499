<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="org.bandtracker.hibernate.entity.Booking" %>
<%@ page import="org.bandtracker.hibernate.dao.UserDAO" %>
<%@ page import="java.util.List" %>
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

<% User user = (User)request.getAttribute("user"); 
%>

<div class="container mb">
<h1><%= user.getPublicName() %></h1>
<h3>A <%= user.getUserType() %> from <%= user.getTown() %></h2><br/>
<h4>Bio:</h4>
<p><%= user.getBio() %></p>
<h4>Contact:</h4>
<p>Email: <%= user.getEmail() %><br/>Phone: <%= user.getPhone() %></p>
<p>Address:<br/><%= user.getStreetAddress() %><br/><%= user.getTown()%><br/><%= user.getZipCode() %></p>
<br/><br/>

<jsp:include page="displayUserShows.jsp"></jsp:include>

</div>

<br>

<c:import url="footer.jsp"></c:import>