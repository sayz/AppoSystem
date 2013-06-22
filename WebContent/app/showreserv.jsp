<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
             <li class="active"><a href="ShowAppointments">Appointments</a></li>
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
      
<table class="table table-hover table-bordered">
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
		<p><button type="submit" class="btn btn-danger btn-small" rel="tooltip" title="Seçilenleri sil">
		<i class="icon-trash icon-white"></i>
		Del
		</button></p>
            <c:forEach items="${users}" var="appo">
            <tr class="info">
            	<td><input type="checkbox" name="${appo.id}" ></td>
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
  				<td>${ufname}</td>
  				<td>${uappo.date}</td>
  				<td>${uappo.hour}</td>
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
