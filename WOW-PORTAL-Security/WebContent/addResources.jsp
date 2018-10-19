<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Resources</title> 
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
<link rel="stylesheet" type="text/css" href="styles/angular-toastr.css" />

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>
<script type="text/javascript"></script>
<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/toastr.min.js"></script>
<script type="text/javascript" src="js/angular-toastr.js"></script>
<script type="text/javascript" src="js/angular-toastr.tpls.min.js"></script>

<style>
#testingInput2 {
text-align: center ! important;
background-color: rgb(242,242,242);
   height: 100%;
   width:85%;
}
</style>
<script>

var app = angular.module('materialApp', ['toastr']);
app.config(function($httpProvider) {
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
});

app.controller('AppCtrl', function($scope) {
	$scope.addResources = {};
});

</script>
</head>

<body ng-app="materialApp" ng-controller="AppCtrl">
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
                        <div class="col-sm-10"> <label style="margin-left: 25%;"> ADD RESOURCES </label> </div>
                        </div>
				<div class="generationArea" id="generationArea">
						<div class="col-md-12 overViewStatusTable">
							<table class="table table-bordered" id = "overViewStatusTableId" style = "background-color: rgb(242,242,242);">
								    <thead>
								      <tr>
								        <th>PORTFOLIO/AREA</th>
								        <th>Onsite - Men</th>
								        <th>Offshore - Men</th>
								        <th>Onsite - Women</th>
								        <th>Offshore - Women</th>
								        <th>Total - Onsite</th>
								        <th>Total - Offshore</th>
								        <th>Total - Overall</th>
								        <th>Offshore Leverage</th>
								        <th>Women Ratio</th>
								      </tr>
								      </thead>
								      <tbody>
								      	<tr>
								      		<td>Shared Service</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenSharedService"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenSharedService"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenSharedService"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenSharedService"> </td>
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOnsiteSharedService" ng-value="addResources.totalOnsiteSharedService=addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOffshoreSharedService" ng-value="addResources.totalOffshoreSharedService=addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.totalOverallSharedService" ng-value="addResources.totalOverallSharedService=addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService+addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.offshoreLeverageSharedService" ng-value="addResources.offshoreLeverageSharedService=(((addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService)/(addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService+addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService))*100)">
								      		<input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.womenRatioSharedService" ng-value="addResources.womenRatioSharedService=(((addResources.onsiteWomenSharedService+addResources.offshoreWomenSharedService)/(addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService+addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService))*100)">
								      		
								      		
								      		<td><span id="testingInput2" ng-model="addResources.totalOnsiteSharedService">{{addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOffshoreSharedService">{{addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOverallSharedService">{{addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService+addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeverageSharedService" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService)/(addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService+addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.womenRatioSharedService">{{((addResources.onsiteWomenSharedService+addResources.offshoreWomenSharedService)/(addResources.onsiteMenSharedService+addResources.onsiteWomenSharedService+addResources.offshoreMenSharedService+addResources.offshoreWomenSharedService))*100}}</span></td>
								      	</tr>
								      	<tr>
								      		<td>Supply Chain</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenSupplyChain"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenSupplyChain"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenSupplyChain"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenSupplyChain"> </td>
								      		<td><span id="testingInput2" ng-bind="addResources.totalOnsiteSupplyChain">{{addResources.onsiteMenSupplyChain+addResources.onsiteWomenSupplyChain}}</span> </td>
								      		<td><span id="testingInput2" ng-bind="addResources.totalOffshoreSupplyChain">{{addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain}}</span> </td>
								      		<td><span id="testingInput2" ng-bind="addResources.totalOverallSupplyChain">{{addResources.onsiteMenSupplyChain+addResources.onsiteWomenSupplyChain+addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeverageSupplyChain" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain)/(addResources.onsiteMenSupplyChain+addResources.onsiteWomenSupplyChain+addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-bind="addResources.womenRatioSupplyChain">{{((addResources.onsiteWomenSupplyChain+addResources.offshoreWomenSupplyChain)/(addResources.onsiteMenSupplyChain+addResources.onsiteWomenSupplyChain+addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain))*100}}</span></td>
								      	</tr>
								      <input id="testingInput2" type="hidden" placeholder="0"step="1" ng-model="addResources.onsiteMenSupplyChain2" ng-value="addResources.onsiteMenSupplyChain2=addResources.onsiteMenSupplyChain+addResources.onsiteWomenSupplyChain+addResources.offshoreMenSupplyChain+addResources.offshoreWomenSupplyChain">
								      	{{addResources.onsiteMenSupplyChain2}}
								      	<tr>
								      		<td>Enterprise Apps</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenEnterpriseApps"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenEnterpriseApps"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenEnterpriseApps"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenEnterpriseApps"> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOnsiteEnterpriseApps">{{addResources.onsiteMenEnterpriseApps+addResources.onsiteWomenEnterpriseApps}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOffshoreEnterpriseApps">{{addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOverallEnterpriseApps">{{addResources.onsiteMenEnterpriseApps+addResources.onsiteWomenEnterpriseApps+addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeverageEnterpriseApps" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps)/(addResources.onsiteMenEnterpriseApps+addResources.onsiteWomenEnterpriseApps+addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.womenRatioEnterpriseApps">{{((addResources.onsiteWomenEnterpriseApps+addResources.offshoreWomenEnterpriseApps)/(addResources.onsiteMenEnterpriseApps+addResources.onsiteWomenEnterpriseApps+addResources.offshoreMenEnterpriseApps+addResources.offshoreWomenEnterpriseApps))*100}}</span></td>
								      	</tr>
								      	<tr>
								      		<td>GFS</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenGFS"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenGFS"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenGFS"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenGFS"> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOnsiteGFS">{{addResources.onsiteMenGFS+addResources.onsiteWomenGFS}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOffshoreGFS">{{addResources.offshoreMenGFS+addResources.offshoreWomenGFS}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOverallGFS">{{addResources.onsiteMenGFS+addResources.onsiteWomenGFS+addResources.offshoreMenGFS+addResources.offshoreWomenGFS }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeverageGFS" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenGFS+addResources.offshoreWomenGFS)/(addResources.onsiteMenGFS+addResources.onsiteWomenGFS+addResources.offshoreMenGFS+addResources.offshoreWomenGFS))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.womenRatioGFS">{{((addResources.onsiteWomenGFS+addResources.offshoreWomenGFS)/(addResources.onsiteMenGFS+addResources.onsiteWomenGFS+addResources.offshoreMenGFS+addResources.offshoreWomenGFS))*100}}</span></td>
								      	</tr>
								      	<tr>
								      		<td>Performance</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenPerformance"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenPerformance"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenPerformance"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenPerformance"> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOnsitePerformance">{{addResources.onsiteMenPerformance+addResources.onsiteWomenPerformance}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOffshorePerformance">{{addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOverallPerformance">{{addResources.onsiteMenPerformance+addResources.onsiteWomenPerformance+addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeveragePerformance" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance)/(addResources.onsiteMenPerformance+addResources.onsiteWomenPerformance+addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.womenRatioPerformance">{{((addResources.onsiteWomenPerformance+addResources.offshoreWomenPerformance)/(addResources.onsiteMenPerformance+addResources.onsiteWomenPerformance+addResources.offshoreMenPerformance+addResources.offshoreWomenPerformance))*100}}</span></td>
								      	</tr>
								      	<tr>
								      		<td>Stores</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenStores"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenStores"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenStores"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenStores"> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOnsiteStores">{{addResources.onsiteMenStores+addResources.onsiteWomenStores}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOffshoreStores">{{addResources.offshoreMenStores+addResources.offshoreWomenStores}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOverallStores">{{addResources.onsiteMenStores+addResources.onsiteWomenStores+addResources.offshoreMenStores+addResources.offshoreWomenStores }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeverageStores" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenStores+addResources.offshoreWomenStores)/(addResources.onsiteMenStores+addResources.onsiteWomenStores+addResources.offshoreMenStores+addResources.offshoreWomenStores))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.womenRatioStores">{{((addResources.onsiteWomenStores+addResources.offshoreWomenStores)/(addResources.onsiteMenStores+addResources.onsiteWomenStores+addResources.offshoreMenStores+addResources.offshoreWomenStores))*100}}</span></td>
								      	</tr>
								      	<tr>
								      		<td>SAP AT</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenSAPAT"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenSAPAT"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenSAPAT"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenSAPAT"> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOnsiteSAPAT">{{addResources.onsiteMenSAPAT+addResources.onsiteWomenSAPAT}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOffshoreSAPAT">{{addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOverallSAPAT">{{addResources.onsiteMenSAPAT+addResources.onsiteWomenSAPAT+addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeverageSAPAT" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT)/(addResources.onsiteMenSAPAT+addResources.onsiteWomenSAPAT+addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.womenRatioSAPAT">{{((addResources.onsiteWomenSAPAT+addResources.offshoreWomenSAPAT)/(addResources.onsiteMenSAPAT+addResources.onsiteWomenSAPAT+addResources.offshoreMenSAPAT+addResources.offshoreWomenSAPAT))*100}}</span></td>
								      	</tr>
								      	<tr>
								      		<td>Masters</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenMasters"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenMasters"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenMasters"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenMasters"> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOnsiteMasters">{{addResources.onsiteMenMasters+addResources.onsiteWomenMasters}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOffshoreMasters">{{addResources.offshoreMenMasters+addResources.offshoreWomenMasters}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOverallMasters">{{addResources.onsiteMenMasters+addResources.onsiteWomenMasters+addResources.offshoreMenMasters+addResources.offshoreWomenMasters }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeverageMasters" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenMasters+addResources.offshoreWomenMasters)/(addResources.onsiteMenMasters+addResources.onsiteWomenMasters+addResources.offshoreMenMasters+addResources.offshoreWomenMasters))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.womenRatioMasters">{{((addResources.onsiteWomenMasters+addResources.offshoreWomenMasters)/(addResources.onsiteMenMasters+addResources.onsiteWomenMasters+addResources.offshoreMenMasters+addResources.offshoreWomenMasters))*100}}</span></td>
								      	</tr>
								      	<tr>
								      		<td>Digital</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenDigital"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenDigital"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenDigital"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenDigital"> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOnsiteDigital">{{addResources.onsiteMenDigital+addResources.onsiteWomenDigital}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOffshoreDigital">{{addResources.offshoreMenDigital+addResources.offshoreWomenDigital}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOverallDigital">{{addResources.onsiteMenDigital+addResources.onsiteWomenDigital+addResources.offshoreMenDigital+addResources.offshoreWomenDigital }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeverageDigital" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenDigital+addResources.offshoreWomenDigital)/(addResources.onsiteMenDigital+addResources.onsiteWomenDigital+addResources.offshoreMenDigital+addResources.offshoreWomenDigital))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.womenRatioDigital">{{((addResources.onsiteWomenDigital+addResources.offshoreWomenDigital)/(addResources.onsiteMenDigital+addResources.onsiteWomenDigital+addResources.offshoreMenDigital+addResources.offshoreWomenDigital))*100}}</span></td>
								      	</tr>
								      	<tr>
								      		<td>Non Prod Services</td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenNonProdServices"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenNonProdServices"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenNonProdServices"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenNonProdServices"> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOnsiteNonProdServices">{{addResources.onsiteMenNonProdServices+addResources.onsiteWomenNonProdServices}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOffshoreNonProdServices">{{addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.totalOverallNonProdServices">{{addResources.onsiteMenNonProdServices+addResources.onsiteWomenNonProdServices+addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices }}</span> </td>
								      		<td style = "background-color: rgb(255,79,79);"><span id="testingInput2" ng-model="addResources.offshoreLeverageNonProdServices" style = "background-color: rgb(255,79,79);">{{((addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices)/(addResources.onsiteMenNonProdServices+addResources.onsiteWomenNonProdServices+addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices))*100}}</span> </td>
								      		<td><span id="testingInput2" ng-model="addResources.womenRatioNonProdServices">{{((addResources.onsiteWomenNonProdServices+addResources.offshoreWomenNonProdServices)/(addResources.onsiteMenNonProdServices+addResources.onsiteWomenNonProdServices+addResources.offshoreMenNonProdServices+addResources.offshoreWomenNonProdServices))*100}}</span></td>
								      	</tr>
								      	<tr>
								      		<td style = "text-align : center; background-color: #C1E1A7;">TOTAL</td>
								      		<td><span id="testingInput2" style = "text-align : center;" disabled>{{addResources.onsiteMenSharedService+addResources.onsiteMenSupplyChain+addResources.onsiteMenEnterpriseApps+addResources.onsiteMenGFS+addResources.onsiteMenPerformance+addResources.onsiteMenStores+addResources.onsiteMenSAPAT+addResources.onsiteMenMasters+addResources.onsiteMenDigital+addResources.onsiteMenNonProdServices}}</span></td>
								      		<td><span id="testingInput2" style = "text-align : center;" disabled>{{addResources.offshoreMenSharedService+addResources.offshoreMenSupplyChain+addResources.offshoreMenEnterpriseApps+addResources.offshoreMenGFS+addResources.offshoreMenPerformance+addResources.offshoreMenStores+addResources.offshoreMenSAPAT+addResources.offshoreMenMasters+addResources.offshoreMenDigital+addResources.offshoreMenNonProdServices}}</span></td>
								      		<td><span id="testingInput2" style = "text-align : center;" disabled>{{addResources.onsiteWomenSharedService+addResources.onsiteWomenSupplyChain+addResources.onsiteWomenEnterpriseApps+addResources.onsiteWomenGFS+addResources.onsiteWomenPerformance+addResources.onsiteWomenStores+addResources.onsiteWomenSAPAT+addResources.onsiteWomenMasters+addResources.onsiteWomenDigital+addResources.onsiteWomenNonProdServices}}</span></td>
								      		<td><span id="testingInput2" style = "text-align : center;" disabled>{{addResources.offshoreWomenSharedService+addResources.offshoreWomenSupplyChain+addResources.offshoreWomenEnterpriseApps+addResources.offshoreWomenGFS+addResources.offshoreWomenPerformance+addResources.offshoreWomenStores+addResources.offshoreWomenSAPAT+addResources.offshoreWomenMasters+addResources.offshoreWomenDigital+addResources.offshoreWomenNonProdServices}}</span></td>
								      		<td style = "text-align : center; background-color: #C1E1A7;"><input id="testingInput2" type="number" placeholder="0" disabled style = "background-color: #C1E1A7;"></td>
								      		<td style = "text-align : center; background-color: #C1E1A7;"><input id="testingInput2" type="number" placeholder="0" disabled style = "background-color: #C1E1A7;"></td>
								      		<td style = "text-align : center; background-color: #C1E1A7;"><input id="testingInput2" type="number" placeholder="0" disabled style = "background-color: #C1E1A7;"></td>
								      		<td style = "text-align : center; background-color: rgb(255,79,79);"><input id="testingInput2" type="number" placeholder="0%" disabled style = "background-color: rgb(255,79,79);"></td>
								      		<td style = "text-align : center; background-color: #C1E1A7;"><input type="number" id="testingInput2" placeholder="0%" disabled style = "background-color: #C1E1A7;"></td>
								      	</tr>
                                      </tbody>
								  </table>
						</div>
						<div style="float:right;">
										<div class="col-lg-1"style="margin-right: 28%;" >
								  			<button type="button" class="btn btn-primary submitBtn" >SAVE</button>
					            		</div>
										<div class="col-lg-1" style="margin-right: 23%;" >
			              					<button type="button" class="btn btn-primary cancel" >CANCEL</button>
										</div>
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
