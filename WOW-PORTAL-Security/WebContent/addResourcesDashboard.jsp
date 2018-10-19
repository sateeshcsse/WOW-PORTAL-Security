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
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>
<script src="js/angular-1.4.7/angular.js"></script>
<script src="js/toastr.min.js"></script>
<script type="text/javascript" src="js/angular-toastr.js"></script>
<script type="text/javascript" src="js/angular-toastr.tpls.min.js"></script>

<script>

var app = angular.module('resourceApp', ['toastr']);

app.filter('numberFixedLen', function () {
    return function (n, len) {
        var num = parseInt(n, 10);
        len = parseInt(len, 10);
        if (isNaN(num) || isNaN(len)) {
            return n;
        }
        num = ''+num;
        while (num.length < len) {
            num = '0'+num;
        }
        console.log(parseFloat(num))
        return parseFloat(num);
    };
});

app.factory('LoadResourceService',function($http){
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
	
});


app.factory('SaveResourceService', ['$http', function($http) {

    var factory = {
        saveResourceData: function(addResources) {
        	addResources = angular.toJson(addResources);
            var data2 = $http({
                method: 'POST',
                url: 'saveResourceData.do',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                data: addResources
            }).then(function(response) {
               
                     return response.data;

            });
            return data2;
        }
    };
    console.log('factory' + factory);
    return factory;
}]);

app.directive('ngConfirmClick', [
                                 function(){
                                     return {
                                         link: function (scope, element, attr) {
                                             var msg = attr.ngConfirmClick || "Are you sure?";
                                             var clickAction = attr.confirmedClick;
                                             element.bind('click',function (event) {
                                                 if ( window.confirm(msg) ) {
                                                     scope.$eval(clickAction)
                                                 }
                                             });
                                         }
                                     };
                             }]);


app.controller('AppCtrl', function($scope,SaveResourceService,LoadResourceService) {
	$scope.addResources = {};
	$scope.init=function(){
		LoadResourceService.loadResourceData().then(function(data){
			
			console.log(data);
			 toastr.success(' Loaded successfully', 'Proceed With Reports Data', {
	       		  closeButton: true
	       		});
			$scope.addResources=data;
		});
	};
	$scope.save=function(resources){
		console.log(resources);
		resources.totalOffshoreLeverage=parseFloat(angular.element('.totalOffshoreLeverage').text());
		resources.totalWomenRatio=parseFloat(angular.element('.totalWomenRatio').text());
		var onsiteMen= parseInt(angular.element('.onsiteMenTotal').text());
		var offshoreMen=parseInt(angular.element('.offshorMenTotal').text());
		var onsieWomen=parseInt(angular.element('.onsiteWomenTotal').text());
		var offshoreWomen=parseInt(angular.element('.offshoreWomenTotal').text());
		resources.totalOnsite=onsiteMen+onsieWomen;
		resources.totalOffshore=offshoreMen+offshoreWomen;
		resources.totalMen=onsiteMen+offshoreMen;
		
		resources.totalWomen=onsieWomen+offshoreWomen;
		
		SaveResourceService.saveResourceData(resources).then(function(data){
			 toastr.success('Saved successfully', 'Proceed With Reports Data', {
       		  closeButton: true
       		});
		}).catch(function(response) {
			 toastr.error('Failed', 'Please Try Again', {
	       		  closeButton: true
	       		});
		});
	};
	
	$scope.gotoHome = function() {
		window.location.href="home.jsp";
	}
	
	
});
</script>
<script>
$(document).ready(function(){
		$("#testingInput2").keydown(function (e) {
    	// Allow: backspace, delete, tab, escape, enter and .
    	if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
         // Allow: Ctrl+A, Command+A
        (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
         // Allow: home, end, left, right, down, up
        (e.keyCode >= 35 && e.keyCode <= 40)) {
             // let it happen, don't do anything
             return;
    	}
    	// Ensure that it is a number and stop the keypress
    	if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        	e.preventDefault();
		}
		});
});
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
    width:20%;
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
.applyGreen {
	background-color: green;
}
.applyRed {
	background-color: rgb(255,79,79);
}
</style>

</head>

