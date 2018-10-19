<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add/Update SLA Metrics</title> 
 <link rel="shortcut icon" href="<c:url value="/images/logo/favicon.ico"/>" type="image/x-icon" />
<link rel="stylesheet" href="<c:url value="/styles/animations.css"/>">
<link href=" <c:url value="/styles/bootstrap.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/styles/skeleton.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/styles/jqueryUI.css"/>"  rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<c:url value="/styles/Home.css"/>" >
<link rel="stylesheet" href=" <c:url value="/styles/metisMenu.min.css"/>">
<link rel="stylesheet" href=" <c:url value="/styles/sideBar.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/reportArea.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/dataTables.bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/angular-material.min.css"/>">
 <link rel="stylesheet" href="<c:url value="/js/toastr.css"/>">
<script src="<c:url value="/js/jquery-1.11.3.min.js"/>" ></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>" ></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/js/metisMenu.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.bootstrap.js"/>"></script>
<script src="<c:url value="/js/angular-1.4.7/angular.js"/>"></script>
<script src="<c:url value="/js/angular-material.min.js"/>"></script>
<script src="<c:url value="/js/toastr.min.js"/>"></script>
<script src="<c:url value="/js/moment.js"/>"></script>
<style>
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}
button, html, input, select, textarea {
	font-family: "Roboto Condensed", Arial, sans-serif ! important;
}
select {
	text-align: center ! important;
}
input[type=number]:disabled{
cursor:not-allowed
}
textarea:disabled{
cursor:not-allowed
}



#sit_planned_period_from {
	margin-left: -25%;
}
#sit_planned_period_to {
	margin-left: -25%;
}
#sit_actual_period_from {
	margin-left: -25%;
}
#sit_actual_period_to {
	margin-left: -25%;
}

.performanceKeysLabel {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-size: 16px;
    margin-top: 3px;
}
.form-control {
	padding : 0px ! important;
}
.ui-datepicker-trigger {
    position: relative ! important;
}
.mandatory:after { content:"*"; }
::-webkit-input-placeholder {
   text-align: center;
}

:-ms-input-placeholder {  
   text-align: center; 
}
input{
    text-align:center;
    width: 85%;
}
textarea-placeholder {
	vertical-align: bottom;
}
@media only screen and (min-width:1200px) and (max-width:1360px) {.addUpdate-Update {margin-left:-1% ! important;}}
@media only screen and (min-width:1361px) and (max-width:2500px) {.addUpdate-Update {margin-left:8% ! important;}}

.performanceKeys thead tr:nth-child(2) th,.executionStatus thead tr:nth-child(2) th,.riskAndIssues thead tr:nth-child(2) th,.defectStatus thead tr:nth-child(2) th,.defectStatusUAT thead tr:nth-child(2) th,.sitRootCauseAnalysis thead tr:nth-child(2) th,.uatRootCauseAnalysis thead tr:nth-child(2) th,.rootCauseStatus thead tr:nth-child(2) th{
background-color: #C1E1A7;	
}
 textarea {
    resize: none;
}
.calender {
   width: 29px;
    height: 44%;
    border: none;
}
::-webkit-input-placeholder {
   text-align: left;
}

:-moz-placeholder { /* Firefox 18- */
   text-align: left;  
}

::-moz-placeholder {  /* Firefox 19+ */
   text-align: left;  
}

:-ms-input-placeholder {  
   text-align: left; 
}
.setGreenColor {
	background-color : rgb(0,176,80);
}
.setAmberColor {
	background-color : rgb(255,255,0);
}
.setRedColor {
	background-color : rgb(255,77,77);
}
</style>

<script>
$(document).ready(function(){
	$("#projectDetailsTable tbody tr:nth-child(1)").css("font-weight", "bold");
	$("#projectDetailsTable").css("text-align","center");
	$("#defectCountTable tbody tr:nth-child(1)").css("font-weight", "bold");
	$("#defectCountTable").css("text-align","center");
	$("#rootCauseTable tbody tr:nth-child(1)").css("font-weight", "bold");
	$("#rootCauseTable").css("text-align","center");
});
</script>

