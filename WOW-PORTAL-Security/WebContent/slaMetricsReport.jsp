<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SLA Metrics Report</title> 
<!-- <link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon" /> -->
<link rel="stylesheet" href="styles/animations.css">
<link href="styles/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="styles/skeleton.css" rel="stylesheet" type="text/css" />
<link href="styles/jqueryUI.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="styles/Home.css">
<link rel="stylesheet" href="styles/metisMenu.min.css">
<link rel="stylesheet" href="styles/sideBar.css">
<link rel="stylesheet" href="styles/reportArea.css">
<link rel="stylesheet" href="styles/dataTables.bootstrap.css">
<link rel="stylesheet" href="styles/ngDialog.css">
<link rel="stylesheet" href="styles/ngDialog-theme-default.css">

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.scrollify.js"></script>

<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>


<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/angular-1.4.7/angular-animate.js" ></script>
<script src="js/ngDialog.js" ></script>
<script type="text/javascript" src="js/simplePagination.js"></script>
<script type="text/javascript" src="js/dirPagination.js"></script>

<script type="text/javascript" src="js/html2canvas.js"></script>
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
$(document).ready(function(){
	$("#sel1").val('ALL');
	$("#sel4").val('ALL');
	$("#sel2").val('2016');
	$('#slaDefinitionLabels').click(function(){
		window.open('SLAMetricsDefinitions.jsp','_blank');
	});
});
</script>
<script>
var SLAMetricsReportsApp= angular.module('SLAMetricsReport',['ngDialog','simplePagination','angularUtils.directives.dirPagination']);
SLAMetricsReportsApp.directive('tableValue',function($q, $http, $templateCache,$compile,Pagination){
	
	return{
		restrict:'A',
		replace:true,
		scope:{
			results:'=bindingFoo'			
		},
		template:'<tr align="right" ng-repeat="result in results" ng-class="{ \'fa-slide-up\': !showMe, \'fa-slide-down\': showMe }" ><div><td ng-click="openInputSLAScreen(result.portfolioname, result.projname)" id="greenBackground"> {{result.projname}} </td><td class="alignCenter">{{(result.testEffectiveness | number : 2) || 0}}</td><td class="alignCenter">{{(result.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(result.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(result.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(result.failureRate| number:2) || 0}}</td></div></tr>',

	};
}); 
 
 SLAMetricsReportsApp.directive('tableValueEnter',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforEnter:'=bindingEnterprise'			
			},
			template:'<tr align="right" ng-repeat="resultforEnter in resultsforEnter" ng-class="{ \'fa-slide-up\': !showMeEnter, \'fa-slide-down\': showMeEnter }"><div><td ng-click="openInputSLAScreen(resultforEnter.portfolioname, resultforEnter.projname)" id="greenBackground"> {{resultforEnter.projname}} </td><td class="alignCenter">{{(resultforEnter.testEffectiveness | number:2) || 0}}</td><td class="alignCenter">{{(resultforEnter.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforEnter.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(resultforEnter.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforEnter.failureRate| number:2) || 0}}</td></div></tr>',
			

		};
	}); 

 SLAMetricsReportsApp.directive('tableValueGfs',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforGFS:'=bindingGfs'			
			},
			template:'<tr align="right" ng-repeat="resultsforGFSS in resultsforGFS" ng-class="{ \'fa-slide-up\': !showMeGFS, \'fa-slide-down\': showMeGFS }" ><div><td ng-click="openInputSLAScreen(resultsforGFSS.portfolioname, resultsforGFSS.projname)" id="greenBackground"> {{resultsforGFSS.projname}} </td><td class="alignCenter">{{(resultsforGFSS.testEffectiveness | number:2) || 0}}</td><td class="alignCenter">{{(resultsforGFSS.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultsforGFSS.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(resultsforGFSS.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultsforGFSS.failureRate| number:2) || 0}}</td></div></tr>',
			
		};
	}); 
 
 SLAMetricsReportsApp.directive('tableValueInfra',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforInfra:'=bindingInfra'			
			},
			template:'<tr align="right" ng-repeat="resultsforInf in resultsforInfra" ng-class="{ \'fa-slide-up\': !showMeInfra, \'fa-slide-down\': showMeInfra }"><div><td ng-click="openInputSLAScreen(resultsforInf.portfolioname, resultsforInf.projname)" id="greenBackground"> {{resultsforInf.projname}} </td><td class="alignCenter">{{(resultsforInf.testEffectiveness | number:2) || 0}}</td><td class="alignCenter">{{(resultsforInf.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultsforInf.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(resultsforInf.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultsforInf.failureRate| number:2) || 0}}</td></div></tr>',
			
		};
	}); 

 SLAMetricsReportsApp.directive('tableValueMaster',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforMasters:'=bindingMaster'			
			},
			template:'<tr align="right" ng-repeat="resultsforMaster in resultsforMasters" ng-class="{ \'fa-slide-up\': !showMeMaster, \'fa-slide-down\': showMeMaster }" ><div><td ng-click="openInputSLAScreen(resultsforMaster.portfolioname, resultsforMaster.projname)" id="greenBackground"> {{resultsforMaster.projname}} </td><td class="alignCenter">{{(resultsforMaster.testEffectiveness | number:2) || 0}}</td><td class="alignCenter">{{(resultsforMaster.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultsforMaster.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(resultsforMaster.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultsforMaster.failureRate| number:2) || 0}}</td></div></tr>',
			
		};
	}); 
 
 SLAMetricsReportsApp.directive('tableValueRunit',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforRunit:'=bindingRunit'			
			},
			template:'<tr align="right" ng-repeat="resultforRunit in resultsforRunit" ng-class="{ \'fa-slide-up\': !showMeRunit, \'fa-slide-down\': showMeRunit }" ><div><td ng-click="openInputSLAScreen(resultforRunit.portfolioname, resultforRunit.projname)" id="greenBackground"> {{resultforRunit.projname}} </td><td class="alignCenter">{{(resultforRunit.testEffectiveness | number:2) || 0}}</td><td class="alignCenter">{{(resultforRunit.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforRunit.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(resultforRunit.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforRunit.failureRate| number:2) || 0}}</td></div></tr>',
			
		};
	}); 
 
 SLAMetricsReportsApp.directive('tableValueSap',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforSAP:'=bindingSap'			
			},
			template:'<tr align="right" ng-repeat="resultforSAP in resultsforSAP" ng-class="{ \'fa-slide-up\': !showMeSap, \'fa-slide-down\': showMeSap }" ><div><td ng-click="openInputSLAScreen(resultforSAP.portfolioname, resultforSAP.projname)" id="greenBackground"> {{resultforSAP.projname}} </td><td class="alignCenter">{{(resultforSAP.testEffectiveness | number:2) || 0}}</td><td class="alignCenter">{{(resultforSAP.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforSAP.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(resultforSAP.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforSAP.failureRate| number:2) || 0}}</td></div></tr>',
			
		};
	}); 
 
 SLAMetricsReportsApp.directive('tableValueStores',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforStores:'=bindingStores'			
			},
			template:'<tr align="right" ng-repeat="resultforStores in resultsforStores" ng-class="{ \'fa-slide-up\': !showMeStores, \'fa-slide-down\': showMeStores }" ><div><td ng-click="openInputSLAScreen(resultforStores.portfolioname, resultforStores.projname)" id="greenBackground"> {{resultforStores.projname}} </td><td class="alignCenter">{{(resultforStores.testEffectiveness | number:2) || 0}}</td><td class="alignCenter">{{(resultforStores.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforStores.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(resultforStores.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforStores.failureRate| number:2) || 0}}</td></div></tr>',
			
		};
	}); 
	
	 SLAMetricsReportsApp.directive('tableValueSecurity',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforSecurity:'=bindingSecurity'			
			},
			template:'<tr align="right" ng-repeat="resultforSecurity in resultsforSecurity" ng-class="{ \'fa-slide-up\': !showMeSecurity, \'fa-slide-down\': showMeSecurity }"><div><td ng-click="openInputSLAScreen(resultforSecurity.portfolioname, resultforSecurity.projname)" id="greenBackground"> {{resultforSecurity.projname}} </td><td class="alignCenter">{{(resultforSecurity.testEffectiveness | number:2) || 0}}</td><td class="alignCenter">{{(resultforSecurity.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforSecurity.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(resultforSecurity.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforSecurity.failureRate| number:2) || 0}}</td></div></tr>',
			
		};
	});
 
 
 SLAMetricsReportsApp.directive('tableValueSupply',function($q, $http, $templateCache,$compile){
		
		return{
			restrict:'A',
			replace:true,
			scope:{
				resultsforSupply:'=bindingSupply'			
			},
			template:'<tr align="right" ng-repeat="resultforSupply in resultsforSupply" ng-class="{ \'fa-slide-up\': !showMeSupply, \'fa-slide-down\': showMeSupply }"><div><td ng-click="openInputSLAScreen(resultforSupply.portfolioname, resultforSupply.projname)" id="greenBackground"> {{resultforSupply.projname}} </td><td class="alignCenter">{{(resultforSupply.testEffectiveness | number:2) || 0}}</td><td class="alignCenter">{{(resultforSupply.effortSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforSupply.defectRejection| number:2) || 0}}</td><td class="alignCenter">{{(resultforSupply.scheduleSlippage| number:2) || 0}}</td><td class="alignCenter">{{(resultforSupply.failureRate| number:2) || 0}}</td></div></tr>',
			
		};
	});
