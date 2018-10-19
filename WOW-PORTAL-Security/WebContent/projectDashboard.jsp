<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Project Dashboard</title> 
 <link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon" /> 
<link rel="stylesheet" href="styles/animations.css">
<link href="styles/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="styles/skeleton.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="styles/Home.css">
<link rel="stylesheet" href="styles/metisMenu.min.css">
<link rel="stylesheet" href="styles/sideBar.css">

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.scrollify.js"></script>
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<script>
$(document).ready(function(){
		$("#menu").metisMenu();
		
$('.homeMenu .container .col-md-8 .centeredMenu li:nth-child(1)').removeClass("active");
// $('.homeMenu .container .col-md-8 .centeredMenu li:nth-child(3) .dropdown-toggle').focus();
$('.homeMenu .container .col-md-8 .centeredMenu li:nth-child(3)').addClass("active");
	
if($('.headerSection').length!=0)
{
	var header=$('.headerSection').height();
	var menu=$('.homeMenu').height();
	var footer=$('.footerSection').height();
	var windowHeight=$(window).height();
	var reportArea=windowHeight-header-menu-footer-1;
	$('.reportArea').css('height',reportArea);
	
$(window).resize(function(){
	if($('.headerSection').length!=0){
	var header=$('.headerSection').height();
	var menu=$('.homeMenu').height();
	var footer=$('.footerSection').height();
	var windowHeight=$(window).height();
	var reportArea=windowHeight-header-menu-footer-1;
	$('.reportArea').css('height',reportArea);
	}
});
}

});
</script>
<style>
body{
overflow:hidden;
}
</style>
</head>
<body>
<div  class="container-fluid">
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
	<div class="workArea container-fluid">
	<div class="col-md-2 sideBarArea">
		<div class="sideBar"> 
			<nav class="dashBoardMenu">
				<%@include file="dashBoardMenu.jsp" %>
			</nav>
		</div>
	</div>
	<div class="col-md-10">
		<div class="reportArea">
			<div class="pageName">
				<label>PROJECT DASHBOARD</label>
			</div>
			<div class="breadCrums">
				<ul class="breadcrumb">
   					 <li><a href="#">HOME</a></li>
   					 <li><a href="#">DASHBOARD</a></li>
    				<li class="active"><a href="dailyStatusReportOverall.do">PROJECT DASHBOARD</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	</div>
	
	<section class="footerSection">
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
	</section>
</div>
</body>
<script src='js/css3-animate-it.js'></script>
</html>