<script>
var SLAMetricsApp= angular.module('addUpdateSLAMetrics',[]);
SLAMetricsApp.directive('datepicker', function() {
    return {
        restrict: 'A',
        require : 'ngModel',
        link : function (scope, element, attrs, ngModelCtrl) {
            attrs.$observe('loaded',function(val){
				var dateToday = new Date(); 
				var date = dateToday.getDate();
				
              element.datepicker({
				dateFormat: 'yy-mm-dd',
                  showStatus: true,
                  buttonImageOnly: true,
				  showOn: "button",
                  buttonImage : "images/icons/calender.png",
                  showWeeks: true,
                  highlightWeek: true,
				  //minDate: (-date+1),
                //  maxDate: 0,
                  numberOfMonths: 1,
                  showAnim: "scale",
                  showOptions: { origin: ["bottom", "right"] },
                  onSelect: function (date) {
                      /* if (this.id === "sit_planned_period_from") {
                         $("#sit_planned_period_from").datepicker("option", "minDate", date);
                      } */
                      /* if (this.id === "MessageDateFrom_UAT") {
                          $("#MessageDateTo_UAT").datepicker("option", "minDate", date);
                       } */
                      ngModelCtrl.$setViewValue(date);
                      scope.$apply();
                  }
              });
            })
              
        }
    }
});
SLAMetricsApp.controller('SLAMetricsController',function($scope,$http){
	$scope.SLAMetricsValue={};
	$scope.SLAMetricsValue.allow = true;
	$scope.finalSubmition = function(SLAMetricsValue) {
		console.log("SLAMetricsValue---------------------"+SLAMetricsValue);
		if(($scope.scheduleSlippage>5 || $scope.actualSlippage>5) && (SLAMetricsValue.comments_project_details=="")) {
			toastr.error('Failed', 'Please enter Project Detailed Comments', {
	       		  closeButton: true
	       		});
			return;
		} else if(($scope.sitTestEffectiveness>5 || $scope.uatTestEffectiveness>5 || $scope.prodTestEffectiveness>5 || $scope.sitFailureRate<10 || $scope.uatFailureRate<10 || $scope.prodFailureRate<10)&& $scope.def_comments=="") {
			toastr.error('Failed', 'Please enter Defect Count Comments', {
	       		  closeButton: true
	       		});
			return;
		}  else if(($scope.sitDefectRejection>11 || $scope.uatDefectRejection>11 || $scope.prodDefectRejection>11) && $scope.root_comments=="") {
			toastr.error('Failed', 'Please enter Root Cause Comments', {
	       		  closeButton: true
	       		});
			return;
		} else {
			$http({
	             method: 'POST',
	             url: 'postSlaDetails.do',
	             headers: {
	                 'Content-Type': 'application/json; charset=UTF-8'
	             },
	             data: SLAMetricsValue
	         }).success(function(){
	        		$scope.showVals=false;
	        		 toastr.success('Success', 'Updated successfully', {
		        		  closeButton: true
		        		});
	        		 })
		        .error(function(){
		        	toastr.error('Error', 'Try Updating It', {
		        		  closeButton: true
		        		});
		        });
		}
		 
	}
	
	$scope.setSlippageColor = function(value) {
		if(value<=5 && value>0)
			return "setGreenColor";
		else if(value>5 && value<=15)
			return "setAmberColor";
		else if(value>15)
			return "setRedColor";
	}
	
	$scope.setFailureColor = function(value) {
		if(value>=10)
			return "setGreenColor";
		else if(value<10 && value>0)
			return "setAmberColor";
	}
	
	$scope.setDefectRejectionColor = function(value) {
		if(value<=11 && value>0)
			return "setGreenColor";
		else if(value>11 && value<=15)
			return "setAmberColor";
		else if(value>15)
			return "setRedColor";
	}
	
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
	
	
	var flatoutJson=function(data){
		  var result = {};
console.log('###########'+data);
		    function recurse(cur, prop) {
		        if (Object(cur) !== cur) {
		            result[prop] = cur;
		        } else if (Array.isArray(cur)) {
		            for (var i = 0, l = cur.length; i < l; i++)
		            recurse(cur[i], prop + "[" + i + "]");
		            if (l == 0) result[prop] = [];
		        } else {
		            var isEmpty = true;
		            for (var p in cur) {
		                isEmpty = false;
		                recurse(cur[p], prop ? prop + "." + p : p);
		            }
		            if (isEmpty && prop) result[prop] = {};
		        }
		    }
		    recurse(data, "");
		    
		    console.log('###########'+result)
		    return result;
	}
	
	
	$scope.fetchSLADetails = function(portfolio,project) {
		$http({
            method: 'GET',
            url: 'getSla.do',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            params:{
            	'portfolio': portfolio,
            	'project': project
            	
            }
        }).success(function(data){
        	$scope.SLAMetricsValue.allow = false;
    	  var result=flatoutJson(data);
    	 
    	  var temp = {};
    	  for (var key in result) {
    		  if (result.hasOwnProperty(key)) {
    			  if(key.includes(".")) {
    		    		var key1 = key.split(".")[1];
    		    		
    		    		temp.key1 = key1;
    		    		temp[key1] = result[key];
    			  } else {
    				  temp.key = key;
  		    		temp[key] = result[key];
    			  }
    		  }
    		}
    	  
    	  
    	    console.log("temppppppppppppppp"+angular.toJson(temp));
    	    if(temp)
    			$scope.SLAMetricsValue=temp;
    	    else 
    	    	$scope.SLAMetricsValue = {};
    	    $scope.calculateSlippage();
    	//console.log('$scope.SLAMetricsValue'+$scope.SLAMetricsValue);
    }).error(function(data){
    	
    	toastr.success('Created successfully', 'Proceed With SLA Data', {
     		  closeButton: true
     		});
        });
		var portfolio = $scope.SLAMetricsValue.portfolio;
    	var project = $scope.SLAMetricsValue.project;
    	$scope.SLAMetricsValue = {};
		$scope.SLAMetricsValue.portfolio = portfolio;
		$scope.SLAMetricsValue.project = project;
	}
	function workingDaysBetweenDates(startDate, endDate) {
		  
	    // Validate input
	    if (endDate < startDate)
	        return 0;
	    
	    // Calculate days between dates
	    var millisecondsPerDay = 86400 * 1000; // Day in milliseconds
	    startDate.setHours(0,0,0,1);  // Start just after midnight
	    endDate.setHours(23,59,59,999);  // End just before midnight
	    var diff = endDate - startDate;  // Milliseconds between datetime objects    
	    var days = Math.ceil(diff / millisecondsPerDay);
	    
	    // Subtract two weekend days for every week in between
	    var weeks = Math.floor(days / 7);
	    days = days - (weeks * 2);

	    // Handle special cases
	    var startDay = startDate.getDay();
	    var endDay = endDate.getDay();
	    
	    // Remove weekend not previously removed.   
	    if (startDay - endDay > 1)         
	        days = days - 2;      
	    
	    // Remove start day if span starts on Sunday but ends before Saturday
	    if (startDay == 0 && endDay != 6)
	        days = days - 1  
	            
	    // Remove end day if span ends on Saturday but starts after Sunday
	    if (endDay == 6 && startDay != 0)
	        days = days - 1  
	    
	    return days;
	}
	$scope.calculateSlippage=function(){
		$scope.scheduleSlippage = 0;
		$scope.date1 = new Date($scope.SLAMetricsValue.sit_planned_period_from);
		$scope.date2 = new Date($scope.SLAMetricsValue.sit_planned_period_to);
		$scope.plannedDuration = workingDaysBetweenDates($scope.date1, $scope.date2);
		
		$scope.date3 = new Date($scope.SLAMetricsValue.sit_actual_period_from);
		$scope.date4 = new Date($scope.SLAMetricsValue.sit_actual_period_to);
		$scope.actualDuration = workingDaysBetweenDates($scope.date3, $scope.date4);
		
		if($scope.plannedDuration>0 && $scope.actualDuration>0) {
			$scope.scheduleSlippage = ((($scope.actualDuration - $scope.plannedDuration)/$scope.actualDuration)*100).toFixed(2);	
		}
		else 
			$scope.scheduleSlippage = 0;
	}
	
	
});