<body ng-app="resourceApp" ng-controller="AppCtrl" ng-init="init()" ng-cloak>
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
                        <div class="col-sm-10 col-md-10 col-lg-10"> <label style="margin-left: 25%;"> ADD RESOURCES </label> </div>
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
								      		<td><p class="leftAlign">Shared Service</p></td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteMenSharedService"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreMenSharedService"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.onsiteWomenSharedService"> </td>
								      		<td><input id="testingInput2" type="number" placeholder="0"step="1" ng-model="addResources.offshoreWomenSharedService"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenSupplyChain" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenSupplyChain" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenSupplyChain" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenSupplyChain" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenEnterpriseApps" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenEnterpriseApps" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenEnterpriseApps" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenEnterpriseApps" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenGFS" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenGFS" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenGFS" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenGFS" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenPerformance" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenPerformance" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenPerformance" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenPerformance" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenStores" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenStores" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenStores" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenStores" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenSAPAT" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenSAPAT" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenSAPAT" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenSAPAT" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenRunit" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenRunit" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenRunit" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenRunit" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenDigital" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenDigital" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenDigital" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenDigital" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenNonProdServices" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenNonProdServices" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenNonProdServices" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenNonProdServices" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
								      		<td><input id="testingInput2" ng-model="addResources.onsiteMenOthers" type="number" placeholder="0"  step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreMenOthers" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.onsiteWomenOthers" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		<td><input id="testingInput2" ng-model="addResources.offshoreWomenOthers" type="number" placeholder="0" step="1" min="0" value="0"> </td>
								      		
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
											<td class= "onsiteMenTotal" style="padding-right: 2%;"><input id="testingInput2" type="number" disabled>{{addResources.onsiteMenSharedService+addResources.onsiteMenRunit+addResources.onsiteMenSupplyChain+addResources.onsiteMenEnterpriseApps+addResources.onsiteMenGFS+addResources.onsiteMenPerformance+addResources.onsiteMenStores+addResources.onsiteMenSAPAT+addResources.onsiteMenDigital+addResources.onsiteMenNonProdServices+addResources.onsiteMenOthers}}</td>
								      		<td class= "offshorMenTotal" style="padding-right: 2%;"><input id="testingInput2" type="number" disabled>{{addResources.offshoreMenSharedService+addResources.offshoreMenRunit+addResources.offshoreMenSupplyChain+addResources.offshoreMenEnterpriseApps+addResources.offshoreMenGFS+addResources.offshoreMenPerformance+addResources.offshoreMenStores+addResources.offshoreMenSAPAT+addResources.offshoreMenDigital+addResources.offshoreMenNonProdServices+addResources.offshoreMenOthers}}</td>
								      		<td class= "onsiteWomenTotal" style="padding-right: 2%;"><input id="testingInput2" type="number" disabled>{{addResources.onsiteWomenSharedService+addResources.onsiteWomenRunit+addResources.onsiteWomenSupplyChain+addResources.onsiteWomenEnterpriseApps+addResources.onsiteWomenGFS+addResources.onsiteWomenPerformance+addResources.onsiteWomenStores+addResources.onsiteWomenSAPAT+addResources.onsiteWomenDigital+addResources.onsiteWomenNonProdServices+addResources.onsiteWomenOthers}}</td>
								      		<td class= "offshoreWomenTotal" style="padding-right: 2%;"><input id="testingInput2" type="number" disabled>{{addResources.offshoreWomenSharedService+addResources.offshoreWomenRunit+addResources.offshoreWomenSupplyChain+addResources.offshoreWomenEnterpriseApps+addResources.offshoreWomenGFS+addResources.offshoreWomenPerformance+addResources.offshoreWomenStores+addResources.offshoreWomenSAPAT+addResources.offshoreWomenDigital+addResources.offshoreWomenNonProdServices+addResources.offshoreWomenOthers}}</td>
								      		
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
						<div style="float:right;">
										<div class="col-sm-1 col-md-1 col-lg-1"style="margin-right: 28%;" >
								  			<button type="button" ng-click="save(addResources)" class="btn btn-primary submitBtn">SAVE</button>
					            		</div>
										<div class="col-sm-1 col-md-1 col-lg-1" style="margin-right: 23%;" >
			              					<button type="button" class="btn btn-primary cancel" confirmed-click="gotoHome()" 
    ng-confirm-click="Would you like to cancel?">CANCEL</button>
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
