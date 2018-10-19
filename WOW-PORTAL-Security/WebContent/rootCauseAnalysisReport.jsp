<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Root Cause Analysis Report</title> 
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
   <link rel="stylesheet" href="js/toastr.css">
   <link rel="stylesheet" href="styles/angular.chart.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>
<script src="js/angular-1.4.7/angular.js"></script>
<script src="js/toastr.min.js"></script>
<script type="text/javascript" src="js/angular-toastr.js"></script>
<script type="text/javascript" src="js/angular-toastr.tpls.min.js"></script>
<script src="js/chart.js" type="text/javascript"></script>
<script src="js/angularChart.js" type="text/javascript"> </script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!--    <script type="text/javascript">
     google.charts.load('current', {packages: ['corechart']});     
   </script> -->
   <script type="text/javascript" 
src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['corechart'],'language':'ru'}]}">
</script>
   <style>
   
   
   
   </style>
<script language="JavaScript">
var counter = 0;
var pathFrom = "";
var pathTo = "";
var portfolio = "";
var project = "";
var legends = "yes";
function drawOverallChart() {
   // Define the chart to be drawn.
   var data1 = [], data2 = [], data3 = [], newData = [];
   $.ajax({
				type:'get',
				url:'getallRCA.do',
				success:function(jsonStr)
				{
					
					data1 = JSON.parse(jsonStr);
					data1.unshift(["PORTFOLIO", "Reqt", "Doc", "Code", "Data", "Envt", "Scripts", "Exist in Prod", "Others"]);
					var data = new google.visualization.arrayToDataTable(
							data1      
					      );
					   var options = {
					      title: 'All Portfolio',
					      chartArea: {
			                    left:"15%",
			                    top:30,
			                    width:"70%",
			                    height:"80%"
			                },
					      isStacked: "percent",
					      colors : ['#ae87e0', '#ff9797', '#6ea9b9', '#ddcc51', '#7ca8de', '#9cd45f', '#e9893a', '#BC8F8F'],
					      legend: {position: 'bottom', maxLines: 1},
					      titleTextStyle: {
					          color: "#484848",    // any HTML string color ('red', '#cc00cc')
					          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
					          fontSize: 18, // 12, 18 whatever you want (don't specify px)
					      },
					      hAxis: { 
					    	  textStyle: {
					    	  color: "#484848",    // any HTML string color ('red', '#cc00cc')
					          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
					          fontSize: 14, // 12, 18 whatever you want (don't specify px)
					    	  }
					      },
					      vAxis: { 
					    	  textStyle: {
					    	  color: "#484848",    // any HTML string color ('red', '#cc00cc')
					          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
					          fontSize: 14, // 12, 18 whatever you want (don't specify px)
					    	  }
					      },
					      legendTextStyle: {
					    	  color: "#484848",
					    	  fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
					          fontSize: 14, // 12, 18 whatever you want (don't specify px)},
					   }
				};
					   // Instantiate and draw the chart.
					   var chart = new google.visualization.BarChart(document.getElementById('container'));
					   chart.draw(data, options);
					   counter = 1;
					   pathFrom = "Overall";
					   pathTo = "Portfolio";
					   legends = "no";
					   google.visualization.events.addListener(chart, 'click', function(e) {
						    console.log("hii"+e);
						    if(e.targetID=="chartarea" || e.targetID=="chart") {
						    	portfolio = "noData";
						    	legends = "no";
						    } else if(e.targetID.indexOf("legendentry")!=-1) {
						    	legends = "yes";
						    } else if(e.targetID.indexOf("title")!=-1 || e.targetID.indexOf("vAxis")!=-1 || e.targetID.indexOf("hAxis")!=-1) {
						    	legends = "yes";
						    } else {
						    	legends = "no";
						    	var portolioID = parseInt(e.targetID.slice(-1)) + 1;
							    portfolio = data1[portolioID][0];						    	
						    }
						    
						});
				}
   });
   // portfolio - row, rca categories - column
   // targetid = bar#rcaCategory#portfolio
}
function drawPortfolioChart() {
	   // Define the chart to be drawn.
	    $.ajax({
				type:'get',
				url:'getRCAProject.do',
				data: "portfolio="+portfolio,
				success:function(jsonStr)
				{
					data2 = JSON.parse(jsonStr);
					data2.unshift(["PROJECT", "Reqt", "Doc", "Code", "Data", "Envt", "Scripts", "Exist in Prod", "Others"]);
					var data = new google.visualization.arrayToDataTable(
							data2      
					      );
					
							if(data2.length==2) {
								pathFrom = "Portfolio";
								pathTo = "Overall";
								$("#container1").height("400px");
								var options = {
									      title: portfolio + " - All Projects",
									      chartArea: {
									    	  left:"20%",
							                    top:30,
							                    width:"75%",
							                    height:"30%"
							                },
									      isStacked: "percent",
									      colors : ['#ae87e0', '#ff9797', '#6ea9b9', '#ddcc51', '#7ca8de', '#9cd45f', '#e9893a', '#BC8F8F'],
									      legend: {position: 'bottom', maxLines: 1},
									      titleTextStyle: {
									          color: "#484848",    // any HTML string color ('red', '#cc00cc')
									          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
									          fontSize: 18, // 12, 18 whatever you want (don't specify px)
									      },
									      hAxis: { 
									    	  textStyle: {
									    	  color: "#484848",    // any HTML string color ('red', '#cc00cc')
									          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
									          fontSize: 14, // 12, 18 whatever you want (don't specify px)
									    	  }
									      },
									      vAxis: { 
									    	  textStyle: {
									    	  color: "#484848",    // any HTML string color ('red', '#cc00cc')
									          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
									          fontSize: 14, // 12, 18 whatever you want (don't specify px)
									    	  }
									      },
									      legendTextStyle: {
									    	  color: "#484848",
									    	  fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
									          fontSize: 14, // 12, 18 whatever you want (don't specify px)},
									   }
									   };
							} else {
								$("#container1").height("1000px");
								var options = {
									      title: portfolio + " - All Projects",
									      chartArea: {
							                    left:"20%",
							                    top:30,
							                    width:"80%",
							                    height:"80%"
							                },
									      isStacked: "percent",
									      colors : ['#ae87e0', '#ff9797', '#6ea9b9', '#ddcc51', '#7ca8de', '#9cd45f', '#e9893a', '#BC8F8F'],
									      legend: {position: 'bottom', maxLines: 1},
									      titleTextStyle: {
									          color: "#484848",    // any HTML string color ('red', '#cc00cc')
									          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
									          fontSize: 18, // 12, 18 whatever you want (don't specify px)
									      },
									      hAxis: { 
									    	  textStyle: {
									    	  color: "#484848",    // any HTML string color ('red', '#cc00cc')
									          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
									          fontSize: 14, // 12, 18 whatever you want (don't specify px)
									    	  }
									      },
									      vAxis: { 
									    	  textStyle: {
									    	  color: "#484848",    // any HTML string color ('red', '#cc00cc')
									          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
									          fontSize: 14, // 12, 18 whatever you want (don't specify px)
									    	  }
									      },
									      legendTextStyle: {
									    	  color: "#484848",
									    	  fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
									          fontSize: 14, // 12, 18 whatever you want (don't specify px)},
									   }
									   };
								if(pathFrom == "Overall") {
									   pathFrom = "Portfolio";
										pathTo = "Project"; 
								   } else if(pathFrom == "Project") {
									   pathFrom = "Portfolio";
										pathTo = "Overall"; 
								   } 
							}
						   
							
						   // Instantiate and draw the chart.
						   var chart = new google.visualization.BarChart(document.getElementById('container1'));
						   chart.draw(data, options);
						   counter = 2;
						   google.visualization.events.addListener(chart, 'click', function(e) {
							    console.log("hii"+e);
							    if(e.targetID=="chartarea" || e.targetID=="chart") {
							    	project = "noData";
							    	legends = "no";
							    } else if(e.targetID.indexOf("legendentry")!=-1) {
							    	legends = "yes";
							    } else if(e.targetID.indexOf("title")!=-1 || e.targetID.indexOf("vAxis")!=-1 || e.targetID.indexOf("hAxis")!=-1) {
							    	legends = "yes";
							    } else {
							    var projectID = parseInt(e.targetID.slice(-1)) + 1;
							    project = data2[projectID][0];
							    legends = "no";
							    }
							    
							});
						   
				}
   });
	}

