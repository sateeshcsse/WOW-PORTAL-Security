<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard </title> 
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
<link rel="stylesheet" href="styles/jQueryGauge.css">

<!-- <link rel="stylesheet" href="styles/jqx.light.css"> -->
<link rel="stylesheet" href="styles/jqx.base.css">
<link rel="stylesheet" href="styles/jqGauge.css">

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/chart.js" type="text/javascript"> </script>
<script src="js/angularChart.js" type="text/javascript"> </script>
<script src="js/horizontalBarChart.js" type="text/javascript"> </script>
<script src="js/flip.js" type="text/javascript"> </script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!--    <script type="text/javascript">
     google.charts.load('current', {packages: ['corechart']});     
   </script> -->
   <script type="text/javascript" 
src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['corechart'],'language':'ru'}]}">
</script>

<script>
angular.module('materialApp', ['chart.js'])
.config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
}])

.controller('AppCtrl', function($scope,$http) {
  $scope.labelsSIT = ["AVAILABLE", "PARTIALLY AVAILABLE","PLANNED MAINTAINENCE","ERROR"];
  $scope.getSITDetailStatus=function(){
	  window.location.href="webMDashboard.jsp?SIT";
  }
	$scope.init=function(){
		$http({
			url:'getWMEnvOveralStatus.do?environment=SIT',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
			console.log(results.data);
			$scope.fineSIT = results.data[0].toFixed(2);
			$scope.partialSIT = results.data[1].toFixed(2);
			$scope.plannedMaintainenceSIT = results.data[2].toFixed(2);	
			$scope.errorSIT = results.data[3].toFixed(2);	
			$scope.sitData = [$scope.fineSIT,$scope.partialSIT,$scope.plannedMaintainenceSIT, $scope.errorSIT];
		});
	};
})

.controller('currentEngageMent',function($scope,$http,$location){
$scope.labelsUAT = ["AVAILABLE", "PARTIALLY AVAILABLE","PLANNED MAINTAINENCE","ERROR"];
  $scope.getUATDetailStatus=function(){
	  window.location.href="webMDashboard.jsp?UAT";
  }
	$scope.init=function(){
		$http({
			url:'getWMEnvOveralStatus.do?environment=UAT',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){			
			$scope.fineUAT = results.data[0].toFixed(2);
			$scope.partialUAT = results.data[1].toFixed(2);
			$scope.plannedMaintainenceUAT = results.data[2].toFixed(2);	
			$scope.errorUAT = results.data[3].toFixed(2);			
			$scope.uatData = [$scope.fineUAT, $scope.partialUAT, $scope.plannedMaintainenceUAT, $scope.errorUAT];
			
		});
	};
})
</script>
<script>
$(document).ready(function(){
	$("#sel2").val('overall');
	$('.chart-doughnut').css('width: 50px; height: 100px');
	$(".clickGoToReport").click(function() {
		window.open('slaMetricsReport.jsp','_self');
	});
	$(".clickGoToRCAReport").click(function() {
		window.open('rootCauseAnalysisReport.jsp','_self');
	});
});

</script>

<script language="JavaScript">

