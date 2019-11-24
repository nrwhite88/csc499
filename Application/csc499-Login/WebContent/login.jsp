<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.bandtracker.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<h1>Log In</h1>

<form action="${pageContext.request.contextPath}/operation" method="post">
Username: <input type="text" name="username" required><br/>
Password: <input type="password" name="password" required><br/>
<input type="hidden" name="form" value="loginOperation">
<input type="submit" value="Submit">
</form>

</body>
</html>