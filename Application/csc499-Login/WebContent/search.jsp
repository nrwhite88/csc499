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

<center>
<h1>Search</h1><br/>

<form action="${pageContext.request.contextPath}/operation" method="post">
Enter search:<br/><input type="text" name="username" required><br/>
<input type="hidden" name="form" value="searchOperation"><br>
<input type="submit" value="Submit">
<br><br>
</form>

<% 
List<User> results = (List)request.getAttribute("results");
if(results != null) {
	if(results.isEmpty()) {
		out.println("<h3>No results.</h3>");
	}
	else { %>
		<jsp:include page='searchResults.jsp'></jsp:include>
		<%
	}
}
%>

<br><br>

</center>

<c:import url="footer.jsp"></c:import>