function drawProjectChart() {
	   // Define the chart to be drawn.
	   
	   $.ajax({
				type:'get',
				url:'getRCAProjData.do',
				data: "project="+project,
				success:function(jsonStr)
				{
					
					data3 = JSON.parse(jsonStr);
					data3.unshift(["PROJECT", "Reqt", "Doc", "Code", "Data", "Envt", "Scripts", "Exist in Prod", "Others"]);
					var data = new google.visualization.arrayToDataTable(
							data3      
					      );
					 var options = {
						      title: portfolio + " - " +project,
						      chartArea: {
				                    left:"20%",
				                    top:30,
				                    width:"60%",
				                    height:"30%"	
				                },
						      isStacked: "percent",
						      colors : ['#ae87e0', '#ff9797', '#6ea9b9', '#ddcc51', '#7ca8de', '#9cd45f', '#e9893a', '#BC8F8F'],
						      legend: {position: 'bottom', maxLines: 1},
						      titleTextStyle: {
						          color: "#484848",    // any HTML string color ('red', '#cc00cc')
						          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
						          fontSize: 18, // 12, 18 whatever you want (don't specify px)
						      },
						      hAxis: { 
						    	  textStyle: {
						    	  color: "#484848",    // any HTML string color ('red', '#cc00cc')
						          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
						          fontSize: 14, // 12, 18 whatever you want (don't specify px)
						    	  }
						      },
						      vAxis: { 
						    	  textStyle: {
						    	  color: "#484848",    // any HTML string color ('red', '#cc00cc')
						          fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
						          fontSize: 14, // 12, 18 whatever you want (don't specify px)
						    	  }
						      },
						      legendTextStyle: {
						    	  color: "#484848", 
						    	  fontName: "'Roboto Condensed', Arial, sans-serif ! important", // i.e. 'Times New Roman'
						          fontSize: 14, // 12, 18 whatever you want (don't specify px)},
						   }
						   };  
							pathFrom="Project";
							pathTo = "Portfolio";
						   // Instantiate and draw the chart.
						   var chart = new google.visualization.BarChart(document.getElementById('container2'));
						   chart.draw(data, options);
						   counter = 3;
						   legends = "no";
						   google.visualization.events.addListener(chart, 'click', function(e) {
							   if(e.targetID.indexOf("legendentry")!=-1) {
							    	legends = "yes";
							    } else {
							    	legends = "no";
							    }
							   if(e.targetID=="chartarea" || e.targetID=="chart") {
							    	legends = "yes";
							    }
							   if(e.targetID.indexOf("title")!=-1 || e.targetID.indexOf("vAxis")!=-1 || e.targetID.indexOf("hAxis")!=-1) {
							    	legends = "yes";
							    }
						   });
				}
	   });
	}

