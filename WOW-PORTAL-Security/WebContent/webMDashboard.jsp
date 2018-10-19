<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Store List Status </title> 
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
<link rel="stylesheet" href="styles/jqx.base.css">
<link rel="stylesheet" href="styles/jqGauge.css">
<link rel="stylesheet" href="<c:url value="/js/toastr.css"/>">

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/chart.js" type="text/javascript"> </script>
<script src="js/angularChart.js" type="text/javascript"> </script>
<script src="<c:url value="/js/toastr.min.js"/>"></script>
<script src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.13.0.js"></script>
<style>

table#slaTable tbody tr td:nth-child(1){
cursor:pointer;
text-align: center;
}
.ngdialog-overlay{
font-family: "Roboto Condensed", Arial, sans-serif;
}

#slaTable{
	text-align: center;
}
.alignCenter {
	text-align: center;
}

</style>
<script>
	angular.module('StoreStatusApp', ['chart.js'])
.config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
}])

.controller('StoreStatusController', function($scope,$http) {
  $scope.labelsSMKT = ["FINE", "ERROR"];
  $scope.getSMKTData=function(){
	  window.location.href="webmethodsDashboardStoreDetails.jsp?"+$scope.environment+"&"+$scope.wmtype+"&"+$scope.division;
  }
  
  
  
  
  	var storeList = [];

  
  
	$scope.init=function(){
		$scope.showValueonSuccess = true;
		var params = window.location.href;
		var tmp = params.split("?")[1].split("&");
		$scope.environment = tmp[0];
		$scope.webMethodsEnv = $scope.environment;		
		getStoreTableData($scope.environment)
		$scope.showValueonSuccess = true;
		//$("#env").val("SIT");
		
	};
	
	var appendtoTableFunc=function(storeListParam, env) {			
		var storeListProcess = [];
		storeListProcess = storeListParam;
		storeListProcess.unshift("")
		storeListParam=null		
		$("#storelistTableBody").empty();
			var url = "";
			var dataToAppendPrefix = "<tr style='text-align: center;'>";
			var dataToAppendPostfix = "</tr>";
			var dataToAppend="";					
			for(var i=1; i<storeListProcess.length; i++) {
				console.log("Store Number" +storeListProcess[i][0]+"   Availablity : "+storeListProcess[i][4]);
						
				 if(storeListProcess[i][4] === "Available")
					color1 = "#3f9f3f";
				else if(storeListProcess[i][4] === "Partially Available")
					color1 = "#FFA829";
				else  if(storeListProcess[i][4] === "Planned maintenance")
					color1 = "#C0C5CA";
				else
					color1 = "#FF4D4D";
				url = "webmethodsDashboardStoreDetails.jsp?"+storeListProcess[i][1]+"&"+storeListProcess[i][2]+"&"+storeListProcess[i][3]+"&"+storeListProcess[i][0];
				dataToAppend = dataToAppend + "<td style='background-color:"+color1+";'> <a style='color: black;' href="+url+">"+storeListProcess[i][0]+"</a></td>"
				 
				  if(i%10 === 0)
				{		var finalDataAppend = dataToAppendPrefix+dataToAppend+dataToAppendPostfix;				
					$("#storelistTable > tbody").append(finalDataAppend)
						dataToAppend="";
				} 
			}
			if(dataToAppend != null)
			{	
				var finalDataAppend = dataToAppendPrefix+dataToAppend+dataToAppendPostfix;
				$("#storelistTable > tbody").append(finalDataAppend)			
			}
		  toastr.remove()
		  toastr.success('Store Details Loaded Successfully!', 'Success', {
    		  closeButton: true
    		});
			storeListProcess=null;
			storeListParam=null;
	}
	
	

	var getStoreTableData=function(env) {
		 toastr.info('Please Wait', 'Loading...', {
    		  closeButton: true,
			  "progressBar": true,
    		});


	
		$("#storelistTableBody").empty();
		$http({
			url:'getAllStoreStatus.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){				
			storeList = results.data;
			refreshStoreData(env,"ALL","ALL")
			$scope.showValueonSuccess = false;			
		}, function myError(response) {
		toastr.remove()
		  toastr.error('Error in Loading the Data...', 'Error!!!', {
    		  closeButton: true
    		});
  });
	}
	
	
	var refreshStoreData = function(env, strType, division) {
		
		console.log("Inside Refresh Stored Data Env:" +env+ " Str Type:   "+strType+"   Division :"+division)
		//alert(storeList)
		var storeListFilteredStrType = [];		
		var storeListFilteredEnvDiv = [];
		if(env === "SIT" || env === "UAT")
		{
			for(var i=0; i<storeList.length; i++) {				
				if(storeList[i][1] === env)
				{									
					storeListFilteredEnvDiv.push(storeList[i])
				}
			}
		}
		else
		{
			for(var i=0; i<storeList.length; i++) {				
				if((storeList[i][1] != null) || (storeList[i][1] != undefined))
				{									
					storeListFilteredEnvDiv.push(storeList[i])
				}
			}
			
			//storeListFilteredEnvDiv = storeList;
		}
		console.log("ENV    "+storeListFilteredEnvDiv)
		if(strType === "R8" || strType === "R10")
		{
			for(var i=0; i<storeListFilteredEnvDiv.length; i++) {	
			
				if(storeListFilteredEnvDiv[i][2] === strType)
				{						
					storeListFilteredStrType.push(storeListFilteredEnvDiv[i])
				}
			}
		}
		else
		{
			storeListFilteredStrType = storeListFilteredEnvDiv;
		}
		//console.log("STR TYP    "+storeListFilteredStrType)
		
		if(division === "SUPER MARKET")
			division = "SMKT";
		if(division === "LIQUOR")
			division = "LIQ"
		if(division === "PETROL")
			division = "PET"
		storeListFilteredEnvDiv = [];
		if(division === "SMKT" || division === "LIQ" || division === "PET" || division === "PEL" || division === "LOGISTICS")
		{	
			for(var i=0; i<storeListFilteredStrType.length; i++) {	
			//console.log("1"+storeListFilteredStrType[i][3])
				if(storeListFilteredStrType[i][3] === division)
				{	
					//console.log("2"+storeListFilteredStrType[i][3])			
					storeListFilteredEnvDiv.push(storeListFilteredStrType[i])
				}
			}
		}
		else
		{
			storeListFilteredEnvDiv = storeListFilteredStrType;
		}
		//console.log("DIV     "+storeListFilteredEnvDiv)		
		console.log("\n\n\n\n\n")		
		//alert("dsf"+storeListFilteredEnvDiv);
		appendtoTableFunc(storeListFilteredEnvDiv)
	}
	
	$scope.refreshData = function(env, strType, division) {
		refreshStoreData(env,strType,division)
	}
	
	$scope.SearchByStoreNoFunc = function(keyEvent, storeNumber) {	
	
  if (keyEvent.which === 13)
	  var storeFound = false;
    for(var i=0; i<storeList.length; i++) {
	
		if(storeList[i][0] == storeNumber)
		{	
			var url = "webmethodsDashboardStoreDetails.jsp?"+storeList[i][1]+"&"+storeList[i][2]+"&"+storeList[i][3]+"&"+storeList[i][0];
			storeFound = true;
			window.location= "webmethodsDashboardStoreDetails.jsp?"+storeList[i][1]+"&"+storeList[i][2]+"&"+storeList[i][3]+"&"+storeList[i][0];
			
		}			
	}
	if(storeFound==false)
	{
		 toastr.remove()
		  toastr.error('Please Check the Store Number Entered', 'Oops!!! Store Not Found', {
    		  closeButton: true
    		});
	}
				
}
	
})
</script>
</head>
<body ng-app="StoreStatusApp" ng-controller="StoreStatusController" ng-init="init()">
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
	<div class="sideBarArea">
	<div class="col-sm-2 col-md-2 col-lg-2">
	 <div class="sideBar">
    <ul class="metismenu" id="menu">
    <li class="pageNameMenu sideMenu">
		<a href="webmethodsDashboardStoreStatus.jsp">
			<img src="images/icons/Reports Menu Icon Black.png" class="img2">
			Store List Status
		</a>
	</li>
    </ul>
    </div> 
		</div>
		<div class="col-sm-8 col-md-8 col-lg-8">
		<div style="text-align: center; color: #8AC759; font-weight: bolder; font-size: x-large; margin-top: 2%;"> 
			WEB METHODS DASHBOARD
                        </div>
                </div>					
		</div>
    </div>
	<br>
	<br>
	<div  class="col-sm-12 col-md-12 col-lg-12">
	<div  class="col-sm-2 col-md-2 col-lg-2">
	<label for="evn" class="control-label" style="margin-left: 20px;">Environment</label>
				  <select ng-model="webMethodsEnv" ng-disabled="showValueonSuccess" class="form-control WebMEnvironment" id="env" style="margin-left: 20px;">
							   
									<option value="ALL">ALL</option>
							        <option value="SIT">SIT</option>
                                    <option value="UAT">UAT</option>                                   
							  </select>
	</div>
	
		<div  class="col-sm-2 col-md-2 col-lg-2">
	<label for="evn" class="control-label" style="margin-left: 20px;">Store Type</label>
				  <select ng-model="webMethodsStrType" ng-disabled="showValueonSuccess" ng-init="webMethodsStrType='ALL'"  class="form-control WebMStrType" id="env" style="margin-left: 20px;">
							     
									<option value="ALL">ALL</option>
							        <option>R8</option>
                                    <option>R10</option>                                   
							  </select>
	</div>
	
		<div  class="col-sm-2 col-md-2 col-lg-2">
	<label for="evn" class="control-label" style="margin-left: 20px;">Division</label>
				  <select ng-model="webMethodsDivision" ng-disabled="showValueonSuccess" ng-init="webMethodsDivision='ALL'"  class="form-control WebMDiv" id="division" style="margin-left: 20px;">
									<option value="ALL">ALL</option>
							        <option>SUPER MARKET</option>
                                    <option>PEL</option>  
									<option>LIQUOUR</option>  
									<option>PETROL</option>
									<option>LOGISTICS</option>  
							  </select>
	</div>	

	
	<div  class="col-sm-2 col-md-2 col-lg-2">
	<button type="button" class="btn btn-primary submitBtn" style="margin-top: 18px; margin-left: 15px !important;" ng-disabled="showValueonSuccess" ng-click="refreshData(webMethodsEnv, webMethodsStrType, webMethodsDivision)">SEARCH</button>
	</div>

	<div  class="col-sm-1 col-md-1 col-lg-1">
	
	</div>	
	
	<div  class="col-sm-3 col-md-3 col-lg-3">
	<label for="storeNumber" class="control-label" style="margin-left: 45%;">Search By Store No.</label>
	<input ng-model="webMethodsStoreNumber" ng-disabled="showValueonSuccess" ng-keypress="SearchByStoreNoFunc($event, webMethodsStoreNumber)" class="form-control SearchByStoreNo" style="margin-left: 45%; width:50%;" type="number">

	</div>	
	
	
	
	
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="col-sm-12 col-md-12 col-lg-12 generationArea" id="generationArea" style="padding-bottom: 50px; margin-left: 0.5%;">
		<div class="col-sm-12 col-md-12 col-lg-12 COQReportTable" id ="COQReportTable">
			<div class="col-sm-12 col-md-12 col-lg-12">
				        </div>
												
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table class="table table-bordered" style="background-color: rgb(242,242,242);" id="storelistTable">
								<thead>
									<tr class="TestingPart">
										<th colspan = "10">Store List</th>
								    </tr>
								</thead>
								<tbody id="storelistTableBody">
									<!-- <tr> {{storeList}} </tr> -->
								</tbody>
							</table>
							</div>	
								
						</div>
						
						<div class="modal"><!-- Place at bottom of page --></div>
						
				</div>
		</div>
	</div>
	</div>
	</div>
	</form>
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
