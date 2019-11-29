<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<h1>Welcome!</h1>

<a href="${pageContext.request.contextPath}/operation?page=register">Register</a><br><br>
<a href="${pageContext.request.contextPath}/operation?page=login">Log In</a><br><br>
<a href="${pageContext.request.contextPath}/site?action=listUsers">List Users</a><br><br>

</body>
</html>