</script>
</head>
<body ng-app="addUpdateSLAMetrics" ng-controller="SLAMetricsController">
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
	<div class="col-sm-2">
	 <div class="sideBar">
    <ul class="metismenu" id="menu">
    <li class="pageNameMenu sideMenu">
		<a href="addUpdateSLAMetrics.jsp">
			<img src="images/icons/Reports Menu Icon Black.png" class="img2">
			Add/Update Project
		</a>
	</li>
    </ul>
    </div> 
		</div>
		</div>
		<!-- </div>should close div here -->
    <div class="col-sm-10">
				<div class="selectionArea">
  				<div class="col-md-10">
					<div class="row1">
					<div class="col-md-3">
							<label for="sel1" class="control-label">Portfolio<div style="position:relative;"><span style="position: absolute; top: -25px; right: -8px; color:red;">*</span></div></label> 
						</div>
						<div class="col-md-4">
							<label for="sel1">Project<div style="position:relative;"><span style="position: absolute; top: -25px; right: -8px; color:red;">*</span></div></label>
						</div>
					</div>
					<div class="row2">
					<div class="col-md-3">
							      <select ng-model="SLAMetricsValue.portfolio" ng-change="loadAllProjects(SLAMetricsValue.portfolio)" class="form-control portfolioSelect" id="sel1" style="margin-top: -3px;">
							      <option value="Select">Select</option>
							         <option>DIGITAL</option>
							       	 <option>ENTERPRISE APPLICATION</option>
							         <option>GFS</option>
							         <option>STORES</option>
							         <option>SAP</option>
							         <option>SUPPLY CHAIN</option>
							  </select>
							</div>
						<div class="col-md-4 projectSelectDiv">
							      <select  class="form-control projectSelect" ng-model="SLAMetricsValue.project" id="sel4" style="margin-top: -3px;" ng-options="v as v for (k,v) in dropDownvals">
							      
							      </select>
						</div>
      						<div>
						<div class="col-lg-1" style="margin-right:10%;">
							<button type="button" class="btn btn-primary submitBtn" style="margin-top: -17px;" ng-click="fetchSLADetails(SLAMetricsValue.portfolio,SLAMetricsValue.project)">SEARCH</button>
					</div>
						
						</div>
					</div>
					</div>
				</div>
				</div>
				
				<div class="generationArea" id="generationArea">
						
						<div class="detailedViewStatusTable" id="detailedViewStatusTable">
						<div class="col-md-12 performanceKeys" id="performanceKeys">
						<div class="col-sm-12 col-md-12 col-lg-12">
							  <div id="coqDefinitionLabels" style="float:left; color: #FF4500; margin-right:36px; margin-top: 16px;"> 
							SLA DEFINITIONS
                        </div>
                        </div>
                       <div class="col-sm-12 col-md-12 col-lg-12 projectDetails" id="projectDetails">
									<table class="table table-bordered" id="projectDetailsTable">
								    <thead>
								    <tr>
								    	<th colspan="10">
								    		PROJECT DETAILS
								    	</th>
								    	<th colspan="6">
								    		METRICS
								    	</th>
								    </tr>
								      
					    			 </thead>
					    			<tbody>
					    			<tr style="background-color: #F5F5F5;">
								        <td rowspan="2" style="color: rgba(0,0,0,.87);">Test Phase</td>
	                                    <td colspan="2" rowspan="2">Planned Testing Period</td>
	                                    <td colspan="2" rowspan="2">Actual Testing Period</td>
	                                    <td colspan="3">Planned Testing Efforts in PD</td>
		                                <td rowspan="2">Actual Testing Efforts in PD</td>
	                                    <td rowspan="2">Total # of scripts</td>
	                                    <td colspan="3" style="color: #8AC759;">SCHEDULE SLIPPAGE</td>
	                                    <td colspan="3" style="color: #8AC759;">ACTUAL <br> SLIPPAGE</td>
					    			</tr>
					    			<tr style="background-color: #F5F5F5;">
					    				<td> Silver </td>
					    				<td> Bronze </td>
					    				<td> Gold </td>
					    				<td style="color: #8AC759;"> <=5</td>
								      	<td style="color: rgb(255,191,0);">>5<=15</td>
								      	<td style="color: rgb(255,77,77);">>15</td>
								      	<td style="color: #8AC759;"> <=5</td>
								      	<td style="color: rgb(255,191,0);">>5<=15</td>
								      	<td style="color: rgb(255,77,77);">>15</td>
					    				
					    			</tr>
								      <tr style="background-color: white;">
								      	  	<td> SIT </td>
								      	  	<td><input type="text" id="sit_planned_period_from" datepicker="" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" loaded="{{SLAMetricsValue.sit_planned_period_from}}" ng-model="SLAMetricsValue.sit_planned_period_from" ng-change="calculateSlippage();"/></td>
								      	  	<td><input type="text" id="sit_planned_period_to" datepicker="" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" loaded="{{SLAMetricsValue.sit_planned_period_to}}" ng-model="SLAMetricsValue.sit_planned_period_to" ng-change="calculateSlippage();"/></td>
								      	  	<td><input type="text" id="sit_actual_period_from" datepicker="" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" loaded="{{SLAMetricsValue.sit_actual_period_from}}" ng-model="SLAMetricsValue.sit_actual_period_from" ng-change="calculateSlippage();"/></td>
								      	  	<td><input type="text" id="sit_actual_period_to" datepicker="" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" loaded="{{SLAMetricsValue.sit_actual_period_to}}" ng-model="SLAMetricsValue.sit_actual_period_to" ng-change="calculateSlippage();"/></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.silver"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.bronze"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.gold"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_actual_effort"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.total_no_of_scripts"></td>
								      	  	<td ng-class="setSlippageColor(scheduleSlippage)" colspan="3"> {{scheduleSlippage || 0}} </td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.actualSlippage" ng-value="SLAMetricsValue.actualSlippage = +(((SLAMetricsValue.sit_actual_effort-SLAMetricsValue.gold)/SLAMetricsValue.gold)*100).toFixed(2) || 0">
								      	  	<td ng-class="setSlippageColor(SLAMetricsValue.actualSlippage)" colspan="3" ng-model="SLAMetricsValue.actualSlippage">{{SLAMetricsValue.actualSlippage}}</td>
								      </tr>
								      </tbody>
								   
								   </table>
								   </div>
								    <div class="col-sm-12 col-md-12 col-lg-12">
								    		<textarea rows="3" cols="100" maxlength="500" placeholder="Comments:" style="width: 100%; height: 100%; border: 3px solid #ddd;margin-bottom: 1.5%;" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.comments_project_details"></textarea>	
    							</div>
    							
    							<div class="col-sm-12 col-md-12 col-lg-12 defectCount" id="defectCount">
									<table class="table table-bordered" id="defectCountTable">
								    <thead>
								    <tr>
								    	<th colspan="6">
								    		DEFECT COUNT BY STATUS
								    	</th>
								    	<th colspan="5">
								    		DEFECT COUNT BY SEVERITY
								    	</th>
								    	<th colspan="5">
								    		METRICS
								    	</th>
								    </tr>
								      
					    			 </thead>
					    			<tbody>
					    			<tr style="background-color: #F5F5F5;">
								        <td rowspan="2" style="color: rgba(0,0,0,.87);">Test Phase</td>
	                                    <td rowspan="2" rowspan="2">Open</td>
	                                    <td rowspan="2" rowspan="2">Close</td>
	                                    <td rowspan="2">Reopen<div class="colorPallet"></div></td>
		                                <td rowspan="2">Deferred / Cancelled</td>
	                                    <td rowspan="2">Total<div class="colorPallet"></div></td>
	                                    
	                                    <td rowspan="2">SEV 1</td>
	                                    <td rowspan="2">SEV 2</td>
	                                    <td rowspan="2">SEV 3</div></td>
		                                <td rowspan="2">SEV 4</td>
		                                <td rowspan="2">Total</td>
		                                
		                                <td colspan="3">TEST EFFECTIVENESS</td>
		                                <td colspan="2">FAILURE RATE</td>
					    			</tr>
					    			<tr style="background-color: #F5F5F5;">
					    				
					    				<td style="color: #8AC759;"> <=5</td>
								      	<td style="color: rgb(255,191,0);">>5<=15</td>
								      	<td style="color: rgb(255,77,77);">>15</td>
								      	<td style="color: #8AC759;"> >=10</td>
								      	<td style="color: rgb(255,191,0);"><10</td>
					    				
					    			</tr>
								      <tr style="background-color: white;">
								      	  	<td>SIT</td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_open"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_close"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_reopen"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_deferred"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsSITTotalStatus" ng-value="SLAMetricsValue.defectsSITTotalStatus = SLAMetricsValue.sit_open + SLAMetricsValue.sit_close + SLAMetricsValue.sit_reopen + SLAMetricsValue.sit_deferred">
								      	  	<td><input type="number" ng-model="SLAMetricsValue.defectsSITTotalStatus" disabled style="background-color: white;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_sev1"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_sev2"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_sev3"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_sev4"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsSITTotalSeverity" ng-value="SLAMetricsValue.defectsSITTotalSeverity = SLAMetricsValue.sit_sev1 + SLAMetricsValue.sit_sev2 + SLAMetricsValue.sit_sev3 + SLAMetricsValue.sit_sev4">
								      	  	<td><input type="number" disabled ng-model="SLAMetricsValue.defectsSITTotalSeverity" style="background-color: white;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.sitTestEffectiveness" ng-value="SLAMetricsValue.sitTestEffectiveness = +((SLAMetricsValue.defectsSITTotalStatus/(SLAMetricsValue.defectsSITTotalStatus+SLAMetricsValue.defectsUATTotalStatus+SLAMetricsValue.defectsPRODTotalStatus))*100).toFixed(2) || 0">
								      	  	<td ng-class="setSlippageColor(SLAMetricsValue.sitTestEffectiveness)" colspan="3">{{SLAMetricsValue.sitTestEffectiveness}}</td>
								      	  	
								      	  	<input type="hidden" ng-model="SLAMetricsValue.sitFailureRate" ng-value="SLAMetricsValue.sitFailureRate = +((SLAMetricsValue.defectsSITTotalStatus-(SLAMetricsValue.sit_data+SLAMetricsValue.sit_test_script))/SLAMetricsValue.total_no_of_scripts).toFixed(2) || 0">
								      	  	<td ng-class="setFailureColor(SLAMetricsValue.sitFailureRate)" colspan="2">{{SLAMetricsValue.sitFailureRate}}</td>
								      </tr>
								      <tr style="background-color: #F5F5F5;">
								      	  	<td> UAT </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_open" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_close" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_reopen" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_deferred" style="background-color: #F5F5F5;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsUATTotalStatus" ng-value="SLAMetricsValue.defectsUATTotalStatus = SLAMetricsValue.uat_open + SLAMetricsValue.uat_close + SLAMetricsValue.uat_reopen + SLAMetricsValue.uat_deferred">
								      	  	<td><input type="number" ng-model="SLAMetricsValue.defectsUATTotalStatus" disabled style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_sev1" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_sev2" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_sev3" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_sev4" style="background-color: #F5F5F5;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsUATTotalSeverity" ng-value="SLAMetricsValue.defectsUATTotalSeverity = SLAMetricsValue.uat_sev1 + SLAMetricsValue.uat_sev2 + SLAMetricsValue.uat_sev3 + SLAMetricsValue.uat_sev4">
								      	  	<td><input type="number" disabled ng-model="SLAMetricsValue.defectsUATTotalSeverity" style="background-color: #F5F5F5;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.uatTestEffectiveness" ng-value="SLAMetricsValue.uatTestEffectiveness = +((SLAMetricsValue.defectsUATTotalStatus/(SLAMetricsValue.defectsSITTotalStatus+SLAMetricsValue.defectsUATTotalStatus+SLAMetricsValue.defectsPRODTotalStatus))*100).toFixed(2) || 0">
								      	  	<td ng-class="setSlippageColor(SLAMetricsValue.uatTestEffectiveness)" colspan="3">{{SLAMetricsValue.uatTestEffectiveness}}</td>
								      	  	
								      	  	<input type="hidden" ng-model="SLAMetricsValue.uatFailureRate" ng-value="SLAMetricsValue.uatFailureRate = +((SLAMetricsValue.defectsUATTotalStatus-(SLAMetricsValue.uat_data+SLAMetricsValue.uat_test_script))/SLAMetricsValue.total_no_of_scripts).toFixed(2) || 0">
								      	  	<td ng-class="setFailureColor(SLAMetricsValue.uatFailureRate)" colspan="2">{{SLAMetricsValue.uatFailureRate}}</td>
								      </tr>
								      <tr style="background-color: white;">
								      	  	<td> PROD </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_open"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_close"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_reopen"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_deferred"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsPRODTotalStatus" ng-value="SLAMetricsValue.defectsPRODTotalStatus = SLAMetricsValue.prod_open + SLAMetricsValue.prod_close + SLAMetricsValue.prod_reopen + SLAMetricsValue.prod_deferred">
								      	  	<td><input type="number" ng-model="SLAMetricsValue.defectsPRODTotalStatus" disabled style="background-color: white;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_sev1"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_sev2"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_sev3"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_sev4"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsPRODTotalSeverity" ng-value="SLAMetricsValue.defectsPRODTotalSeverity = SLAMetricsValue.prod_sev1 + SLAMetricsValue.prod_sev2 + SLAMetricsValue.prod_sev3 + SLAMetricsValue.prod_sev4">
								      	  	<td><input type="number" ng-model="SLAMetricsValue.defectsPRODTotalSeverity" disabled style="background-color: white;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.prodTestEffectiveness" ng-value="SLAMetricsValue.prodTestEffectiveness = +((SLAMetricsValue.defectsPRODTotalStatus/(SLAMetricsValue.defectsSITTotalStatus+SLAMetricsValue.defectsUATTotalStatus+SLAMetricsValue.defectsPRODTotalStatus))*100).toFixed(2) || 0">
								      	  	<td ng-class="setSlippageColor(SLAMetricsValue.prodTestEffectiveness)" colspan="3">{{SLAMetricsValue.prodTestEffectiveness}}</td>
								      	  	
								      	  	<input type="hidden" ng-model="SLAMetricsValue.prodFailureRate" ng-value="SLAMetricsValue.prodFailureRate = +((SLAMetricsValue.defectsPRODTotalStatus-(SLAMetricsValue.prod_data+SLAMetricsValue.prod_test_script))/SLAMetricsValue.total_no_of_scripts).toFixed(2) || 0">
								      	  	<td ng-class="setFailureColor(SLAMetricsValue.prodFailureRate)" colspan="2">{{SLAMetricsValue.prodFailureRate}}</td>
								      </tr>
								      </tbody>
								   
								   </table>
								   </div>
								    <div class="col-sm-12 col-md-12 col-lg-12">
								    		<textarea rows="3" cols="100" maxlength="500" placeholder="Comments:" style="width: 100%; height: 100%; border: 3px solid #ddd; margin-bottom: 1.5%;" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.def_comments"></textarea>	
    							</div>
    							
    							
    							<div class="col-sm-12 col-md-12 col-lg-12 rootCause" id="rootCause">
									<table class="table table-bordered" id="rootCauseTable">
								    <thead>
								    <tr>
								    	<th colspan="10">
								    		ROOT CAUSE
								    	</th>
								    	<th colspan="3">
								    		METRICS
								    	</th>
								    </tr>
								      
					    			 </thead>
					    			<tbody>
					    			<tr style="background-color: #F5F5F5;">
								        <td rowspan="2" style="color: rgba(0,0,0,.87);">Test Phase</td>
	                                    <td rowspan="2" rowspan="2">Code</td>
	                                    <td rowspan="2" rowspan="2">Requirements</td>
	                                    <td rowspan="2">Design</td>
		                                <td rowspan="2">Environment</td>
	                                    <td rowspan="2">Data</td>
	                                    <td rowspan="2">Test Scripts</td>
	                                    <td rowspan="2">Exists in PROD</td>
	                                    <td rowspan="2">Others</td>
	                                    <td rowspan="2">Total</td>
	                                    <td colspan="3" style="color: #8AC759;">DEFECT REJECTION</td>
					    			</tr>
					    			<tr style="background-color: #F5F5F5;">
					    				<td style="color: #8AC759;"> <11</td>
								      	<td style="color: rgb(255,191,0);">>11-15</td>
								      	<td style="color: rgb(255,77,77);">>15</td>
					    			</tr>
								      <tr style="background-color: white;">
								      	  	<td> SIT </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_code"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_req"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_design"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_environment"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_data"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_test_script"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_exist_prod"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.sit_others"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsSITTotalRootCause" ng-value="SLAMetricsValue.defectsSITTotalRootCause = SLAMetricsValue.sit_code + SLAMetricsValue.sit_req + SLAMetricsValue.sit_design + SLAMetricsValue.sit_environment + SLAMetricsValue.sit_data + SLAMetricsValue.sit_test_script + SLAMetricsValue.sit_exist_prod + SLAMetricsValue.sit_others">
											<td><input type="number" ng-model="SLAMetricsValue.defectsSITTotalRootCause" disabled  style="background-color: white;"></td>
								      	  	
								      	  	<input type="hidden" ng-model="SLAMetricsValue.sitDefectRejection" ng-value="SLAMetricsValue.sitDefectRejection = +(SLAMetricsValue.sit_data+SLAMetricsValue.sit_test_script)/SLAMetricsValue.total_no_of_scripts.toFixed(2) || 0">
								      	  	<td ng-class="setDefectRejectionColor(SLAMetricsValue.sitDefectRejection)" colspan="3">{{SLAMetricsValue.sitDefectRejection}}</td>
								      </tr>
								      <tr style="background-color: #F5F5F5;">
								      	  	<td> UAT </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_code" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_req" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_design" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_environment" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_data" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_test_script" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_exist_prod" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.uat_others" style="background-color: #F5F5F5;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsUATTotalRootCause" ng-value="SLAMetricsValue.defectsUATTotalRootCause = SLAMetricsValue.uat_code + SLAMetricsValue.uat_req + SLAMetricsValue.uat_design + SLAMetricsValue.uat_environment + SLAMetricsValue.uat_data + SLAMetricsValue.uat_test_script + SLAMetricsValue.uat_exist_prod + SLAMetricsValue.uat_others">
											<td><input type="number" ng-model="SLAMetricsValue.defectsUATTotalRootCause" disabled style="background-color: #F5F5F5;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.uatDefectRejection" ng-value="SLAMetricsValue.uatDefectRejection = +(SLAMetricsValue.uat_data+SLAMetricsValue.uat_test_script)/SLAMetricsValue.total_no_of_scripts.toFixed(2) || 0">
								      	  	<td ng-class="setDefectRejectionColor(SLAMetricsValue.uatDefectRejection)" colspan="3">{{SLAMetricsValue.uatDefectRejection}}</td>
								      </tr>
								      <tr style="background-color: white;">
								      	  	<td> PROD </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_code"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_req"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_design"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_environment"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_data"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_test_script"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_exist_prod"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" ng-model="SLAMetricsValue.prod_others"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsPRODTotalRootCause" ng-value="SLAMetricsValue.defectsPRODTotalRootCause = SLAMetricsValue.prod_code + SLAMetricsValue.prod_req + SLAMetricsValue.prod_design + SLAMetricsValue.prod_environment + SLAMetricsValue.prod_data + SLAMetricsValue.prod_test_script + SLAMetricsValue.prod_exist_prod + SLAMetricsValue.prod_others">
											<td><input type="number" ng-model="SLAMetricsValue.defectsPRODTotalRootCause" disabled style="background-color: white;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.prodDefectRejection" ng-value="SLAMetricsValue.prodDefectRejection = +(SLAMetricsValue.prod_data+SLAMetricsValue.prod_test_script)/SLAMetricsValue.total_no_of_scripts.toFixed(2) || 0">
								      	  	<td ng-class="setDefectRejectionColor(SLAMetricsValue.prodDefectRejection)" colspan="3">{{SLAMetricsValue.prodDefectRejection}}</td>
								      </tr>
								      </tbody>
								   
								   </table>
								   </div>
								    <div class="col-sm-12 col-md-12 col-lg-12">
								    		<textarea rows="3" cols="100" maxlength="500" placeholder="Comments:" style="width: 100%; height: 100%; border: 3px solid #ddd;margin-bottom: 1.5%;" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.root_comments"></textarea>	
    							</div>
    							 <div class="col-sm-12 col-md-12 col-lg-12">
    								<div class="col-sm-4 col-md-4 col-lg-4"><label style="font-size: larger; margin-right: 1%;">Reviewed Metrics with Project Team?</label></div>
									<div class="col-sm-1 col-md-1 col-lg-1" style="margin-left: -8%;"><input type="radio" name="addUpdate" value="0" checked style="width: 35% ! important;"ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.reviewed" > NO</div>
  									<div class="col-sm-1 col-md-1 col-lg-1" style="margin-left: -4%;"><input type="radio" name="addUpdate" value="1" style="margin-left: 1%; width: 35% ! important;"ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.reviewed" > YES</div>
  									<div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: -4%;"><input type="text" id="reviewed_date" datepicker="" loaded="{{SLAMetricsValue.reviewed_date}}" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.reviewed_date"/></div>
    							</div>
    							<div class="col-sm-12 col-md-12 col-lg-12">
								    		<textarea rows="3" cols="100" maxlength="500" placeholder="Project Team Comments:" style="width: 100%; height: 100%; border: 3px solid #ddd;margin-bottom: 1.5%;" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.proj_team_comments"></textarea>	
    							</div>
    							
    							
    							<div class="col-sm-12 col-md-12 col-lg-12 lessonsLearnt" id="lessonsLearnt">
									<table class="table table-bordered" id="lessonsLearntTable">
								    <thead>
								    <tr>
								    	<th>
								    		LESSONS LEARNT
								    	</th>
								    </tr>
								      
					    			 </thead>
					    			<tbody>
					    			<tr style="background-color: white;">
								        <td><textarea rows="3" cols="100" maxlength="500" placeholder="Comments:" style="width: 100%; height: 100%; margin-bottom: 1.5%; border: none;" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.lesson_learnt"></textarea></td>
					    			</tr>
					    			
								      </tbody>
								   
								   </table>
								   </div>
								   <div class="col-sm-12 col-md-12 col-lg-12 bestPractices" id="bestPractices">
									<table class="table table-bordered" id="bestPracticesTable">
								    <thead>
								    <tr>
								    	<th>
								    		BEST PRACTICES
								    	</th>
								    </tr>
								      
					    			 </thead>
					    			<tbody>
					    			<tr style="background-color: white;">
								        <td><textarea rows="3" cols="100" maxlength="500" placeholder="Comments:" style="width: 100%; height: 100%; margin-bottom: 1.5%; border: none;" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.best_practices"></textarea></td>
					    			</tr>
					    			
								      </tbody>
								   
								   </table>
								   </div>
    							<div style="float:right;">
										<div class="col-sm-1 col-md-1 col-lg-1"style="margin-right: 35%;" >
								  			<button type="button" ng-disabled="SLAMetricsValue.allow" ng-click="finalSubmition(SLAMetricsValue)" class="btn btn-primary submitBtn">SAVE</button>
					            		</div>
										<div class="col-sm-1 col-md-1 col-lg-1" style="margin-right: 23%;" >
			              					<button ng-hide="false" type="button" ng-click="resetSubmition()" class="btn btn-primary cancel" >CANCEL</button>
										</div>
							</div>
    							
    							
    							
							</div>
							<div class="modal"></div>
						</div>									
				</div>
		</div>

	</div>
	<div id="DSRfooter">
	<section class="footerSection" id="footer">
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
	</section>
	<div class="hiddenDiv"></div>
	</div>
</body>
<script src='js/css3-animate-it.js'></script>
</html>


