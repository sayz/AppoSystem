<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="db.UserDAO" %>
<%@page import="db.AppDAO" %>
<%@page import="servlets.UserServlet" %>
<%@page import="java.util.List" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="tr">
  <head>
    <meta charset="utf-8">
    <title>Randevu Ekleme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
  </head>
  
<body>


<% /*
String uname, adate, atime;
int uid;

uid = Integer.parseInt(request.getParameter("uid"));
uname = request.getParameter("uname");
adate = request.getParameter("datetime").substring(0, 10);
atime = request.getParameter("datetime").substring(11);*/
%>



<%
//AppDAO.Appointment appointment = new AppDAO().getUserAppointments(uid);
//List <AppDAO.Appointment> appointments = new AppDAO().getAllUserAppointments(uid);
//request.setAttribute("appointments", appointments);

//List <UserDAO.User> users = new UserDAO().selectAppUsers();

//request.setAttribute("users", users);
%>

<%
//new AppDAO().createAppointment(uid, adate, atime, 0);
%>
<%
//new UserDAO().upUser(uname, adate, atime);
%>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">E-Appointment</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><a href="home.jsp">Home</a></li>
              <li><a href="#about">Dentist</a></li>
              <li><a href="#contact">Contact</a></li>
              <li><a href="logout">Logout</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">
      <div class="hero-unit">
        <h2>Your appointment has been ok!</h2>
        <h4>Your appointment:</h4>

<%--         <c:forEach items="${appointments}" var="appo">
        <p>servlet ile date: ${appo.date}</p>  
        <p>servlet ile hour: ${appo.hour}</p>
        </c:forEach> --%>
        <p>date: ${appointment.date}</p>
        <p>hour: ${appointment.hour}</p>
      </div>
      </div>
      <hr>
      <footer>
        <p>&copy; OMÜ 2013</p>
      </footer>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script>
  </body>
</html>