function drawOverallChart() {
   // Define the chart to be drawn.
   var data1 = [];
   $.ajax({
				type:'get',
				url:'getBarChartRCADashboard.do',
				success:function(jsonStr)
				{
					
					data1 = JSON.parse(jsonStr);
					data1.unshift(["NAME", "Value", { role: 'style'}]);
					for (var i=1;i<data1.length;i++){
						if(data1[i][0] == "Reqt")
							data1[i][2] = "#ae87e0";
						else if(data1[i][0] == "Design")
							data1[i][2] = "#ff9797";
						else if(data1[i][0] == "Code")
							data1[i][2] = "#6ea9b9";
						else if(data1[i][0] == "DataRC")
							data1[i][2] = "#ddcc51";
						else if(data1[i][0] == "Envt")
							data1[i][2] = "#7ca8de";
						else if(data1[i][0] == "TestScript")
							data1[i][2] = "#9cd45f";
						else if(data1[i][0] == "ExistProd")
							data1[i][2] = "#e9893a";
						else if(data1[i][0] == "Others")
							data1[i][2] = "#BC8F8F";
						//data1[i][1] = data1[i][1] + " %";
						//data1[i][3] = data1[i][1];
					}
					
					var data = new google.visualization.arrayToDataTable(
							data1      
					      );
						  var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
						  var options = {
							  chartArea: {height: '80%',
							  width: '50%',
							  left:"15%",
							  top : '3%'
			                   },
							  annotations: {alwaysOutside: true},
							  bar: {groupWidth: "80%"},
							  legend: {position: 'none'},
							  animation: {
					                duration: 1500,
					                startup: true 
					            },
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
						  var formatter = new google.visualization.NumberFormat({ suffix: '%' , decimalSymbol: '.', groupingSymbol: '.' });
							formatter.format(data, 1);
					   // Instantiate and draw the chart.
					   var chart = new google.visualization.BarChart(document.getElementById('container'));
					   chart.draw(view, options);
				}
   });
}

$(document).ready(function(){
	//drawOverallChart();
})

</script>
<style>
.clickGoToReport {
	cursor: pointer;
}
.clickGoToRCAReport {
	cursor: pointer;
}
.clickGoToVMReport {
	cursor: pointer;
}

.clickGoToPerformanceReport {
	cursor: pointer;
}
.addGreen {
	color: rgb(0,176,80) ! important;
}
.addRed {
	color: rgb(255,77,77) ! important;
}
.setGreenColor {
	color : rgb(0,176,80) ! important;
}
.setAmberColor {
	color : #FFA829 ! important;
}
.setRedColor {
	color : rgb(255,77,77) ! important;
}

.slaMetricsImage {
    position: absolute;
    left: 106px;
    right: 0;
    margin: 0 auto;
    top: 60%;
    transform: translateY(-50%);
    width: 28px;
    text-align: center;
    }


 #chartjs-tooltip {
      opacity: 1;
      position: absolute;
      background: rgba(0, 0, 0, .7);
      color: white;
      border-radius: 3px;
      -webkit-transition: all .1s ease;
      transition: all .1s ease;
      pointer-events: none;
      -webkit-transform: translate(-50%, 0);
      transform: translate(-50%, 0);
    }
    .chartjs-tooltip-key {
      display: inline-block;
      width: 10px;
      height: 10px;
    }
 .chart-innerTextWithTargetText {
      position: absolute;
      left: 0;
      right: 0;
      margin: 0 auto;
      top: 40%;
      transform: translateY(-50%);
      width: 52%;
          font-size: x-large;
      text-align: center;
    }
     .chart-innerTextWithoutTargetText {
      position: absolute;
      left: 0;
      right: 0;
      margin: 0 auto;
      top: 44%;
      transform: translateY(-50%);
      width: 52%;
          font-size: x-large;
      text-align: center;
    }
    .chart-outerText {
    	position: absolute;
      	right: 0;
      	margin: 0 auto;
      	top: 7%;
      	transform: translateY(-50%);
      	width: 100%;
        font-size: large;
      	text-align: center;
      	font-weight: bold;
    }
    .chartArrowImageWithTargetText {
    	position: absolute;
      left: 0;
    right: 0;
    margin: 0 auto;
    top: 64%;
    transform: translateY(-50%);
    width: 17%;
    text-align: center;
    }
	.chartArrowImageWithoutTargetText {
    	position: absolute;
      left: 0;
    right: 0;
    margin: 0 auto;
    top: 72%;
    transform: translateY(-50%);
    width: 17%;
    text-align: center;
    }    
