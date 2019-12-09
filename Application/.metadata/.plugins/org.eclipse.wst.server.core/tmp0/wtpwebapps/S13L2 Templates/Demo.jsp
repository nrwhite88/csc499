<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="header.jsp">
<c:param name="title" value="Demo Page"/>
</c:import>

<jsp:include page="header.jsp"></jsp:include>
<div class="container mtb">
	<div class="row">
		<div class="col-lg-6">
<h1>Hello world!</h1>
		</div>
	</div>
</div>
<c:import url="footer.jsp"></c:import>