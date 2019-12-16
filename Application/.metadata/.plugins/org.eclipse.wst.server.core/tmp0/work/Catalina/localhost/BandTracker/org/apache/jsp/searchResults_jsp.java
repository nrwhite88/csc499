/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.27
 * Generated at: 2019-12-16 03:53:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.bandtracker.hibernate.entity.User;
import org.bandtracker.hibernate.entity.Show;
import org.bandtracker.hibernate.entity.Booking;
import org.bandtracker.hibernate.dao.UserDAO;
import java.util.List;

public final class searchResults_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1575875552000L));
    _jspx_dependants.put("jar:file:/Users/nicholaswhite/Documents/GitHub/csc499/Application/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BandTracker/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153399482000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("org.bandtracker.hibernate.entity.Show");
    _jspx_imports_classes.add("org.bandtracker.hibernate.entity.User");
    _jspx_imports_classes.add("org.bandtracker.hibernate.entity.Booking");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("org.bandtracker.hibernate.dao.UserDAO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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

      out.write('\n');
      out.write('\n');

List<User> results = (List)request.getAttribute("results");
String myId = userId;

      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container mb\">\n");
      out.write("\t\t\t<h3>Here are some results:</h3>\n");
      out.write("\t\t\t<hr/>\n");
      out.write("\t\t\t<table>\n");
      out.write("\t\t\t\t<thead>\n");
      out.write("\t\t\t\t\t<th>Name</th>\n");
      out.write("\t\t\t\t\t<th>Is A</th>\n");
      out.write("\t\t\t\t\t<th>From</th>\n");
      out.write("\t\t\t\t\t<th>Zip Code</th>\n");
      out.write("\t\t\t\t\t<th>Website</th>\n");
      out.write("\t\t\t\t\t</thead>\n");
      out.write("\t\t\t\t\t");

					for(User user : results) {
						out.print("<tr class='bordered'>");
						out.print("<td>" + user.getPublicName() + "</td>");
						out.print("<td>" + user.getUserType() + "</td>");
						out.print("<td>" + user.getTown() + "</td>");
						out.print("<td>" + user.getZipCode() + "</td>");
						out.print("<td>" + user.getWebsiteURL() + "</td>");
						out.print("<td><form action='" + request.getContextPath() + "/operation?"
								+ "&user_id=" + myId + "' method='get'>"
								+ "<input type='submit' value='VIEW PROFILE'>"
								+ "<input type='hidden' name='page' value='profile'>"
								+ "<input type='hidden' name='booker' value='" + myId + "'>"
								+ "<input type='hidden' name='bookee' value='" + user.getUserId() + "'>"
								+ "</form></td>");
						out.print("</tr>");
						}
					
      out.write("\n");
      out.write("\t\t\t</table>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<br>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