.pageName {
	padding-bottom: 10px;
    padding-top: 3px;
}
.reportJpg {
position: absolute;
width: 27px;
/* right: 9px; */
left: 5px;
cursor: pointer;
}
select {
	font-family: "Roboto Condensed", Arial, sans-serif ! important;
}
label {
	color: rgba(0, 182, 255, 0.99) ! important;
	padding-left: 5px;
    padding-top: 8px;
    font-size: initial;
}
.chart-title {
	color: rgba(0, 182, 255, 0.99) ! important;
	font-weight: bold ! important;
	background-color : rgb(242, 242, 242) ! important;
}
.chart-wrapper .chart-title {
    padding: 0px 0px 4px ! important;
}
.trapezoidRCA {
    visibility: visible;
	cursor : pointer;
	background-image: url("images/icons/Project Dashboard Menu Icon.png");
	background-repeat: no-repeat;
	background-position: center;
	background-size: 50px 45px;
background-color: rgba(0, 182, 255, 0.99) ! important;
	    width: 102px;
    height: 19px;
    line-height: 18px;
    padding: 18px 4px 21px 4px;
    background-color: #ccc;
    padding-right: 29px;
    border-right: 0;
    position: relative;
    float: right;
    -moz-transform: scaleX(-1);
        -o-transform: scaleX(-1);
        -webkit-transform: scaleX(-1);
        transform: scaleX(-1);
        filter: FlipH;
        -ms-filter: "FlipH";
}

.trapezoid {
    visibility: hidden;
background-color: rgba(0, 182, 255, 0.99) ! important;
	    width: 102px;
    height: 19px;
    line-height: 18px;
    padding: 18px 4px 21px 4px;
    background-color: #ccc;
    padding-right: 29px;
    border-right: 0;
    position: relative;
    float: right;
    -moz-transform: scaleX(-1);
        -o-transform: scaleX(-1);
        -webkit-transform: scaleX(-1);
        transform: scaleX(-1);
        filter: FlipH;
        -ms-filter: "FlipH";
}

.width1000 {
    	right: 4%;
    }
    .width1250 {
    	right: 3%;
    }
    .width1500 {
    	right: 0%;
    }
     .width1750 {
    	right: 1.5%;
    }
    .width2000 {
    	right: 0%;
    }
     .width2250 {
    	right: -1%;
    }
    .width2500 {
    	right: -0.5%;
    }
     .width2750 {
    	right: 0.5%;
    }
    .width3000 {
    	right: 0.5%;
    }
    .width3500 {
    	right: -2.5%;
    }

.trapezoid:after {
	border-color: rgba(0, 182, 255, 0.99) transparent transparent transparent ! important; 
  	content: "";
  	display: block;
  	border-style: solid;
  	/* border-color: #ccc transparent transparent transparent; */
  	border-width: 40px 0 0 37px;
  	width: 0;
  	height: 0;
  	position: absolute;
  	top: 0;
  	right: -35px;
  	-moz-transform: scaleX(-1);
    -o-transform: scaleX(-1);
    -webkit-transform: scaleX(-1);
    transform: scaleX(-1);
    filter: FlipH;
    -ms-filter: "FlipH";
}
.trapezoidRCA:after {
	border-color: rgba(0, 182, 255, 0.99) transparent transparent transparent ! important; 
	cursor : pointer;
  	content: "";
  	display: block;
  	border-style: solid;
  	/* border-color: #ccc transparent transparent transparent; */
  	border-width: 40px 0 0 37px;
  	width: 0;
  	height: 0;
  	position: absolute;
  	top: 0;
  	right: -35px;
  	-moz-transform: scaleX(-1);
    -o-transform: scaleX(-1);
    -webkit-transform: scaleX(-1);
    transform: scaleX(-1);
    filter: FlipH;
    -ms-filter: "FlipH";
}
.chartImage {
	height : 205px;
	margin-left: 25%;
}

