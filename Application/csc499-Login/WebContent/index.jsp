<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp">
<c:param name="title" value="Index"/>
</c:import>

<jsp:include page="header.jsp"></jsp:include>


<center>
<h1>Welcome!</h1>
<h3>
	<a href="${pageContext.request.contextPath}/operation?page=register">Register</a><br><br>
	<a href="${pageContext.request.contextPath}/operation?page=login">Log In</a><br><br>
	<a href="${pageContext.request.contextPath}/test?action=listUsers">Test Page</a><br><br>
</h3>
</center>

<c:import url="footer.jsp"></c:import>