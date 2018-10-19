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

.factory('LoadResourceService',function($http){
	var factory={
			loadResourceData:function(){
				var data=$http({
					method:'GET',
					url:'loadResourceData.do',
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

.factory('LoadResourceGraph',function($http){
	var factory={
			loadResourceGraph:function(){
				var data=$http({
					method:'GET',
					url:'resourcesGraph.do',
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
.controller('AppCtrl', ['$scope', 'LoadResourceService','LoadResourceGraph', function ($scope, LoadResourceService,LoadResourceGraph) {
	$scope.addResources = {};
	$scope.offShoreGraphData = [];
	$scope.womenRatioGraphData = [];
	
	$scope.init=function(){
		LoadResourceGraph.loadResourceGraph().then(function(data){
			console.log(data);
			$scope.womenRatioGraphData.push(0);
			$scope.offShoreGraphData.push(0);
			for(var i=0; i<data.length; i++){
			
				if(i%2==0)
					$scope.offShoreGraphData.push(data[i]);	
				else
					$scope.womenRatioGraphData.push(data[i]);
			}
			$scope.data = [
			       	    /* [70, 75, 74, 79, 78, 76],
			       	    [74, 77, 79, 70, 72, 73] */
			       	    $scope.womenRatioGraphData,
			       	    $scope.offShoreGraphData
			       	  ];
					  
		});
		
	
		LoadResourceService.loadResourceData().then(function(data){
			console.log(data);
			 toastr.success(' Loaded successfully', 'Proceed With Reports Data', {
	       		  closeButton: true
	       		});
			$scope.addResources=data;
		});
		function addMonths(months) {
			var monthNames = ["January", "February", "March", "April", "May", "June",
			                  "July", "August", "September", "October", "November", "December"
			                ];
			var prevSixMonths = [];
			prevSixMonths.push("");
			for(var i=months; i<=0; i++) {
				var now = new Date();
            	now.setDate(1);
            	var date = now;
				date.setMonth(now.getMonth() + i);
				prevSixMonths.push(monthNames[date.getMonth()]);
			}
			return prevSixMonths;			
			}
	 $scope.labels = addMonths(-4);
	 $scope.series = ['Offshore Leverage' , 'Women Ratio'];
	 
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
		<div class="pageName">
                        <div class="col-sm-10 col-md-10 col-lg-10"> <label style="margin-left: 25%;"> RESOURCES </label> </div>
                        <!-- <div style="float:right;">
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-primary submitBtn" style="margin-top: 4px;">Add</button>
                                </div>
                                </div> -->
                        </div>
				<div class="generationArea" id="generationArea">
						<div class="col-sm-12 col-md-12 col-lg-12 overViewStatusTable">
							<table class="table table-bordered" id = "overViewStatusTableId" style = "background-color: rgb(242,242,242);">
								    <thead>
								      <tr>
								        <th>PORTFOLIO/AREA</th>
								        <th>Onsite</th>
								        <th>Offshore</th>
								        <th>Total</th>
								        <th>Offshore Leverage</th>
								        <th>Women Ratio</th>
								      </tr>
								      </thead>
								      <tbody>
								      	<tr>
								      		<td><p class="leftAlign">Shared Service</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteSharedService" ng-value="addResources.totalOnsiteSharedService=addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreSharedService" ng-value="addResources.totalOffshoreSharedService=addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallSharedService" ng-value="addResources.totalOverallSharedService=addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService+addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageSharedService" ng-value="addResources.offshoreLeverageSharedService=(((addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService)/(addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService+addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService))*100).toFixed(2)*1">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioSharedService" ng-value="addResources.womenRatioSharedService=(((addResources.onsiteWomenSharedService+addResources.offshoreWomenSharedService)/(addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService+addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService))*100).toFixed(2)*1">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteSharedService">{{addResources.totalOnsiteSharedService}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreSharedService">{{addResources.totalOffshoreSharedService}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallSharedService">{{addResources.totalOverallSharedService }}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageSharedService>70, applyRed: addResources.offshoreLeverageSharedService<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageSharedService || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioSharedService">{{ +addResources.womenRatioSharedService || 0}}%</span></td>
								      	</tr>
								      	
								      	<tr>
								      		<td><p class="leftAlign">Supply Chain</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteSupplyChain" ng-value="addResources.totalOnsiteSupplyChain=addResources.onsiteMenSupplyChain+addResources.onsiteWomenSupplyChain">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreSupplyChain" ng-value="addResources.totalOffshoreSupplyChain=addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallSupplyChain" ng-value="addResources.totalOverallSupplyChain=addResources.onsiteMenSupplyChain+addResources.onsiteWomenSupplyChain+addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageSupplyChain" ng-value="addResources.offshoreLeverageSupplyChain=(((addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain)/(addResources.onsiteMenSupplyChain+addResources.onsiteWomenSupplyChain+addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioSupplyChain" ng-value="addResources.womenRatioSupplyChain=(((addResources.onsiteWomenSupplyChain+addResources.offshoreWomenSupplyChain)/(addResources.onsiteMenSupplyChain+addResources.onsiteWomenSupplyChain+addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteSupplyChain">{{addResources.totalOnsiteSupplyChain}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreSupplyChain">{{addResources.totalOffshoreSupplyChain}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallSupplyChain">{{addResources.totalOverallSupplyChain}}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageSupplyChain>70, applyRed: addResources.offshoreLeverageSupplyChain<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageSupplyChain || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioSupplyChain">{{+addResources.womenRatioSupplyChain || 0}}%</span></td>
								      	</tr>
								      	
								      	<tr>
								      		<td><p class="leftAlign">Enterprise Applications</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteEnterpriseApps" ng-value="addResources.totalOnsiteEnterpriseApps=addResources.onsiteMenEnterpriseApps+addResources.onsiteWomenEnterpriseApps">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreEnterpriseApps" ng-value="addResources.totalOffshoreEnterpriseApps=addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallEnterpriseApps" ng-value="addResources.totalOverallEnterpriseApps=addResources.onsiteMenEnterpriseApps+addResources.onsiteWomenEnterpriseApps+addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageEnterpriseApps" ng-value="addResources.offshoreLeverageEnterpriseApps=(((addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps)/(addResources.onsiteMenEnterpriseApps+addResources.onsiteWomenEnterpriseApps+addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioEnterpriseApps" ng-value="addResources.womenRatioEnterpriseApps=(((addResources.onsiteWomenEnterpriseApps+addResources.offshoreWomenEnterpriseApps)/(addResources.onsiteMenEnterpriseApps+addResources.onsiteWomenEnterpriseApps+addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteEnterpriseApps">{{addResources.totalOnsiteEnterpriseApps}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreEnterpriseApps">{{addResources.totalOffshoreEnterpriseApps}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallEnterpriseApps">{{addResources.totalOverallEnterpriseApps}}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageEnterpriseApps>70, applyRed: addResources.offshoreLeverageEnterpriseApps<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageEnterpriseApps || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioEnterpriseApps">{{+addResources.womenRatioEnterpriseApps || 0}}%</span></td>
								      	</tr>
								      	
								      	<tr>
								      		<td><p class="leftAlign">GFS</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteGFS" ng-value="addResources.totalOnsiteGFS=addResources.onsiteMenGFS+addResources.onsiteWomenGFS">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreGFS" ng-value="addResources.totalOffshoreGFS=addResources.offshoreMenGFS+addResources.offshoreWomenGFS">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallGFS" ng-value="addResources.totalOverallGFS=addResources.onsiteMenGFS+addResources.onsiteWomenGFS+addResources.offshoreMenGFS+addResources.offshoreWomenGFS">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageGFS" ng-value="addResources.offshoreLeverageGFS=(((addResources.offshoreMenGFS+addResources.offshoreWomenGFS)/(addResources.onsiteMenGFS+addResources.onsiteWomenGFS+addResources.offshoreMenGFS+addResources.offshoreWomenGFS))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioGFS" ng-value="addResources.womenRatioGFS=(((addResources.onsiteWomenGFS+addResources.offshoreWomenGFS)/(addResources.onsiteMenGFS+addResources.onsiteWomenGFS+addResources.offshoreMenGFS+addResources.offshoreWomenGFS))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteGFS">{{addResources.totalOnsiteGFS}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreGFS">{{addResources.totalOffshoreGFS}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallGFS">{{addResources.totalOverallGFS}}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageGFS>70, applyRed: addResources.offshoreLeverageGFS<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageGFS || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioGFS">{{+ addResources.womenRatioGFS || 0}}%</span></td>
								      	</tr>
								      	
								      	<tr>
								      		<td><p class="leftAlign">Performance</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsitePerformance" ng-value="addResources.totalOnsitePerformance=addResources.onsiteMenPerformance+addResources.onsiteWomenPerformance">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshorePerformance" ng-value="addResources.totalOffshorePerformance=addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallPerformance" ng-value="addResources.totalOverallPerformance=addResources.onsiteMenPerformance+addResources.onsiteWomenPerformance+addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeveragePerformance" ng-value="addResources.offshoreLeveragePerformance=(((addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance)/(addResources.onsiteMenPerformance+addResources.onsiteWomenPerformance+addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioPerformance" ng-value="addResources.womenRatioPerformance=(((addResources.onsiteWomenPerformance+addResources.offshoreWomenPerformance)/(addResources.onsiteMenPerformance+addResources.onsiteWomenPerformance+addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsitePerformance">{{addResources.totalOnsitePerformance}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshorePerformance">{{addResources.totalOffshorePerformance}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallPerformance">{{addResources.totalOverallPerformance}}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeveragePerformance>70, applyRed: addResources.offshoreLeveragePerformance<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeveragePerformance || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioPerformance">{{+addResources.womenRatioPerformance || 0}}%</span></td>
								      	</tr>
								      	
								      	<tr>
								      		<td><p class="leftAlign">Stores</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteStores" ng-value="addResources.totalOnsiteStores=addResources.onsiteMenStores+addResources.onsiteWomenStores">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreStores" ng-value="addResources.totalOffshoreStores=addResources.offshoreMenStores+addResources.offshoreWomenStores">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallStores" ng-value="addResources.totalOverallStores=addResources.onsiteMenStores+addResources.onsiteWomenStores+addResources.offshoreMenStores+addResources.offshoreWomenStores">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageStores" ng-value="addResources.offshoreLeverageStores=(((addResources.offshoreMenStores+addResources.offshoreWomenStores)/(addResources.onsiteMenStores+addResources.onsiteWomenStores+addResources.offshoreMenStores+addResources.offshoreWomenStores))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioStores" ng-value="addResources.womenRatioStores=(((addResources.onsiteWomenStores+addResources.offshoreWomenStores)/(addResources.onsiteMenStores+addResources.onsiteWomenStores+addResources.offshoreMenStores+addResources.offshoreWomenStores))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteStores">{{addResources.totalOnsiteStores}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreStores">{{addResources.totalOffshoreStores}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallStores">{{addResources.totalOverallStores }}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageStores>70, applyRed: addResources.offshoreLeverageStores<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageStores || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioStores">{{+addResources.womenRatioStores || 0}}%</span></td>
								      	</tr>
								      	
								      	<tr>
								      		<td><p class="leftAlign">SAP AT</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteSAPAT" ng-value="addResources.totalOnsiteSAPAT=addResources.onsiteMenSAPAT+addResources.onsiteWomenSAPAT">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreSAPAT" ng-value="addResources.totalOffshoreSAPAT=addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallSAPAT" ng-value="addResources.totalOverallSAPAT=addResources.onsiteMenSAPAT+addResources.onsiteWomenSAPAT+addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageSAPAT" ng-value="addResources.offshoreLeverageSAPAT=(((addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT)/(addResources.onsiteMenSAPAT+addResources.onsiteWomenSAPAT+addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioSAPAT" ng-value="addResources.womenRatioSAPAT=(((addResources.onsiteWomenSAPAT+addResources.offshoreWomenSAPAT)/(addResources.onsiteMenSAPAT+addResources.onsiteWomenSAPAT+addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteSAPAT">{{addResources.totalOnsiteSAPAT}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreSAPAT">{{addResources.totalOffshoreSAPAT}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallSAPAT">{{addResources.totalOverallSAPAT }}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageSAPAT>70, applyRed: addResources.offshoreLeverageSAPAT<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageSAPAT || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioSAPAT">{{+addResources.womenRatioSAPAT|| 0}}%</span></td>
								      	</tr>
										<tr>
								      		<td><p class="leftAlign">Run IT</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteRUNIT" ng-value="addResources.totalOnsiteRUNIT=addResources.onsiteMenRunit+addResources.onsiteWomenRunit">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreRUNIT" ng-value="addResources.totalOffshoreRUNIT=addResources.offshoreMenRunit+addResources.offshoreWomenRunit">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallRUNIT" ng-value="addResources.totalOverallRUNIT=addResources.onsiteMenRunit+addResources.onsiteWomenRunit+addResources.offshoreMenRunit+addResources.offshoreWomenRunit">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageRUNIT" ng-value="addResources.offshoreLeverageRUNIT=(((addResources.offshoreMenRunit+addResources.offshoreWomenRunit)/(addResources.onsiteMenRunit+addResources.onsiteWomenRunit+addResources.offshoreMenRunit+addResources.offshoreWomenRunit))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioRUNIT" ng-value="addResources.womenRatioRUNIT=(((addResources.onsiteWomenRunit+addResources.offshoreWomenRunit)/(addResources.onsiteMenRunit+addResources.onsiteWomenRunit+addResources.offshoreMenRunit+addResources.offshoreWomenRunit))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteRUNIT">{{addResources.totalOnsiteRUNIT}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreRUNIT">{{addResources.totalOffshoreRUNIT}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallRUNIT">{{addResources.totalOverallRUNIT }}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageRUNIT>70, applyRed: addResources.offshoreLeverageRUNIT<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageRUNIT || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioRUNIT">{{+addResources.womenRatioRUNIT|| 0}}%</span></td>
								      	</tr>
								      	
								      	<tr>
								      		<td><p class="leftAlign">Digital</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteDigital" ng-value="addResources.totalOnsiteDigital=addResources.onsiteMenDigital+addResources.onsiteWomenDigital">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreDigital" ng-value="addResources.totalOffshoreDigital=addResources.offshoreMenDigital+addResources.offshoreWomenDigital">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallDigital" ng-value="addResources.totalOverallDigital=addResources.onsiteMenDigital+addResources.onsiteWomenDigital+addResources.offshoreMenDigital+addResources.offshoreWomenDigital">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageDigital" ng-value="addResources.offshoreLeverageDigital=(((addResources.offshoreMenDigital+addResources.offshoreWomenDigital)/(addResources.onsiteMenDigital+addResources.onsiteWomenDigital+addResources.offshoreMenDigital+addResources.offshoreWomenDigital))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioDigital" ng-value="addResources.womenRatioDigital=(((addResources.onsiteWomenDigital+addResources.offshoreWomenDigital)/(addResources.onsiteMenDigital+addResources.onsiteWomenDigital+addResources.offshoreMenDigital+addResources.offshoreWomenDigital))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteDigital">{{addResources.totalOnsiteDigital}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreDigital">{{addResources.totalOffshoreDigital}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallDigital">{{addResources.totalOverallDigital}}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageDigital>70, applyRed: addResources.offshoreLeverageDigital<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageDigital || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioDigital">{{+addResources.womenRatioDigital || 0}}%</span></td>
								      	</tr>
								      	
								      	<tr>
								      		<td><p class="leftAlign">Non-Prod Services</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteNonProdServices" ng-value="addResources.totalOnsiteNonProdServices=addResources.onsiteMenNonProdServices+addResources.onsiteWomenNonProdServices">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreNonProdServices" ng-value="addResources.totalOffshoreNonProdServices=addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallNonProdServices" ng-value="addResources.totalOverallNonProdServices=addResources.onsiteMenNonProdServices+addResources.onsiteWomenNonProdServices+addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageNonProdServices" ng-value="addResources.offshoreLeverageNonProdServices=(((addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices)/(addResources.onsiteMenNonProdServices+addResources.onsiteWomenNonProdServices+addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioNonProdServices" ng-value="addResources.womenRatioNonProdServices=(((addResources.onsiteWomenNonProdServices+addResources.offshoreWomenNonProdServices)/(addResources.onsiteMenNonProdServices+addResources.onsiteWomenNonProdServices+addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteNonProdServices">{{addResources.totalOnsiteNonProdServices}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreNonProdServices">{{addResources.totalOffshoreNonProdServices}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallNonProdServices">{{addResources.totalOverallNonProdServices }}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageNonProdServices>70, applyRed: addResources.offshoreLeverageNonProdServices<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageNonProdServices || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioNonProdServices">{{+addResources.womenRatioNonProdServices|| 0}}%</span></td>
								      	</tr>
								      	
								      	<tr>
								      		<td><p class="leftAlign">Others[TWQ, etc.,]</p></td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteOthers" ng-value="addResources.totalOnsiteOthers=addResources.onsiteMenOthers+addResources.onsiteWomenOthers">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreOthers" ng-value="addResources.totalOffshoreOthers=addResources.offshoreMenOthers+addResources.offshoreWomenOthers">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallOthers" ng-value="addResources.totalOverallOthers=addResources.onsiteMenOthers+addResources.onsiteWomenOthers+addResources.offshoreMenOthers+addResources.offshoreWomenOthers">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageOthers" ng-value="addResources.offshoreLeverageOthers=(((addResources.offshoreMenOthers+addResources.offshoreWomenOthers)/(addResources.onsiteMenOthers+addResources.onsiteWomenOthers+addResources.offshoreMenOthers+addResources.offshoreWomenOthers))*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioOthers" ng-value="addResources.womenRatioOthers=(((addResources.onsiteWomenOthers+addResources.offshoreWomenOthers)/(addResources.onsiteMenOthers+addResources.onsiteWomenOthers+addResources.offshoreMenOthers+addResources.offshoreWomenOthers))*100).toFixed(2)">

								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOnsiteOthers">{{addResources.totalOnsiteOthers}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOffshoreOthers">{{addResources.totalOffshoreOthers}}</span> </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.totalOverallOthers">{{addResources.totalOverallOthers}}</span> </td>
								      		<td ng-class="{applyGreen: addResources.offshoreLeverageOthers>70, applyRed: addResources.offshoreLeverageOthers<=70 }" style = "text-align: center;">{{ +addResources.offshoreLeverageOthers || 0}}% </td>
								      		<td style="text-align: center;"><span id="testingInput2" ng-model="addResources.womenRatioOthers">{{ +addResources.womenRatioOthers || 0}}%</span></td>
								      	</tr>
								      	
								      	
										<tr>
								      		<td style = "text-align : center; background-color: #C1E1A7;">TOTAL</td>
								      		<td style = "text-align : center; padding-right: 2%; background-color: #C1E1A7;"><input id="testingInput2" class = "totalOnsiteTotal" type="number" disabled style = "background-color: #C1E1A7;">{{addResources.totalOnsiteSharedService+addResources.totalOnsiteRUNIT+addResources.totalOnsiteSupplyChain+addResources.totalOnsiteEnterpriseApps+addResources.totalOnsiteGFS+addResources.totalOnsitePerformance+addResources.totalOnsiteStores+addResources.totalOnsiteSAPAT+addResources.totalOnsiteDigital+addResources.totalOnsiteNonProdServices+addResources.totalOnsiteOthers}}</td>
								      		<td style = "text-align : center; padding-right: 2%; background-color: #C1E1A7;"><input id="testingInput2" class = "totalOffshoreTotal" type="number" disabled style = "background-color: #C1E1A7;">{{addResources.totalOffshoreSharedService+addResources.totalOffshoreRUNIT+addResources.totalOffshoreSupplyChain+addResources.totalOffshoreEnterpriseApps+addResources.totalOffshoreGFS+addResources.totalOffshorePerformance+addResources.totalOffshoreStores+addResources.totalOffshoreSAPAT+addResources.totalOffshoreDigital+addResources.totalOffshoreNonProdServices+addResources.totalOffshoreOthers}}</td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalONWomen" ng-value="addResources.totalONWomen=addResources.onsiteWomenSharedService+addResources.onsiteWomenRunit+addResources.onsiteWomenSupplyChain+addResources.onsiteWomenEnterpriseApps+addResources.onsiteWomenGFS+addResources.onsiteWomenPerformance+addResources.onsiteWomenStores+addResources.onsiteWomenSAPAT+addResources.onsiteWomenDigital+addResources.onsiteWomenNonProdServices+addResources.onsiteWomenOthers">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOFFWomen" ng-value="addResources.totalOFFWomen=addResources.offshoreWomenSharedService+addResources.offshoreWomenRunit+addResources.offshoreWomenSupplyChain+addResources.offshoreWomenEnterpriseApps+addResources.offshoreWomenGFS+addResources.offshoreWomenPerformance+addResources.offshoreWomenStores+addResources.offshoreWomenSAPAT+addResources.offshoreWomenDigital+addResources.offshoreWomenNonProdServices+addResources.offshoreWomenOthers">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreResource" ng-value="addResources.totalOffshoreResource=addResources.totalOffshoreSharedService+addResources.totalOffshoreRUNIT+addResources.totalOffshoreSupplyChain+addResources.totalOffshoreEnterpriseApps+addResources.totalOffshoreGFS+addResources.totalOffshorePerformance+addResources.totalOffshoreStores+addResources.totalOffshoreSAPAT+addResources.totalOffshoreDigital+addResources.totalOffshoreNonProdServices+addResources.totalOffshoreOthers">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalResource" ng-value="addResources.totalResource=addResources.totalOverallSharedService+addResources.totalOverallRUNIT+addResources.totalOverallSupplyChain+addResources.totalOverallEnterpriseApps+addResources.totalOverallGFS+addResources.totalOverallPerformance+addResources.totalOverallStores+addResources.totalOverallSAPAT+addResources.totalOverallDigital+addResources.totalOverallNonProdServices+addResources.totalOverallOthers">
								      		
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreLev" ng-value="addResources.totalOffshoreLev=(( addResources.totalOffshoreResource/addResources.totalResource)*100).toFixed(2)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalWomen" ng-value="addResources.totalWomen=+((((addResources.totalONWomen+addResources.totalOFFWomen)/addResources.totalResource)*100).toFixed(2))">
								      		
								      		
								      		<td style = "text-align : center; background-color: #C1E1A7;"><input id="testingInput2" class = "totalOverallTotal" type="number" disabled style = "background-color: #C1E1A7;">{{addResources.totalOverallSharedService+addResources.totalOverallRUNIT+addResources.totalOverallSupplyChain+addResources.totalOverallEnterpriseApps+addResources.totalOverallGFS+addResources.totalOverallPerformance+addResources.totalOverallStores+addResources.totalOverallSAPAT+addResources.totalOverallDigital+addResources.totalOverallNonProdServices+addResources.totalOverallOthers}}</td>
								      		<td ng-class="{applyGreen: addResources.totalOffshoreLev>70, applyRed: addResources.totalOffshoreLev<=70 }"  class = "totalOffshoreLeverage" style = "text-align : center;">{{  (( addResources.totalOffshoreResource/addResources.totalResource)*100).toFixed(2)}}%</td>
								      		<td class = "totalWomenRatio" style = "text-align : center; background-color: #C1E1A7;">{{+((((addResources.totalONWomen+addResources.totalOFFWomen)/addResources.totalResource)*100).toFixed(2))}}%</td>
								      	</tr>
                                      </tbody>
								  </table>
						</div>
						<div style="margin-left: 1.5%; width: 98%; height: 70%;">
						<canvas id="line" class="chart chart-line" chart-data="data" height="200" width="800"
  chart-labels="labels" chart-legend="true" chart-series="series"
  chart-click="onClick" chart-colours = ["#f78f39","#3f9f3f"] >
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
