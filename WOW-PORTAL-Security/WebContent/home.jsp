<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WOW - QA Portal</title> 
<link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="styles/animations.css">
<link href="styles/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="styles/skeleton.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="styles/flexslider.css">
<link rel="stylesheet" href="styles/Home.css">



<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.scrollify.js"></script>
<script src="js/custom.js"></script>



<script>
$(document).ready(function(){
	$(".flexslider").flexslider({
		direction: "vertical",
		slideshowSpeed: 7000,          
		animationSpeed: 3000,
// 		pausePlay: true, 
	});
	 /*  $.scrollify({
		section : "section",
		sectionName: "section-name",
		easing: "easeOutExpo",
		scrollSpeed: 10,
		offset : 0,
		scrollbars: true,
		axis:"y",
		target:"html,body",
		before:function() {},
		after:function() {}
		});  */

		
});
</script>
</head>
<body>
<div  class="container-fluid">
<section>
	<header>
		<%@include file="header.jsp"%>
	</header>
	</section>
	<section>
	<nav class="homeMenu header">
		<%@include file="homeMenu.jsp" %>
	</nav>
	</section>
	<section>
	<div class="slideDiv">
	<div class="flexslider">
	  <ul class="slides">
	   <li>
			<!-- <p>
				To be a value member of SDA which promotes product quality through well-defined measurable
				 process and practices of which, measurement will feed continuous process improvement
			</p> -->
		   <!-- 	<table style="width:100%">
  				<tr style="height:20%;">
   					<td><img class="firstSlideTopImage" src="images/slider/parapet-vision.png" /></td>
  				</tr>
  				<tr>
 					<td><img class="firstSlideBottomImage" src="images/slider/HomepageSlide2.png" /></td>		
				</tr>
			</table> -->
			<div>
			<img class="firstSlideTopImage" src="images/slider/parapet-vision.png" />
			<div>
			
			<img class="firstSlideBottomImage" src="images/slider/HomepageSlide2.png" />
			<h2 class="homeFirstText">
			To be a value member of SDA which promotes product quality <br> through well-defined measurable
				 process and practices of <br> which, measurement will feed continuous process improvement
			</h2>
			</div>
			</div>
	 </li>
	    <li>
				<!-- <p>
					To be a value member of SDA which promotes product quality through well-defined measurable
						 process and practices of which, measurement will feed continuous process improvement
			  </p> -->
			<!--   <div class="captionImage">
			  	<img src="images/slider/Home Slide Vision.png" />
			  </div> -->
			 <table style="width:100%">
  <tr>
    <td><img class="leftTopImage" src="images/slider/digital-map-full.png" /> <h1 class="homeText">SOLUTIONS</h1> </td>
     <td colspan='2'><img class="rightTopImage" src="images/slider/Mobility_banner.png" /></td>
  </tr>
  <tr>
  <td><img class="bottomImage" src="images/slider/digital_marketing_icon.png" /></td>		
   
  </tr>
 
</table>
			   <!-- <img src="images/slider/Home Slide1.png" /> -->
			   <div class="container-fluid">
			   <div class="animatedParent">
			   	<!--  <button type="button" class="btn btn-warning animated fadeInRight">OUR SERVICES</button> -->
			   	 </div>
			   </div>
	    </li>
	   
	  </ul>
	</div>
	</div>
	</section>
	<div class="content">
	<section>
	<div class="thumb-box">
		<div class="container">
			<div class="animatedParent">
			<strong class="animated growIn slowest">WELCOME TO WOOLWORTHS QA PORTAL!</strong>
			<p class="animated fadeInLeft">Reducing risk, ensuring quality</p>
			</div>
		</div>
	</div>
	</section>
	<section>
	<div class="servicesBox">
		<div class="container ">
			<h2>WHATS COOKING</h2>
				<div class="animatedParent">
				<div class="col-md-3 animated fadeInLeft slowest">
					<div class="thumbNails">
						<figure>
							<img src="images/icons/Our Services Icon 1.png" class="heading1Image"></img>
						</figure>
						<div class="servicesCaption">
							<a href="#">NON PROD <br> SERVICES</a>
							<p>Dedicated team to address any <br> issues with test environment <br> availability & 
							usability and to <br> manage Master data requests
							</p>
						</div>
					</div>
				</div>
				</div>
				<div class="animatedParent">
				<div class="col-md-3 animated fadeInDown slowest">
					<div class="thumbNails">
						<figure>
							<img src="images/icons/Our Services Icon 2.png" class="heading2Image"></img>
						</figure>
						<div class="servicesCaption">
							<a href="#">PERFORMANCE<br> ENGINEERING</a>
							<p>Performance testing is not enough. Adding new skills to the existing team so along with testing,
							 tuning recommendations also delivered
							</p>
						</div>
						
					</div>
				</div>
				</div>
				<div class="animatedParent">
				<div class="col-md-3 animated fadeInRight slowest">
					<div class="thumbNails">
						<figure>
							<img src="images/icons/Our Services Icon 3.png" class="heading3Image"></img>
						</figure>
						<div class="servicesCaption">
							<a href="#">DIGITAL <br> SERVICES</a>
							<p> Mobility solution for <br> Manual, Automation, <br> Performance &  <br> Device Management
							</p>
						</div>
					</div>
				</div>
				</div>
		</div>
	</div>
	</section>
	</div>
	<section>
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
	</section>
</div>
</body>
<script src='js/css3-animate-it.js'></script>
</html>