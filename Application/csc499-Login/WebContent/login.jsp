<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp">
<c:param name="title" value="Index"/>
</c:import>

<jsp:include page="header.jsp"></jsp:include>

<center>
<h1>Log In</h1>

<form action="${pageContext.request.contextPath}/login" method="post">
Username:<br/>
<input type="text" name="username" required><br/>
Password:<br/>
<input type="password" name="password" required><br/>
<input type="hidden" name="form" value="Login"><br>
<input type="submit" value="Submit">
<br><br><br>
</form>
</center>

<c:import url="footer.jsp"></c:import>