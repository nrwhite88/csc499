<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.bandtracker.hibernate.entity.User" %>
<%@ page import="org.bandtracker.hibernate.entity.Show" %>
<%@ page import="org.bandtracker.hibernate.entity.Booking" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<style>
body {
   padding-top: 75px;
}
td
{
    padding:0 15px 0 15px;
}
</style>
  <meta charset="utf-8">
  <title>BandTracker</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
  
  <title>${param.title}</title>

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,700,900|Lato:400,900" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="assets/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="assets/lib/prettyphoto/css/prettyphoto.css" rel="stylesheet">
  <link href="assets/lib/hover/hoverex-all.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
    Template Name: Solid
    Template URL: https://templatemag.com/solid-bootstrap-business-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  <!--
  You are NOT allowed to delete the credit link to TemplateMag with free version.
  You can delete the credit link only if you bought the pro version.
  Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/solid-bootstrap-business-template/
  Licensing information: https://templatemag.com/license/
  -->
  
 <!--
    <style>
        div.container {
            border: 1px solid red;
        }
        div.col-lg-8 {
        	border: 1px solid blue;
        }
        div.col-lg-4 {
        	border: 1px solid blue;
        }
    </style>
-->
  
</head>

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

<body>

  <!-- Fixed navbar -->
  <div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        <a class="navbar-brand" href="index.jsp">BandTracker</a>
      </div>
      <div class="navbar-collapse collapse navbar-right">
        <ul class="nav navbar-nav">
          <li><a href="<%= request.getContextPath()%>/operation?page=goHome&userId=${userId}&userype=${userType}">HOME</a></li>
          <li><a href="<%= request.getContextPath()%>/operation?page=goHome&userId=${userId}&userType=${userType}">HOME</a></li>
          <li><a href="myCalendar.jsp">CALENDAR</a></li>
          <li><a href="myBooking.jsp">BOOKING</a></li>
          <li><a href="<%= request.getContextPath()%>/operation?page=upcomingShows">UPCOMING SHOWS</a></li>
          <li><a href="<%= request.getContextPath()%>/operation?page=addShow&bar_id=${userId}">HOST A SHOW</a></li>
          <li><a href="search.jsp">SEARCH</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">ETC<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="editProfile.jsp">MY PROFILE</a></li>
              <li><a href="about.jsp">ABOUT</a></li>
              <li><a href="myMessages.jsp">MESSAGES</a></li>
              <li><a href="myReviews.jsp">REVIEWS</a></li>
              <li><a href="myHistory.jsp">SHOW HISTORY</a></li>
              <li><a href="<%= request.getContextPath()%>/site?action=destroy">LOGOUT</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>
  </div>