SLAMetricsReportsApp.controller('SLAMetricsReportController',function($scope,$http,Pagination){
	$scope.pagination = Pagination.getNew(2);
	$scope.loadAllProjects = function(portfolio){
		$http({
            method: 'GET',
            url: 'getProjects.do',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            params:{
            	'portfolio':portfolio
            	
            }
        }).success(function(result){
        	$scope.dropDownvals=result;
        	
        }).error(function(data){
        	toastr.error('Returned following error','Please Add data before Updating it ', {
      		  closeButton: true
      		});
        });
	}
	
	$scope.init=function(){
		fetchSLAReport("2016");
		$('.reportJpg').click(function(){
			$('#slaTitleScrenshot').css("visibility","visible");
			  saveAsJpeg();
		 });
		function saveAsJpeg()
		{
			var temp = window.open();
			$('#slaTitleScrenshot').css("visibility","visible");
		html2canvas($("#COQReportTable"), {
		onrendered: function(canvas) {
			temp.close();
			backToRotate();
		var myImage = canvas.toDataURL("image/jpeg");
		  window.open(myImage);
		  }
		});
		}
		function backToRotate() {
			$('#slaTitleScrenshot').css("visibility","hidden");
		}
	}
	
	$scope.openInputSLAScreen = function(portfolioSelected, project) {
		if(project == null || project!=="ALL") {
			var newWindow = window.open('addUpdateSLAMetricsView.jsp','_blank');
			newWindow.project = project;
			newWindow.portfolioSelected = portfolioSelected;
		}
	}
	
	$scope.search=function(project) {
		var portfolioSelected = $(".portfolioSelect").val(); // selected in drop down
		if(project == null || project!=="ALL") {
			$scope.openInputSLAScreen(portfolioSelected, project);
		} else {
			$("#COQReportTable tbody tr:not(:first-child) td:first-child").each(function() {
				if(portfolioSelected=="ALL") {
				location.reload();
				} 
				else if(portfolioSelected==$(this).text()) {
				   	$(this).parent().show();
				   }
				   else {
				   	$(this).parent().hide();
				   }
				});
		}
	}
	
	var fetchSLAReport = function(data) {
		$scope.showMe=false;
		$scope.showMeGFS=false;
		$scope.showMeEnter=false;
		$scope.showMeInfra=false;
		$scope.showMeMaster=false;
		$scope.showMeRunit=false;
		$scope.showMeSap=false;
		$scope.showMeStores=false;
		$scope.showMeSupply=false;
		$scope.showMeSecurity=false;
		$('#slaTable tr td:not(:first-child)').text('');
		var year;
		if(data==undefined) {
			year = 'Overall';
		} else {
			year = data;
		}
		$.ajax({ url: "getSlaReportData.do",
			type:'get',
			data:'year='+year,
	        context: document.body,
	        success: function(data){
	         
	           var data2=JSON.parse(data);
	        	var values=[];
	        	var keys=[];
	           $.each( data2, function( key, value ) {
	        	   keys.push(key);
	        	   values.push(value);
	        	 });
	           
	           for(var i=0;i<keys.length;i++){
	        	   var trVal=keys[i];
	        	   if(trVal==='ENTERPRISE APPLICATION'){
	        		   trVal='EnterpriseApplication';
	        	   }
	        	   else if(trVal==='SUPPLY CHAIN'){
	        		   trVal='SUPPLYCHAIN';
	        	   }
				    else if(trVal==='RUN IT'){
	        		   trVal='RUNIT';
	        	   }
	        	   var tdVals=values[i];
	        	   var temp=2;
	        	   for(var j=0;j<tdVals.length;j++){
	        		   if(tdVals[j]=="null" || tdVals[j]==undefined || !(tdVals[j])) {
							tdVals[j]='0';
						}
	        		  var value = parseFloat(tdVals[j]);
	        		   $('table .'+trVal+' td:nth-child('+temp+')').text(value.toFixed(2));
	        		   temp++;
	        	   }
	           }
	        }});
	}
	
	$scope.getSLAReportDataAng = function(year) {
		fetchSLAReport(year);
	}

 $scope.clickme=function(dataToSend){
		 
		 var year=$scope.year;
 if(year==undefined || year=="" || year==null){
	 year = "2016";
 }
		// alert(year);
		 function commonFN( bigarray){
			 
			  bigarray.map(function(i){if(i===''){console.log('$$$$$'); return 0;} else{return i;}});
			  console.log('GGGGGGGGGGGGGG'+bigarray);
			 var size = 10;
			 var jsonObj = [];
			 for (var i=0; i<bigarray.length; i++) {
				 var rowItem = {};
				    var smallarray = bigarray[i];
				    rowItem["portfolioname"] = smallarray[0];
				    rowItem["projname"] = smallarray[1];
				    rowItem["testEffectiveness"] = parseFloat(smallarray[2]);
				    rowItem["effortSlippage"] = parseFloat(smallarray[3]);
				    rowItem["defectRejection"] = parseFloat(smallarray[4]);
				    rowItem["scheduleSlippage"] = parseFloat(smallarray[5]);
				    rowItem["failureRate"] = parseFloat(smallarray[6]);
				    jsonObj.push(rowItem);
				 } 
			 return jsonObj;
		 }
		
	 $http({method: 'GET',params:{'portfolio': dataToSend,'year':year}, url: 'getProjectReport.do', cache: true}).then(function(result) {
		 $scope.resultdata=[];
		 $scope.results={};
		 $scope.results.resultdata= [];
		 var jsonObj = [];
		 
		 var bigarray=result.data;
		 jsonObj=commonFN(bigarray);
		
		 console.log(JSON.stringify(jsonObj));
		
		  
		   
		   console.log(jsonObj);
		   if(dataToSend==='DIGITAL'){
				 $scope.showMe=!$scope.showMe;
					$scope.showMeGFS=false;
					$scope.showMeEnter=false;
					$scope.showMeInfra=false;
					$scope.showMeMaster=false;
					$scope.showMeSap=false;
					$scope.showMeStores=false;
					$scope.showMeSupply=false;
					$scope.showMeRunit=false;
					$scope.showMeSecurity=false;
				 $scope.pagination = Pagination.getNew(2);
				 $scope.results = jsonObj;
			 }  else if(dataToSend==='ENTERPRISE APPLICATION'){
				 $scope.showMeEnter=!$scope.showMeEnter;
				 $scope.showMe=false;
					$scope.showMeGFS=false;
					$scope.showMeInfra=false;
					$scope.showMeMaster=false;
					$scope.showMeSap=false;
					$scope.showMeStores=false;
					$scope.showMeSupply=false;
					$scope.showMeRunit=false;
					$scope.showMeSecurity=false;
				 $scope.resultsforEnter =jsonObj;
			 } else if(dataToSend==='GFS'){
				 $scope.showMeGFS=!$scope.showMeGFS;
				 $scope.showMe=false;
					$scope.showMeEnter=false;
					$scope.showMeInfra=false;
					$scope.showMeMaster=false;
					$scope.showMeSap=false;
					$scope.showMeStores=false;
					$scope.showMeSupply=false;
					$scope.showMeRunit=false;
					$scope.showMeSecurity=false;
				 $scope.resultsforGFS = jsonObj;
			 }  else if(dataToSend==='INFRASTRUCTURE'){
				 $scope.showMeInfra=!$scope.showMeInfra;
				 $scope.showMe=false;
					$scope.showMeGFS=false;
					$scope.showMeEnter=false;
					$scope.showMeMaster=false;
					$scope.showMeSap=false;
					$scope.showMeStores=false;
					$scope.showMeSupply=false;
					$scope.showMeRunit=false;
					$scope.showMeSecurity=false;
				 $scope.resultsforInfra = jsonObj;
			 } else if(dataToSend==='MASTER'){
				 $scope.showMeMaster=!$scope.showMeMaster;
				 $scope.showMe=false;
					$scope.showMeGFS=false;
					$scope.showMeEnter=false;
					$scope.showMeInfra=false;
					$scope.showMeSap=false;
					$scope.showMeStores=false;
					$scope.showMeSupply=false;
					$scope.showMeRunit=false;
					$scope.showMeSecurity=false;
				 $scope.resultsforMasters = jsonObj;
			 } else if(dataToSend==='RUN IT'){
				 $scope.showMeRunit=!$scope.showMeRunit;
				 $scope.showMe=false;
					$scope.showMeGFS=false;
					$scope.showMeEnter=false;
					$scope.showMeInfra=false;
					$scope.showMeMaster=false;
					$scope.showMeSap=false;
					$scope.showMeStores=false;
					$scope.showMeSupply=false;
					$scope.showMeSecurity=false;
				 $scope.resultsforRunit =jsonObj;
			 } else if(dataToSend==='SAP'){
				 $scope.showMeSap=!$scope.showMeSap;
				 $scope.showMe=false;
					$scope.showMeGFS=false;
					$scope.showMeEnter=false;
					$scope.showMeInfra=false;
					$scope.showMeMaster=false;
					$scope.showMeStores=false;
					$scope.showMeSupply=false;
					$scope.showMeRunit=false;
					$scope.showMeSecurity=false;
				 $scope.resultsforSAP =jsonObj;
			 }  else if(dataToSend==='STORES'){
				 $scope.showMeStores=!$scope.showMeStores;
				 $scope.showMe=false;
					$scope.showMeGFS=false;
					$scope.showMeEnter=false;
					$scope.showMeInfra=false;
					$scope.showMeMaster=false;
					$scope.showMeSap=false;
					$scope.showMeSupply=false;
					$scope.showMeRunit=false;
					$scope.showMeSecurity=false;
				 $scope.resultsforStores = jsonObj;
			 } else if(dataToSend==='SUPPLY CHAIN'){
				 $scope.showMeSupply=!$scope.showMeSupply;
				 $scope.showMe=false;
					$scope.showMeGFS=false;
					$scope.showMeEnter=false;
					$scope.showMeInfra=false;
					$scope.showMeMaster=false;
					$scope.showMeSap=false;
					$scope.showMeStores=false;
					$scope.showMeRunit=false;
					$scope.showMeSecurity=false;
				 $scope.resultsforSupply = jsonObj;
			 } else if(dataToSend==='SECURITY'){
				 $scope.showMeSecurity=!$scope.showMeSecurity;
				 $scope.showMe=false;
					$scope.showMeGFS=false;
					$scope.showMeEnter=false;
					$scope.showMeInfra=false;
					$scope.showMeMaster=false;
					$scope.showMeRunit=false;
					$scope.showMeSap=false;
					$scope.showMeStores=false;
					$scope.showMeSupply=false;
				 $scope.resultsforSecurity = jsonObj;
			 }
		  
          });
	
 };
});
</script>