$(document).ready(function(){
	drawOverallChart();
	$("svg").find("g text").addClass("addFont");
	
$("#container, #container1, #container2").click(function() {
	if(pathTo == "Portfolio" && portfolio != "noData" && legends != "yes") {
		$('#container').css("display", "none");
		$('#container1').css("display", "block");
		$('#container2').css("display", "none");
		drawPortfolioChart();
	}


	else if(pathTo=="Project" && project != "noData" && legends != "yes") {
		$('#container').css("display", "none");
		$('#container1').css("display", "none");
		$('#container2').css("display", "block");
		drawProjectChart();
	}


	else if(pathTo=="Overall" && legends != "yes") {
		$('#container').css("display", "block");
		$('#container1').css("display", "none");
		$('#container2').css("display", "none");
		drawOverallChart();			
	}
});
});
	
/* $(document).ready(function(){
	google.charts.setOnLoadCallback(drawChart);
}); */
</script>
<style>
.addFont {
	font-family : 'Roboto Condensed', Arial, sans-serif ! important;
}
#container {
	cursor: pointer;
}
div.google-visualization-tooltip {
	color: #484848 !important;
}
#container1 {
	cursor: pointer;
}
#container2 {
	cursor: pointer;
}
.reportJpg {
	    position: absolute;
    width: 27px;
    left: 5px;
}
#testingInput2 {
	text-align: center ! important;
	background-color: rgb(242,242,242);
    height: 100%;
    width:10%;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}
.leftAlign {
	text-align : left;
	margin: 0 0 0px;
}
.line-legend-text {
	font-size: larger;
    font-weight: bold;
}
.applyGreen {
	background-color: green;
}
.applyRed {
	background-color: rgb(255,79,79);
}

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
                        <div class="col-sm-10 col-md-10 col-lg-10"> <label style="margin-left: 25%;"> ROOT CAUSE ANALYSIS </label> </div>
                        <!-- <div style="float:right;">
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-primary submitBtn" style="margin-top: 4px;">Add</button>
                                </div>
                                </div> -->
                        </div>
				<div class="generationArea" id="generationArea">
						<div style="margin-left: 3.5%; width: 98%; height: 70%;">
							<div id="container" style="width: 80; height: 400px; margin: 0 auto;"></div>
							<div id="container1" style="margin-left: 3% ! important; width: 100; height: 1000px; margin: 0 auto; display:none;"></div>
							<div id="container2" style="margin-left: -4% ! important; width: 80; height: 400px; margin: 0 auto; display:none;"></div>
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
