<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
</head>
<body>

Welcome home!
<a href="<%=request.getContextPath() %>/Controller?page=Login">Login</a>
<a href="<%=request.getContextPath() %>/Controller?page=Signup">Signup</a>
<a href="<%=request.getContextPath() %>/Controller?page=About">About</a>

</body>
</html>