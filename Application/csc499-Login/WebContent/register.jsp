<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="org.bandtracker.entity.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>

<h1>Please Register</h1>
<form action="${pageContext.request.contextPath}/operation" method="post">
	Username: 	<input type="text" name="username" required="required"/><font color="red">*</font><br/>
	Password: 	<input type="password" name="password" required="required"/><font color="red">*</font><br/>
	I am a: 	<input type="radio" name="usertype" value="bar" checked="checked"> Bar
				<input type="radio" name="usertype" value="band"> Band
				<input type="radio" name="usertype" value="fan"> Fan </br>
	First name:	<input type="text" name="firstname"/><br/>
	Last name:	<input type="text" name="lastname"/><br/>
	Public name:<input type="text" name="publicname" required="required"/><font color="red">*</font><br/>
	Address:	<input type="text" name="streetaddress"/><br/>
	Town:		<input type="text" name="town"/><br/>
	Zip code:	<input type="text" name="zipcode" required="required"/><font color="red">*</font><br/>
	Email:		<input type="text" name="email" required="required"/><font color="red">*</font><br/>
	Phone:		<input type="text" name="phone" required="required"/><font color="red">*</font><br/>
<br/>
<font color="red">* = Required field</font><br/><br/>
<input type="hidden" name="form" value="registerOperation">
<input type="submit" value="Sign Me Up!">
</form>

</body>
</html>
