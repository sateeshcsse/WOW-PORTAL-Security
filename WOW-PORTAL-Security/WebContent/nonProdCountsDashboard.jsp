<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Resources</title> 
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
   <!-- <link rel="stylesheet" href="http://cdn.rawgit.com/jtblin/angular-chart.js/master/dist/angular-chart.css"> -->
   <link rel="stylesheet" href="styles/angular.chart.css">
   
   
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>
<script src="js/angular-1.4.7/angular.js"></script>
<script src="js/toastr.min.js"></script>
<script type="text/javascript" src="js/angular-toastr.js"></script>
<script type="text/javascript" src="js/angular-toastr.tpls.min.js"></script>
<script src="js/chart.js" type=
  "text/javascript">
</script>

<!-- <script src=
  "http://cdn.rawgit.com/jtblin/angular-chart.js/master/dist/angular-chart.js"
  type="text/javascript">
</script> -->
<script src="js/angularChart.js" type="text/javascript"> </script>

<!-- <script src="js/chart.js">
</script>

<script src="js/angular-chart.js"  type="text/javascript">
</script> -->

<script> 
$(document).ready(function(){
/* $("#line").on('created', function() {
	  if(window.__anim0987432598723) {
	    clearTimeout(window.__anim0987432598723);
	    window.__anim0987432598723 = null;
	  }
	  window.__anim0987432598723 = setTimeout(chart.update.bind(chart), 8000);
	}); */
});
</script>
<script>

angular.module('materialApp', ['chart.js', 'toastr'])

.factory('LoadUATData',function($http){
	var factory={
			loadUATData:function(){
				var data=$http({
					method:'GET',
					url:'getNonProdCountsByStream.do?stream=NONSAP&environment=UAT',
					headers: {
		                    'Content-Type': 'application/json; charset=UTF-8'
		                }
				}).then(function(respose){
					console.log(respose)
					 return respose.data;
				});
				return data;
				}
				};
	return factory;
})

.factory('LoadSITData',function($http){
	var factory={
			loadSITData:function(){
				var data=$http({
					method:'GET',
					url:'getNonProdCountsByStream.do?stream=NONSAP&environment=SIT',
					headers: {
		                    'Content-Type': 'application/json; charset=UTF-8'
		                }
				}).then(function(respose){
					console.log(respose)
					 return respose.data;
				});
				return data;
				}
				};
	return factory;
})

.factory('LoadUATSAPData',function($http){
	var factory={
			loadUATSAPData:function(){
				var data=$http({
					method:'GET',
					url:'getNonProdCountsByStream.do?stream=SAP&environment=UAT',
					headers: {
		                    'Content-Type': 'application/json; charset=UTF-8'
		                }
				}).then(function(respose){
					console.log(respose)
					 return respose.data;
				});
				return data;
				}
				};
	return factory;
})

.factory('LoadSITSAPData',function($http){
	var factory={
			loadSITSAPData:function(){
				var data=$http({
					method:'GET',
					url:'getNonProdCountsByStream.do?stream=SAP&environment=SIT',
					headers: {
		                    'Content-Type': 'application/json; charset=UTF-8'
		                }
				}).then(function(respose){
					console.log(respose)
					 return respose.data;
				});
				return data;
				}
				};
	return factory;
})

/* .controller('AppCtrl', ['$scope', '$interval', 'LoadResourceService', function ($scope, $interval, LoadResourceService) { */
.controller('AppCtrl', ['$scope', 'LoadUATData','LoadSITData','LoadUATSAPData','LoadSITSAPData', function ($scope, LoadUATData,LoadSITData,LoadUATSAPData,LoadSITSAPData) {
	$scope.uatCountsNonSAP = [];
	$scope.sitCountsNonSAP = [];
	$scope.labelsNonSAP = [];
	
	$scope.uatCountsSAP = [];
	$scope.sitCountsSAP = [];
	$scope.labelsSAP = [];
	
	$scope.getTeamDetails=function(){
		  window.location.href="nonProdTeamCountsDashboard.jsp";
	  }
	
	$scope.init=function(){
		LoadUATData.loadUATData().then(function(data){
			console.log(data);
			for(var i=0; i<data.length; i++){
				if(i%2==0)
					console.log('No Task');
				else
					$scope.uatCountsNonSAP.push(data[i]);
			}
		});
		
		LoadSITData.loadSITData().then(function(data){
			console.log(data);
			for(var i=0; i<data.length; i++){
				if(i%2==0)
					$scope.labelsNonSAP.push(data[i]);	
				else
					$scope.sitCountsNonSAP.push(data[i]);
			}
		});
		
		LoadUATSAPData.loadUATSAPData().then(function(data){
			console.log(data);
			for(var i=0; i<data.length; i++){
				if(i%2==0)
					console.log('No Task');
				else
					$scope.uatCountsSAP.push(data[i]);
			}
		});
		
		LoadSITSAPData.loadSITSAPData().then(function(data){
			console.log(data);
			for(var i=0; i<data.length; i++){
				if(i%2==0)
					$scope.labelsSAP.push(data[i]);	
				else
					$scope.sitCountsSAP.push(data[i]);
			}
		});
		
		$scope.dataNonSAP = [
			       	    $scope.uatCountsNonSAP,$scope.sitCountsNonSAP
			       	  ];
		
		$scope.dataSAP = [
					       	    $scope.uatCountsSAP,$scope.sitCountsSAP
					       	  ];
				
		$scope.seriesNonSAP = ['UAT','SIT'];
		$scope.seriesSAP = ['UEC','TEC'];
	 
	  $scope.onClick = function (points, evt) {
	    console.log(points, evt);
	  };
	};     
}]);

</script>
<style>
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

<body ng-app="materialApp" ng-controller="AppCtrl" ng-init="init()" ng-cloak>
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
		
				<div class="generationArea" id="generationArea">
						<div class="pageName">
                        <div class="col-sm-10 col-md-10 col-lg-10"> <label style="margin-left: 25%;"> Non-SAP Counts </label> </div>
                        </div>
						<div style="margin-left: 1.5%; width: 98%; height: 70%;">
							<canvas id="line" class="chart chart-line" chart-data="dataNonSAP" height="130" width="800"
  							chart-labels="labelsNonSAP" chart-legend="true" chart-series="seriesNonSAP"
  							chart-click="getTeamDetails" chart-colours = ["#f78f39","#3f9f3f"] >
							</canvas>
						</div>
						
						<div class="pageName">
                        <div class="col-sm-10 col-md-10 col-lg-10"> <label style="margin-left: 25%;"> SAP Counts </label> </div>
                        </div>
						
						<div style="margin-left: 1.5%; width: 98%; height: 70%;">
							<canvas id="line" class="chart chart-line" chart-data="dataSAP" height="130" width="800"
  							chart-labels="labelsSAP" chart-legend="true" chart-series="seriesSAP"
  							chart-click="getTeamDetails" chart-colours = ["#f78f39","#3f9f3f"] >
							</canvas>
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
