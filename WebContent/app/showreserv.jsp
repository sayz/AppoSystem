<%@page import="db.AppDAO.Appointment"%>
<%@page import="java.util.List" %>
<%@page import="db.UserDAO" %>
<%@page import="servlets.UserServlet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//List<UserDAO.User> users = new UserDAO().selectAppUsers();
//request.setAttribute("users", users);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="tr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Randevu Listele</title>
        
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

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="home.jsp">E-Appointment</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
             <li><a href="home.jsp">Home</a></li>
             <li><a class="active" href="showreserv.jsp">Appointments</a></li>
            <li><a href="logout">Logout</a></li>
            </ul>
	        <p class="navbar-text pull-right">
        	Logged in as <a href="#" class="navbar-link">${user.username}</a>
            </p>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->
<div class="hero-unit">
      
<table class="table">
              <thead>
                <tr>
                  <th> </th>
                  <th>Full Name</th>
                  <th>Appointment Date</th>
                  <th>Appointment Hour</th>
                </tr>
              </thead>
              <tbody>
<c:choose>

<c:when test="${usertype == 0}">
<form action="addappo.jsp">	
		<button type="submit" class="btn btn-success" rel="tooltip" title="first tooltip">Sil</button>
            <%-- <c:forEach items="${users}" var="user"> --%>
            <c:forEach items="${users}" var="appo">
            <tr>
            	<td><input type="checkbox" name="${appo.username}" ></td>
  				<td>${appo.fullname}</td>
  				<td>${appo.date}</td>
  				<td>${appo.hour}</td>
  			</tr>  	
  			</c:forEach>

</form>

</c:when >

<c:when test="${usertype == 2}">
			<tr>
				<td> </td>
				<td>${user.fullname}</td>
  				<td>${user.appodate}</td>
  				<td>${user.appotime}</td>
  			</tr>
</c:when>

</c:choose>
            </tbody>
	</table>
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
