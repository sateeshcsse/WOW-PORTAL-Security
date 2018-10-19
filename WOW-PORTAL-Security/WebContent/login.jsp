<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Status Defaults Report</title> 
 <link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="styles/animations.css">
<link href="styles/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="styles/skeleton.css" rel="stylesheet" type="text/css" />
<link href="styles/jqueryUI.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="styles/Home.css">
<link rel="stylesheet" href="styles/metisMenu.min.css">
<link rel="stylesheet" href="styles/sideBar.css">
<link rel="stylesheet" href="styles/reportArea.css">
<link rel="stylesheet" href="styles/dataTables.bootstrap.css">
 <link rel="stylesheet" href="styles/angular-material.min.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
});



</script>
<style>
.reportJpg {
	    position: absolute;
    width: 27px;
    left: 5px;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 40%;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: white;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 8px;
  box-sizing: border-box;
  font-size: 14px;
  border: 2px solid #f2f2f2
}
.form button {
  /* font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  width: 100%;
  background-color: #f2f2f2;
  border: 0;
  padding: 15px;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer; */
}
.form button:hover,.form button:active,.form button:focus {
  /* background: #8AC759; */
}
#userNameImage {
	background: url(images/icons/userName.png) no-repeat scroll 1px 1px;
   background-size: 20px;
    background-position-y: 8px;
    background-position-x: 8px;
    padding-left: 51px;
}
#pwdImage {
	background: url(images/icons/pwd.png) no-repeat scroll 1px 1px;
	background-size: 20px;
    background-position-y: 8px;
    background-position-x: 8px;
    padding-left: 51px;
}
.submitBtn {
    margin-left: 0px !important;
}
.pageName label {
	margin-top: 2%;
}
</style>
</head>

<body >
<div class="container-fluid">
<div id="header">
	<section>
		<header class="headerSection">
			<%@include file="header.jsp"%>
		</header>
	</section>
	<section>
	<nav class="homeMenu header">
		<%@include file="homeMenu.jsp" %>
	</nav>
	</section>
</div>
<div id="content">
	<form name="DailyStatusReport" action="${ loginVar}" id="DailyStatusReport" method="post">
	<div class="workArea container-fluid">

		<!-- </div>should close div here -->
				<div class="generationArea" id="generationArea">
				<div class="pageName">
                        <div class="col-sm-12" style="letter-spacing: 2px;"> <label> AUTHORISATION </label> </div>
                        </div>
                        
						<div class="login-page" style="margin-top:5%;">
  <div class="form" style="background-color: white;">
  <c:url  value="/login.do" var="loginVar"></c:url>
    <form class="login-form" action="${ loginVar}" role="form" class="login-form">
    <div>
									              <c:if test="${param.logout != null }">
												<p style="text-align: center; margin-bottom: 5%; color: red;">* You have successfully been logged out.</p>
											</c:if>

													<c:if test="${param.error != null }">
														<p style="text-align: center; margin-bottom: 5%; color: red;">* Invalid Username and Password.</p>
													</c:if>
									
      <input type="text" name="custom_username" placeholder="WOW eMail ID" value="@woolworths.com.au" id="userNameImage" autofocus/>
      <input type="password" name="custom_password" placeholder="password" id="pwdImage"/>
    <!--   <input type="submit" name="login-submit" id="login-submit" tabindex="4" class=" pull-left form-control btn btn-login" value="Log In"> -->
       <input type="submit" value="SUBMIT" style="background-color: #8AC759; width: 20%;" class="btn btn-primary submitBtn pull-right"/>
      
       <!-- <a href="#" class="pull-right" style="color: #484848;">Forgot Password? </a> -->
      </div>
    </form>
  </div>
</div>						
				</div>

		</div>
	
	
	</form>
	</div>
	<div id="DSRfooter">
	<section class="footerSection" id="footer">
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
	</section>
	<div class="hiddenDiv"></div>
	</div>
	</div>
</body>
<script src='js/css3-animate-it.js'></script>
</html>
