<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="java.util.List" %>
 
<%
List<User> userList = (List)request.getAttribute("userList");
String user_type = request.getAttribute("user_type").toString();

		out.print(
		"<div class='container mtb'>" +
			"<div class='row'>" +
				"<div class='col-lg-6'>" +
					"<strong>Available shows:</strong>" +
						"<hr/>" +
							"<table>" +
								"<thead>" +
									"<th>SHOW ID</th>" +
									"<th>START</th>" +
									"<th>END</th>" +
								"</thead>");

					List<Show> showList = (List)request.getAttribute("shows");
					int booker_id = Integer.parseInt(request.getParameter("booker"));
					int show_id;
					for(int i=0; i<showList.size(); i++) {
						show_id = showList.get(i).getShowId();
						out.print("<tr>");
						out.print("<td>" + show_id + "</td>");
						out.print("<td>" + showList.get(i).getStartDatetime() + "</td>");
						out.print("<td>" + showList.get(i).getEndDatetime() + "</td>");
						out.print("<td>"
								+ "<input type='radio' name='show_id' value='" + show_id + "'>"
								+ "<input type='hidden' name='booker_id' value='" + booker_id + "'>"
								+ "<input type='hidden' name='bookee_id' value='" + request.getParameter("bookee") + "'>"
								+ "</td>");
					}
					
		out.print(					
					"</table>" +
				"</div>" +
			"</div>" +
		"</div>"
				);

%>
<br>

<c:import url="footer.jsp"></c:import>