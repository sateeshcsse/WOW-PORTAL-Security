<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COQ Trend chart</title> 
 <link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="styles/animations.css">
<link href="styles/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="styles/keen_dashboards.css" rel="stylesheet" type="text/css" />
<link href="styles/skeleton.css" rel="stylesheet" type="text/css" />
<link href="styles/jqueryUI.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="styles/Home.css">
<link rel="stylesheet" href="styles/metisMenu.min.css">
<link rel="stylesheet" href="styles/sideBar.css">
<link rel="stylesheet" href="styles/reportArea.css">
<link rel="stylesheet" href="styles/dataTables.bootstrap.css">
<link rel="stylesheet" href="styles/angular-material.min.css">
<link rel="stylesheet" href="js/toastr.css">
<link rel="stylesheet" href="styles/angular.chart.css">

<!-- <link rel="stylesheet" href="styles/jqx.light.css"> -->
<link rel="stylesheet" href="styles/jqx.base.css">
<link rel="stylesheet" href="styles/jqGauge.css">
<link rel="stylesheet" href="styles/barchart.css">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet">

<script src="js/jquery-1.11.3.min.js"></script>
<!-- <script scr="js/jquery-2.2.0.js"> </script> -->
<!-- <script src="js/jquery-ui.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<!-- <script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/chart.js" type="text/javascript"> </script>
<script src="js/angularChart.js" type="text/javascript"> </script> -->
<script src = "js/barchart.jquery.js"> </script>

<script> 
$(document).ready(function(){

	$('#chart').barChart({
		height: 500,
		  bars : [
		    {
		      name : 'COQ',
		      values : [["June",40],["May",30],["April",15],["March",75],["Feb",129],["Jan",20]]
		    },{
		      name : 'COT',
		      values : [["June",10],["May",20],["April",19],["March",50],["Feb",10],["Jan",30]]
		    }
		  ],
	hiddenBars : [],
	  milestones : [],
	  colors : [
	    "#f44336", "#e91e63", "#9c27b0", "#673ab7", "#3f51b5",
	    "#2196f3", "#03a9f4", "#00bcd4", "#009688", "#4caf50",
	    "#8bc34a", "#cddc39", "#ffeb3b", "#ffc107", "#ff9800",
	    "#ff5722", "#795548", "#9e9e9e", "#607d8b", "#263238"
	  ],
	    barColors : {},
	    dateFormat : 'DD.MM.YYYY HH:mm',
	    barGap : 5,
	    totalSumHeight : 25,
	    defaultWidth : 40,
	    defaultColumnWidth : 65
		});
});
</script>
<script>


</script>
<style>
.bar-legend-text {
	font-size: larger;
    font-weight: bold;
}

			* {
			    padding: 0;
			    margin: 0;
			    -moz-box-sizing: border-box;
			    box-sizing: border-box;
			    border: none;
			    outline: none;
			    font: normal 100% sans-serif;
			}

			html, body {
			    width: 100%;
			    height: 100%;
          background-color:#fafafa;
			}
            h1 { margin:150px auto 30px auto; text-align:center;}
</style>

</head>

<body>
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
	<form name="DailyStatusReport" id="DailyStatusReport" method="post">
	<div class="workArea container-fluid">
		<!-- </div>should close div here -->
		<div class="pageName">
                        <div class="col-sm-10 col-md-10 col-lg-10"> <label style="margin-left: 25%;"> RESOURCES </label> </div>
                        <!-- <div style="float:right;">
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-primary submitBtn" style="margin-top: 4px;">Add</button>
                                </div>
                                </div> -->
                        </div>
				<div class="generationArea" id="generationArea">
						
					<div style="margin-left: 10.5%; width: 80%; height: 70%;">
    <div id="chart"></div>

</div>
					
				</div>
			<!-- </div> -->
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
