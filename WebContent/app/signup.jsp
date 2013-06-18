<%-- 
    Document   : users
    Created on : June 11, 2013, 12:55:04 PM
    Author     : sayz
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
  <html lang="tr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
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
          <a class="brand" href="#">E-Appointment</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li ><a href="/AppoSystem/index.jsp">Home</a></li>
              <li><a href="#about">Dentists</a></li>
              <li><a href="#contact">Contact</a></li>
              <li class="active"><a href="signup.jsp">Register</a></li>
            </ul>
	        <form name="form" class="navbar-form pull-right" id="loginForm" action="LoginServlet" method="post">
              <input class="span2" type="text" placeholder="Username" name=username>
              <input class="span2" type="password" placeholder="Password" name="password">
              <button type="submit" class="btn" value="login">Sign In</button>
              <div><c:out value="${requestScope.errorMessage}"/></div>
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

<div class="container">

<div class="well">    
      <form id="signup" class="form-horizontal" method="post" action="reg.jsp">
		<legend>Sign Up</legend>		
		<div class="control-group ">
	        <label class="control-label">User Name</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-user"></i></span>
					<input type="text" class="input-xlarge" id="name" name="uname" placeholder="User Name">
				</div>
			</div>
		</div>
		<div class="control-group ">
	        <label class="control-label">Full Name</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-user"></i></span>
					<input type="text" class="input-xlarge" id="lname" name="fname" placeholder="Full Name">
				</div>
			</div>
		</div>
		<div class="control-group">
	        <label class="control-label">Password</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-lock"></i></span>
					<input type="Password" id="passwd" class="input-xlarge" name="passwd" placeholder="Password">
				</div>
			</div>
		</div>
		<div class="control-group">
	        <label class="control-label">Confirm Password</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-lock"></i></span>
					<input type="Password" id="conpasswd" class="input-xlarge" name="conpasswd" placeholder="Re-enter Password">
				</div>
			</div>
		</div>		
		<div class="control-group">
		<label class="control-label" for="input01"></label>
	      <div class="controls">
	       <button type="submit" class="btn btn-success" rel="tooltip" title="first tooltip">Create My Account</button>
	       
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
					uname: "required",
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

<!-- Validate plugin -->
		<script src="../assets/js/jquery.validate.min.js"></script>

<!-- Prettify plugin -->
		<script src="../assets/js/prettify/prettify.js"></script>

<!-- Scripts specific to this page -->
		<script src="../assets/js/script.js"></script>
  </body>
</html>