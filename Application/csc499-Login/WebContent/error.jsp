<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp">
<c:param name="title" value="Index"/>
</c:import>

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
%>

<jsp:include page="header.jsp"></jsp:include>

<center>
<h1>Ya don goofed</h1>
</center>

<form action="${pageContext.request.contextPath}/operation?" method="get">
<input type="hidden" name="userId" value=<%= userId %>>
<input type="hidden" name="userType" value=<%= userType %>>
<input type='hidden' name='page' value='goHome'>
<input type="submit" value="Go Home"></form>

<c:import url="footer.jsp"></c:import>