.pie-legend {
  list-style-type: none;
  padding-left: 0px;
  /* margin-left: 13%; */
}
.pie-legend li {
  display: block ;
  float: left;
  padding:5px;
  padding-left: 41px;
}
.pie-legend li span {
  width:10px;
  height:10px;
  float:left;
  margin-right:20px;
}
.pie-legend-text {
	white-space: nowrap;
}
.pie-legend-icon {
	margin-right: 6px ! important;
	margin-top:5px ! important;
}

.doughnut-legend {
  list-style-type: none;
  padding-left: 0px;
  margin-left: 35%;
  width: 200%;
}
.doughnut-legend li {
  display: inline ;
  float: left;
  padding:5px;
  margin-bottom: 3%;
}
.doughnut-legend li span {
  width:10px;
  height:10px;
  float:left;
  margin-right:20px;
}
.doughnut-legend-icon {
	margin-right: 6px ! important;
	margin-top:5px ! important;
}

.comingSoon {
	color: rgb(107, 119, 130) ! important;
	vertical-align: middle;
    text-align: center;
    font-size: -webkit-xxx-large;
    font-weight: bolder;
    margin-top: 21%;
    margin-bottom: 22%;
}
.chart-pie {
	margin-top: 4% !important;
}

</style>

</head>
<body ng-app = "materialApp" ng-cloak>
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
	<div class="workArea">
		<div class="col-sm-12 col-md-12 col-lg-12">
		<div class="col-sm-12 col-md-12 col-lg-12">
		<div class="col-sm-8 col-md-8 col-lg-8 pageName">
        	        <label style="margin-left : 47%;">WEBMETHODS STORE INTEGRATION DASHBOARD</label>
                </div>
				</div>		
				
				<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12" style="margin-left: 15%;">
      				<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="AppCtrl" ng-init="init()">
        				<div class="chart-wrapper">
          					<div class="chart-title">
            					<label> SIT </label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage1">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
            					<div class="col-sm-12 col-md-12 col-lg-12"  style="margin-top: 7%;">
            						<label class="chart-innerTextWithoutTargetText" style="left: -1%;top: 35% ! important;">{{fineSIT}}%</label>
									<label class="chart-innerTextWithoutTargetText" style="left: -1%; font-size: large ! important; top: 51% ! important;"><font color="#6b7782">Available</font></label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="70" height="40" chart-click="getSITDetailStatus"
  										chart-colours = ["#3f9f3f","#FFA829","#C0C5CA","#FF4D4D"] chart-options="{ percentageInnerCutout: 70 }" chart-data="sitData" chart-labels="labelsSIT">
									</canvas>
									<span style = "margin-left: 30%; font-weight: bold; font-size: initial;"> <font color="#6b7782">  </font></span>
									</div>
            					</div>
          					</div>
        				</div>
      				</div>
					<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="currentEngageMent" ng-init="init()">
        				<div class="chart-wrapper">
          					<div class="chart-title">
            					<label> UAT </label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage1">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
            					<div class="col-sm-12 col-md-12 col-lg-12"  style="margin-top: 7%;">
            						<label class="chart-innerTextWithoutTargetText" style="left: -1%;top: 35% ! important;">{{fineUAT}}%</label>
									<label class="chart-innerTextWithoutTargetText" style="left: -1%; font-size: large ! important; top: 51% ! important;"><font color="#6b7782">Available</font></label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="70" height="40" chart-click="getUATDetailStatus"
  										chart-colours = ["#3f9f3f","#FFA829","#C0C5CA","#FF4D4D"] chart-options="{ percentageInnerCutout: 70 }" chart-data="uatData" chart-labels="labelsUAT">
									</canvas>
									<span style = "margin-left: 30%; font-weight: bold; font-size: initial;"> <font color="#6b7782">  </font></span>
									</div>
            					</div>
          					</div>
        				</div>
      				</div>
			    
      				</div>
      				</div>
<!-- end of three -->
    		</div>
		</div>
	</div>
	</div>
	</div>
	
	<section class="footerSection" id="footer">
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
	</section>
</body>
<script src='js/css3-animate-it.js'></script>
</html>
