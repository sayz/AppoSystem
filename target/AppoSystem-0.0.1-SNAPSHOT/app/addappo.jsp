<%-- 
    Document   : users
    Created on : June 11, 2013, 12:55:04 PM
    Author     : sayz
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="db.UserDAO" %>
<%@page import="servlets.UserServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  
  <html lang="tr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Randevu Ekle</title>
        
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
     
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
          <a class="brand" href="home.jsp">E-randevu</a>
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
<c:if test="${user.usertype == 2}">
<div class="container">

<div class="well">    
      <form class="form-horizontal" method="post" action="regappo.jsp">
		<legend>Add Appointment</legend>		
		<div class="control-group">
	        <label class="control-label">Username</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-user"></i></span>
					<input type="text" class="input-xlarge" id="fname" name="uname" placeholder="Username">
				</div>
			</div>
		</div>

		<div class="control-group ">
	        <label class="control-label">Appointment Date</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-calendar"></i></span>

	 <div id="datetimepicker" class="input-append date">
      <input type="text" class="input-xlarge" name="datetime"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
    </div>
    <script type="text/javascript"
     src="../js/jquery-1.9.1.min.js">
    </script> 

    <script type="text/javascript"
     src="../assets/js/bootstrap-datetimepicker.min.js">
    </script>
     <script type="text/javascript"
     src="../assets/js/bootstrap.min.js">
    </script>
	 <script type="text/javascript"
     src="../assets/js/bootstrap-datetimepicker.js">
    </script>

    <script type="text/javascript">
      $('#datetimepicker').datetimepicker({
        format: 'dd/MM/yyyy hh:mm',
      });
    </script>
				</div>
			</div>
		</div>
		
		<div class="control-group">
		<label class="control-label" for="input01"></label>
	      <div class="controls">
	       <button type="submit" class="btn btn-success" rel="tooltip" title="first tooltip">Create My Appointment</button>
	       
	      </div>
	
	</div>
	
	  </form>

   </div>
</div>

    <!-- Javascript placed at the end of the file to make the  page load faster -->
    <script src="http://twitter.github.com/bootstrap/assets/js/jquery.js"></script>
    
    <script src="..\assets\js\bootstrap-button.js"></script>
	<script type="text/javascript" src="jquery.validate.js"></script>
	  <script type="text/javascript">
	  $(document).ready(function(){
			
			$("#signup").validate({
				rules:{
					fname:"required",
					lname:"required",
					email:{
							required:true,
							email: true
						},
					passwd:{
						required:true,
						minlength: 8
					},
					conpasswd:{
						required:true,
						equalTo: "#passwd"
					},
					gender:"required"
				},
				
				errorClass: "help-inline"
				
			});
		});
	  </script>
</c:if>

<c:if test="${user.usertype == 0}">

        <% 
        UserDAO a = new UserDAO();
        java.util.Enumeration names = request.getParameterNames();
        while(names.hasMoreElements()){
			a.upUser(names.nextElement().toString(), "","");
        }
        out.println("seçtiğiniz kullanıcılarının randevuları silinmiştir.");
        %>

</c:if>
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