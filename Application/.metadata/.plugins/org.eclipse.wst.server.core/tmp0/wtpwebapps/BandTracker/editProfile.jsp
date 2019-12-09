<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp">
<c:param name="title" value="Index"/>
</c:import>

<jsp:include page="header.jsp"></jsp:include>

<center>
<h1>Edit Profile</h1>
<form action="${pageContext.request.contextPath}/operation" method="post">
	Username: 	<input type="text" name="username" required="required"/></font><br/>
	Password: 	<input type="password" name="password" required="required"/></font><br/>
	I am a: 	<input type="radio" name="usertype" value="bar" checked="checked"> Bar
				<input type="radio" name="usertype" value="band"> Band
				<input type="radio" name="usertype" value="fan"> Fan </br>
	First name:	<input type="text" name="firstname"/><br/>
	Last name:	<input type="text" name="lastname"/><br/>
	Public name:<input type="text" name="publicname" required="required"/></font><br/>
	Address:	<input type="text" name="streetaddress"/><br/>
	Town:		<input type="text" name="town"/><br/>
	Zip code:	<input type="text" name="zipcode" required="required"/></font><br/>
	Email:		<input type="text" name="email" required="required"/></font><br/>
	Phone:		<input type="text" name="phone" required="required"/></font><br/>
<br/>
<input type="hidden" name="form" value="editProfileOperation">
<input type="submit" value="Submit Changes">
</form>
<br/>
</center>

<c:import url="footer.jsp"></c:import>