<style>
.reportJpg {
position: absolute;
width: 27px;
top: 10px;
/* right: 9px; */
left: 30px;
cursor: pointer;
}
#slaDefinitionLabels{
  color: #FF4500;
  font-size: 11px;
  font-weight: bold;
  cursor: pointer;
  top: 1px;
  position: relative;
  z-index: 30;
  font-size: small;
  margin-left: 2.5%;
  margin-bottom: 10px;
}
</style>
</head>
<body ng-app="SLAMetricsReport" ng-controller="SLAMetricsReportController" ng-init="init()">
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
		<a href="slaMetricsReport.jsp">
			<img src="images/icons/Reports Menu Icon Black.png" class="img2">
			SLA Metrics Report
		</a>
	</li>
    </ul>
    </div> 
		</div>
		</div>
    <div class="col-sm-10 col-md-10 col-lg-10">
	<div class="selectionArea">
					<div class="row1">
					<div class="col-sm-3 col-md-3 col-lg-3">
							<label for="sel1" class="control-label">Portfolio</label>
						</div>
						<div class="col-sm-5 col-md-5 col-lg-5">
								<label for="sel1">Project</label>
						</div>
					</div>
					<div class="row2">
					<div class="col-md-3">
							      <select ng-model="SLAMetricsReportValue.portfolio" ng-init="SLAMetricsReportValue.portfolio='Select'" ng-change="loadAllProjects(SLAMetricsReportValue.portfolio)" class="form-control portfolioSelect" id="sel1" style="margin-top: -3px;">
							      <option value="Select">Select</option>
									<option>ALL</option>
							        <option>DIGITAL</option>
                                    <option>ENTERPRISE APPLICATION</option>
                                    <option>GFS</option>
                                    <option>SAP</option>
                                    <option>SUPPLY CHAIN</option>
                                    <option>STORES</option>
									<option>RUN IT</option>
									<option>SECURITY</option>
							  </select>
							</div>
						<div class="col-md-4 projectSelectDiv">
							      <select  class="form-control projectSelect" ng-init="SLAMetricsReportValue.project='ALL'" ng-model="SLAMetricsReportValue.project" id="sel4" style="margin-top: -3px;" ng-options="v as v for (k,v) in dropDownvals">
							      	<option value="ALL">ALL</option>
							      </select>
						</div>
      						<div>
						<div class="col-lg-1" style="margin-right:10%;">
							<button type="button" class="btn btn-primary submitBtn" style="margin-top: -17px;" ng-click="search(SLAMetricsReportValue.project)">SUBMIT</button>
					</div>
					<div class="col-sm-1 col-md-1 col-lg-1">
						<div>
							<img class="reportJpg" src="images/quizReportJpg.png" style="margin-top: -21px;">
							</div>
						</div>
						
						</div>
					</div>
				</div>
	</div>
	
	</div>
	<div class="col-sm-12 col-md-12 col-lg-12 generationArea" id="generationArea" style="padding-bottom: 50px; margin-left: 0.5%;">
	<div class="col-sm-12 col-md-12 col-lg-12">
		<div class="col-sm-4 col-md-4 col-lg-4">
							  <div id="slaDefinitionLabels" style="float:left; color: #FF4500; margin-right:36px; margin-top: 16px;"> 
							SLA DEFINITIONS
                        </div>
                        </div>
                        <div class="col-sm-8 col-md-8 col-lg-8">
                        <div class="col-sm-3 col-md-3 col-lg-3 pull-right">
				      		<select ng-change="getSLAReportDataAng(year)" ng-model="year" class="form-control yearSelect" id="sel2" style="margin-top: -3px;">
                                    <option value="Overall">Overall</option>
                                    <option value="2016" selected>2016</option>
                                    <option value="2015">2015</option>
                                    <option value="2014">2014</option>
                                    <option value="2013">2013</option>
                                </select>
							</div>
                        <div class="col-sm-1 col-md-1 col-lg-1 pull-right">
								<label for="sel2">Year:</label>
						</div>
						
						</div>
						</div>
						
						
						<div class="col-sm-12 col-md-12 col-lg-12 COQReportTable" id ="COQReportTable" style="background-color: #F5F5F5;">
						<div class="col-sm-12 col-md-12 col-lg-12">
							  <div style="text-align:center; color: #8AC759; font-weight:bold; visibility: hidden;" id="slaTitleScrenshot"> 
							SLA METRICS REPORT
                        </div>
                        </div>
							<table class="table table-bordered" style="background-color: rgb(242,242,242);" id="slaTable">
								    <thead>
								      <tr class="TestingPart">
								        <th>PORTFOLIO / PROJECT</th>
								         <th>DEFECT SLIPPAGE (%)</th>
								        <th>EFFORT SLIPPAGE (%)</th>
								        <th>DEFECT REJECTION (%)</th>
								        <th>SCHEDULE SLIPPAGE (%)</th>
								        <th>FAILURE RATE (%)</th>
								      </tr>
								    </thead>
								    <tbody>
								    	<tr class="Total">
								    		<td  id="orangeBackground">OVERALL</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    	</tr>
								    	<tr ng-click="clickme('DIGITAL')" class="DIGITAL">
								    		<td id="blueBackground">DIGITAL</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    	</tr>
								    	<tr table-value binding-foo="results"></tr>								
								    	<tr ng-click="clickme('ENTERPRISE APPLICATION')" class="EnterpriseApplication" >
								    		<td id="blueBackground" >ENTERPRISE APPLICATION</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    	</tr>
								    	<tr table-value-enter binding-enterprise="resultsforEnter"></tr>		
								    	
								    	<tr ng-click="clickme('GFS')" class="GFS">
								    		<td id="blueBackground" >GFS</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    	</tr >
								    <tr table-value-gfs binding-gfs="resultsforGFS"></tr>	
							     	<tr ng-click="clickme('RUN IT')" class="RUNIT"> 
								    		<td id="blueBackground" >RUN IT</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    	</tr>
								    	 <tr table-value-runit binding-runit="resultsforRunit"></tr> 
								    	<tr ng-click="clickme('SAP')" class="SAP">
								    		<td id="blueBackground" >SAP</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    	</tr>
								    	<tr table-value-sap binding-sap="resultsforSAP"></tr>
										<tr ng-click="clickme('SECURITY')" class="SECURITY" >
								    		<td id="blueBackground" >SECURITY</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    	</tr>
								    	<tr table-value-security binding-security="resultsforSecurity"></tr>
								    	
								    	<tr ng-click="clickme('STORES')" class="STORES">
								    		<td id="blueBackground" >STORES</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    	</tr >
								    	<tr table-value-stores binding-stores="resultsforStores"></tr>
								    	<tr ng-click="clickme('SUPPLY CHAIN')" class="SUPPLYCHAIN">
								    		<td id="blueBackground" >SUPPLY CHAIN</td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    		<td></td>
								    	</tr>
								    	<tr table-value-supply binding-supply="resultsforSupply"></tr>
								    </tbody>
								  </table>
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
