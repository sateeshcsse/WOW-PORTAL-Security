<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add/Update Project Report</title> 
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
</style>


<script>
$(document).ready(function(){
	var dateToday = new Date(); 
	var date = dateToday.getDate();
    var dateToday = new Date(); 
    
	$("#charLimitSummary").text("500 Chars");
	$("#charLimitRiskIssues").text("500 Chars");
});
</script>
<script type="text/javascript">

var reportsApp= angular.module('addStatusReport',[]);

reportsApp.factory('loadProjectsFactory', ['$http', '$q', function($http) {

    var factory = {
        saveProjectData: function(object) {       
           
            var dataToSave=angular.toJson(object);
            console.log(dataToSave);
            var data2 = $http({
                method: 'POST',
                url: 'saveCompleteProjectData.do',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                data:dataToSave
            });
            return data2;
        }
    };
   
    return factory;
}]);


reportsApp.directive('datepicker', function() {
    return {
        restrict: 'A',
        require : 'ngModel',
        link : function (scope, element, attrs, ngModelCtrl) {
            attrs.$observe('loaded',function(val){
				var dateToday = new Date(); 
				var date = dateToday.getDate();
				
              element.datepicker({
				dateFormat: 'dd/mm/yy',
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
                      if (this.id === "MessageDateFrom") {
                         $("#MessageDateTo").datepicker("option", "minDate", date);
                      }
                      if (this.id === "MessageDateFrom_UAT") {
                          $("#MessageDateTo_UAT").datepicker("option", "minDate", date);
                       }
                      ngModelCtrl.$setViewValue(date);
                      scope.$apply();
                  }
              });
            })
              
        }
    }
});

reportsApp.controller('reportsController',function($scope,loadProjectsFactory,$http,$timeout){
	$scope.messagesForm= {};
	      //suppose your value is loading through ajax
	      $scope.messagesForm.dateFrom = moment().subtract('days', 30).format('MM/DD/YYYY');
	      $scope.messagesForm.dateTo = moment().format('MM/DD/YYYY');
	        $timeout(function(){
	        $('#MessageDateTo').datepicker('option', 'minDate', $scope.reportsVal.release_iteration_end_date);
	      },1000);
	      $scope.$watch('messagesForm.dateTo', function(newVal, oldVal) {
	            if (!newVal) return;
	            if (Date.parse(newVal) < Date.parse( $scope.reportsVal.release_iteration_end_date)) {
	            	 $scope.reportsVal.release_iteration_end_date = newVal;
	            }
	        });  
	      $timeout(function(){
		        $('#MessageDateTo_UAT').datepicker('option', 'minDate', $scope.reportsVal.uat_release_iteration_end_date);
		      },1000);
		      $scope.$watch('messagesForm_UAT.dateTo', function(newVal, oldVal) {
		            if (!newVal) return;
		            if (Date.parse(newVal) < Date.parse($scope.messagesForm.dateFrom)) {
		                $scope.reportsVal.uat_release_iteration_end_date = newVal;
		            }
		        }); 
	
	function parseit(str){
		var parts = str.split("/");
		var dt = new Date(parseInt(parts[2], 10),
		                  parseInt(parts[1], 10) - 1,
		                  parseInt(parts[0], 10));
		return dt;
	}
	
	
	
	         function projectStart(obj){
		    	  var start=obj.release_iteration_start_date;
		    	  var start_UAT=obj.uat_release_iteration_start_date;
		    	 
		    	  if(typeof start_UAT==='undefined' || start_UAT.length<2){
		    		  return start;
		    	  }else if(typeof start==='undefined' || start.length<2){
		    		  return start_UAT;
		    	  }
		    	  
		    	  else{
		    		 var parsedStart=parseit(start);
		    		 var parsedStart_UAT=parseit(start_UAT);
		    		 if(parsedStart<parsedStart_UAT){
		    			 return start;
		    		 }else{
		    			 return start_UAT;
		    		 }
		    	  } 
		      }
		      
			function goLiveDate(obj){
	                          
				 var end=obj.release_iteration_end_date;
		    	  var end_UAT=obj.uat_release_iteration_end_date;
		    	 
		    	  if(typeof end_UAT==='undefined' || end_UAT.length<2 ){
		    		  return end;
		    	  }else if(typeof end==='undefined' || end.length<2){
		    		  return end_UAT;
		    	  }
		    	  else{
		    		 var parsedEnd=parseit(end);
		    		 var parsedEnd_UAT=parseit(end_UAT);
		    		 if(parsedEnd>parsedEnd_UAT){
		    			 return end;
		    		 }else{
		    			 return end_UAT;
		    		 }
		    	  }
				
				 
				}
	
	
	function calculateExpectedDate(obj){
		var date = new Date();
		console.log('obj.release_iteration_end_date  '+obj.release_iteration_end_date+' obj.release_iteration_start_date '+obj.release_iteration_start_date);
		var formattedDate = moment(date).format('DD/MM/YYYY');
	/* 	var end = moment(obj.release_iteration_end_date,'DD/MM/YYYY');
		var start= moment(obj.release_iteration_start_date,'DD/MM/YYYY');
		console.log('formattedDate  '+formattedDate+' start '+dateStart); */
		var dateNow = parseit(formattedDate);
		var dateEnd = parseit(obj.release_iteration_end_date);
		var dateStart=parseit(obj.release_iteration_start_date);
		console.log('dateNow  '+dateNow+' dateEnd '+dateEnd+' dateStart '+dateStart);
		var timeDiffFromNow = Math.abs(dateEnd.getTime() - dateNow.getTime());
	    var timeDiffFromStart=Math.abs(dateEnd.getTime() - dateStart.getTime());
		var diffDaysfromNow = Math.ceil(timeDiffFromNow / (1000 * 3600 * 24)); 
		var diffDaysFromStart=Math.ceil(timeDiffFromStart / (1000 * 3600 * 24)); 
		console.log('timeDiffFromStart '+timeDiffFromStart+' timeDiffFromNow '+timeDiffFromNow);
		var total=parseInt(angular.element('#total').text());
		var result=0;
		console.log(diffDaysfromNow+'   '+diffDaysFromStart);
		 result=(total/diffDaysFromStart)*(diffDaysfromNow);
		console.log('total'+total+'  '+result);
			if(!result){
			return 0;
		}
		return result.toFixed(2);
		
		
		
	}
	
	function calculateExpectedDateUAT(obj){
		var date = new Date();
		console.log('obj.release_iteration_end_date  '+obj.uat_release_iteration_end_date+' obj.release_iteration_start_date '+obj.uat_release_iteration_start_date);
		var formattedDate = moment(date).format('DD/MM/YYYY');
	/* 	var end = moment(obj.release_iteration_end_date,'DD/MM/YYYY');
		var start= moment(obj.release_iteration_start_date,'DD/MM/YYYY');
		console.log('formattedDate  '+formattedDate+' start '+dateStart); */
		var dateNow = parseit(formattedDate);
		var dateEnd = parseit(obj.uat_release_iteration_end_date);
		var dateStart=parseit(obj.uat_release_iteration_start_date);
		console.log('dateNow  '+dateNow+' dateEnd '+dateEnd+' dateStart '+dateStart);
		var timeDiffFromNow = Math.abs(dateEnd.getTime() - dateNow.getTime());
	    var timeDiffFromStart=Math.abs(dateEnd.getTime() - dateStart.getTime());
		var diffDaysfromNow = Math.ceil(timeDiffFromNow / (1000 * 3600 * 24)); 
		var diffDaysFromStart=Math.ceil(timeDiffFromStart / (1000 * 3600 * 24)); 
		console.log('timeDiffFromStart '+timeDiffFromStart+' timeDiffFromNow '+timeDiffFromNow);
		var total=parseInt(angular.element('#uat_total').text());
		console.log(diffDaysfromNow+'   '+diffDaysFromStart);
		var result=0;
		result=(total/diffDaysFromStart)*(diffDaysfromNow);
		console.log('total'+total+'  '+result);
			if(!result){
			return 0;
		}
		return result.toFixed(2);
		
		
		
	}
	$scope.isUpdated=false;
	$scope.showVals=true;
	$scope.reportsVal={};
	$scope.reportsVal.proceed=false;
	$scope.toggleRadio=function (){
		$scope.reportsVal.proceed=!$scope.reportsVal.proceed;
		console.log($scope.reportsVal.proceed);
		if($scope.reportsVal.add==='Add' && $scope.reportsVal.proceed===false &&  $scope.showVals===false ){
	    	   console.log('######################');
	    	   $scope.reportsVal=0;
	    	   $scope.showVals=true;
	       }
		   	if($scope.reportsVal.add==='Update' && $scope.reportsVal.proceed===true &&  $scope.showVals===false ){
	    	   console.log('######################$scope.reportsVal.portfolio false'+$scope.reportsVal.portfolio);
	    	   if($scope.reportsVal.portfolio){
	    		   $scope.loadAllProjects($scope.reportsVal.portfolio);
	    	   }
	       }
		   if($scope.reportsVal.add==='Update' && $scope.reportsVal.proceed===true &&  $scope.showVals===true ){
	    	   console.log('######################$scope.reportsVal.portfolio true'+$scope.reportsVal.portfolio);
	    	   if($scope.reportsVal.portfolio){
	    		   $scope.loadAllProjects($scope.reportsVal.portfolio);
	    	   }
	       }
	};
	$scope.resetSubmition=function(){
		$scope.reportsVal=0;
	};


	$scope.firstSubmition=function(portfolio,project,addOrUpdate){
		console.log(portfolio,project);
		if(typeof project==='undefined' || project===null){
			toastr.error('Try Adding It', 'Project Filed is Empty', {
      		  closeButton: true
      		});
			return;
		}
		if(addOrUpdate === "Update") {
			
		} else {
			$http({
	             method: 'GET',
	             url: 'saveProjectData.do',
	             headers: {
	                 'Content-Type': 'application/json; charset=UTF-8'
	             },
	             params:{
	             	'portfolio':portfolio,
	             	'project':project
	             }
	         }).success(function(){
	        		$scope.showVals=false;
	        		 toastr.success('Updated successfully', 'Proceed With Reports Data', {
		        		  closeButton: true
		        		});
	        		 })
		        .error(function(){
		        	toastr.error('Try Updating It', 'Project Already Exists', {
		        		  closeButton: true
		        		});
		        });
		}
	};
	
	$scope.finalSubmition=function(obj){
		var batchRun = new Date();
		var formattedbatchRun = moment(batchRun).format('DD/MM/YYYY hh:mm');
		obj.golivedate=goLiveDate(obj);
		obj.project_start=projectStart(obj);
		console.log('###############'+typeof obj.golivedate +'    '+obj.golivedate);
		console.log(typeof obj.project_start +'    '+obj.project_start);
		console.log(typeof obj.release_iteration_end_date);
		console.log(typeof obj.release_iteration_start_date);
		console.log(typeof obj.uat_release_iteration_start_date);
		console.log(typeof obj.uat_release_iteration_start_date);
		if( obj.scope ==='Select' ||  obj.cost ==='Select' ||  obj.schedule ==='Select' ||  obj.resources ==='Select'||  obj.risks ==='Select'||  obj.issues ==='Select'||  obj.performance ==='Select' ){
			toastr.error('Returned following error','Please provide all the values for Performace Keys ', {
      		  closeButton: true
      		});
			return;
		}
		if((typeof obj.uat_release_iteration_end_date ==='undefined' && typeof obj.uat_release_iteration_start_date ==='undefined') && (typeof obj.release_iteration_end_date ==='undefined' && typeof obj.release_iteration_start_date ==='undefined') ){
			toastr.error('Returned following error','SIT/UAT Information is Must for saving ', {
	      		  closeButton: true
	      		});
				return;
		}
		
		if(typeof obj.release_iteration_end_date !=='undefined' && typeof obj.release_iteration_start_date !=='undefined'){
			obj.expected_percent=calculateExpectedDate(obj);
			obj.percentage_completion=obj.pass;
			console.log('expected_percent  '+obj.expected_percent +' percentage_completion '+obj.percentage_completion);
			
		}else{
				obj.expected_percent='';
			obj.percentage_completion='';
			obj.release_iteration_end_date='';
			obj.release_iteration_start_date='';
			console.log(' else  expected_percent  '+obj.expected_percent + ' else percentage_completion '+obj.percentage_completion);
		}
		
		if(typeof obj.uat_release_iteration_end_date !=='undefined' && typeof obj.uat_release_iteration_start_date !=='undefined'){
			obj.uat_expected_percent=calculateExpectedDateUAT(obj);
			obj.uat_percentage_completion=obj.uat_pass;
			console.log('expected_percent  '+obj.uat_expected_percent +' percentage_completion '+obj.uat_percentage_completion);
		}else{
			obj.uat_expected_percent='';
			obj.uat_percentage_completion='';
			obj.uat_release_iteration_end_date='';
			obj.uat_release_iteration_start_date='';
			console.log(' else  uat_expected_percent  '+obj.uat_expected_percent + ' else uat_percentage_completion '+obj.uat_percentage_completion);
		}
		if(typeof obj.summary ==='undefined' ||typeof obj.risks_issues ==='undefined' ){
			toastr.error('Returned following error','Please Enter Summary/Risks ', {
	      		  closeButton: true
	      		});
				return;
		}
		obj.total=parseInt(angular.element('#total').text());
		obj.uat_total=parseInt(angular.element('#uat_total').text());
		obj.batchLast_run=formattedbatchRun;
		$scope.reportsVal.expected_percent=obj.expected_percent;
		$scope.reportsVal.percentage_completion=obj.percentage_completion;
		$scope.reportsVal.uat_expected_percent=obj.uat_expected_percent;
		$scope.reportsVal.uat_percentage_completion=obj.uat_percentage_completion;
		
		
		 loadProjectsFactory.saveProjectData(obj).success(function(data){
			 console.log(data);
			 $scope.isUpdated=false;
			 toastr.success('Updated successfully', 'Proceed With Reports Data', {
       		  closeButton: true
       		});
		}).error(function(data){
			console.log(data);
			toastr.error('Something went wrong', 'Refresh and Try Again', {
      		  closeButton: true
      		});
		}); 
	};
	
	$scope.loadAllProjects=function(portfolio){
		if(!$scope.reportsVal.proceed){
			console.log('addiing proj no need to load anything');
			return;
		}
		
		$http({
            method: 'GET',
            url: 'getProjectValues.do',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            params:{
            	'portfolio':portfolio
            	
            }
        }).success(function(result){
        	//console.log(result);
        	$scope.dropDownvals=result;
        	$scope.showVals=false;
			$scope.isUpdated=false;
        }).error(function(data){
        	toastr.error('Returned following error','Please Add data before Updating it ', {
      		  closeButton: true
      		});
        });
	};
	
	
	
	$scope.getCompleteProjectData=function(portfolio,project){
			if(project===null){
			console.log('Nothing to get');
			return;
		}
		$http({
            method: 'GET',
            url: 'getCompleteProjectValues.do',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            params:{
            	'portfolio':portfolio,
            	'project':project
            	
            }
        }).success(function(result){
        	var finalData ="";

        	$.each(result,function(index,value){
				console.log(value);
        		if(value===null){
        		     value='';
        		}
        		 finalData += value +',';
        	  
        	});
                console.log(finalData);
        	finalData = finalData.replace(/\},\{/g,',').slice(0, -1);
        	 
        	$scope.reportsVal=JSON.parse(finalData);
        	$scope.reportsVal.project1=$scope.reportsVal.project;
			$scope.reportsVal.proceed=true;
        	$scope.reportsVal.add='Update';
			if(typeof $scope.reportsVal.uat_expected_percent==='undefined'){
				$scope.reportsVal.uat_expected_percent=0;
			}
			if(typeof $scope.reportsVal.expected_percent==='undefined'){
				$scope.reportsVal.uat_expected_percent=0;
			}
			if(typeof $scope.reportsVal.uat_percentage_completion==='undefined'){
				$scope.reportsVal.uat_percentage_completion=0;
			}
			if(typeof $scope.reportsVal.percentage_completion==='undefined'){
				$scope.reportsVal.percentage_completion=0;
			}
        }).error(function(data){
        	
        	toastr.error('Please Add data before Updating it','Please Try Again', {
      		  closeButton: true
      		});
        });
	};
	 $(".onlyNumber").keydown(function (e) {
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
</head>
<body ng-app="addStatusReport" ng-controller="reportsController">
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
		<a href="addUpdateProjectDetailsDSR.jsp">
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
				<div class="col-md-2">
				<div style="margin-top: 20px; margin-left: 12px; font-size: large; font-weight: bold; color: #8AC759;">
						<input ng-change="toggleRadio(value)" ng-value="'Add'" ng-checked="!reportsVal.proceed"  ng-model="reportsVal.add" type="radio" name="addUpdate" value="ADD" checked> ADD
  						<input  ng-change="toggleRadio(value)" ng-value="'Update'" ng-checked="reportsVal.proceed" ng-model="reportsVal.add" type="radio" name="addUpdate" value="UPDATE"> UPDATE
  				</div>
  				</div>
  				<div class="col-md-10" ng-cloak>
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
							      <select ng-model="reportsVal.portfolio" ng-init="reportsVal.portfolio='Select'" ng-change="loadAllProjects(reportsVal.portfolio)" class="form-control portfolioSelect" id="sel1" style="margin-top: -3px;">
							      <option value="Select">Select</option>
							         <option>DIGITAL</option>
							       	 <option>ENTERPRISE APPLICATION</option>
							         <option>GFS</option>
							         <option>STORES</option>
							         <option>SAP</option>
							         <option>SUPPLY CHAIN</option>
									 <option>RUN IT</option>
									 <option>SECURITY</option>
							  </select>
							</div>
						<div class="col-md-4 projectSelectDiv" ng-show="reportsVal.proceed" >
							      <select  class="form-control projectSelect" id="sel4" style="margin-top: -3px;" ng-change="getCompleteProjectData(reportsVal.portfolio,reportsVal.project1)" ng-model="reportsVal.project1" ng-options="v as v for (k,v) in dropDownvals">
							      
							      </select>
						</div>
						<div class="col-md-4 projectSelectTextDiv" ng-show="!reportsVal.proceed" >
							      <!-- <select class="form-control projectSelect" id="sel4" style="margin-top: -3px;"> -->
							      <input  ng-model="reportsVal.project" class="form-control projectSelectText" style="margin-top: -3px;" type="text"><br>
							      <!-- </select> -->
						</div>
      						<div>
						<div class="col-lg-1" style="margin-right:10%;">
								  	<button ng-show="!reportsVal.proceed" type="button" ng-click="firstSubmition(reportsVal.portfolio,reportsVal.project, reportsVal.add)" class="btn btn-primary submitBtn" style="margin-top: -17px;">SUBMIT</button>
								   <button ng-show="reportsVal.proceed" type="button" ng-click="firstSubmition(reportsVal.portfolio,reportsVal.project1, reportsVal.add)" class="btn btn-primary submitBtn" style="margin-top: -17px;">SUBMIT</button>
					</div>
						<div class="col-lg-1" style="margin-left:-8%;">
									 <button type="button" ng-click="resetSubmition()" class="btn btn-primary reset" style="margin-top: -17px;">CANCEL</button>
						</div>
						</div>
					</div>
					</div>
				</div>
				</div>
				
				<div class="generationArea" id="generationArea" ng-cloak>
						
						<div class="detailedViewStatusTable" id="detailedViewStatusTable">
						<div class="col-md-12 performanceKeys" id="performanceKeys">
								<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th colspan="12">
								    		PERFORMANCE KEYS
								    	</th>
								    	<th colspan="2" rowspan="2" align="center" style="vertical-align: middle;">
								    		TEST STATUS
								    	</th>
								    </tr>
								      <!-- <tr>
										<th colspan="2" style="width:11%">Scope<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%">Cost<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%">Schedule<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%">QA Resources<div class="colorPallet"></div></th>
	                                	<th style="display:none;">Benefits Realization<div class="colorPallet"></div></th>
		                                <th colspan="2" style="width:11%">Risks<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%">Issues<div class="colorPallet"></div></th>
	                                    <th style="display:none;">Stakeholders<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%; text-align: center;">Status<div class="colorPallet"></div></th>
                                     
								      </tr> -->
								      <tr>
								      <th colspan="2">Scope</th>
	                                    <th colspan="2">Cost</th>
	                                    <th colspan="2">Schedule</th>
	                                    <th colspan="2">QA Resources<div class="colorPallet"></div></th>
		                                <th colspan="2">Risks<div class="colorPallet"></div></th>
	                                    <th colspan="2">Issues<div class="colorPallet"></div></th>
					    </tr>
								      <tr>
								      	  	<td colspan="2" align="center" class = "select"><span class="performanceKeysLabel">Scope</span> <br>
									  	   <select class="form-control" ng-init="reportsVal.scope='Select'" ng-model="reportsVal.scope"  ng-disabled="showVals">        
									  	   		<option value="Select">Select</option>
            						       		<option value="Green">Green</option>
            							   		<option value="Amber">Amber</option>
            							   		<option value="Red">Red</option>
    									   </select>
    								  	</td>
								      	<td colspan="2" align="center" class = "select"><span class="performanceKeysLabel">Cost </span><br>
									  	   <select class="form-control" ng-init="reportsVal.cost='Select'" ng-model="reportsVal.cost"  ng-disabled="showVals">        
            						       		<option value="Select">Select</option>
            						       		<option value="Green">Green</option>
            							   		<option value="Amber">Amber</option>
            							   		<option value="Red">Red</option>
    									   </select>
    								  	</td>
								      	<td colspan="2" align="center" class = "select"><span class="performanceKeysLabel">Schedule </span><br>
									  	   <select class="form-control" ng-init="reportsVal.schedule='Select'" ng-model="reportsVal.schedule"  ng-disabled="showVals">       
            						       		<option value="Select">Select</option>
            						       		<option value="Green">Green</option>
            							   		<option value="Amber">Amber</option>
            							   		<option value="Red">Red</option>
    									   </select>
    								  	</td>
								      	<td colspan="2" align="center" class = "select"><span class="performanceKeysLabel">QA Resources </span><br>
									  	  <select class="form-control" ng-init="reportsVal.resources='Select'" ng-model="reportsVal.resources"  ng-disabled="showVals">
            						       		<option value="Select">Select</option>
            						       		<option value="Green">Green</option>
            							   		<option value="Amber">Amber</option>
            							   		<option value="Red">Red</option>
    									   </select>
    								  	</td>
								      	<td colspan="2" align="center" class = "select"><span class="performanceKeysLabel">Risks </span><br>
									  	  <select class="form-control" ng-init="reportsVal.risks='Select'" ng-model="reportsVal.risks"  ng-disabled="showVals">
            						       		<option value="Select">Select</option>
            						       		<option value="Green">Green</option>
            							   		<option value="Amber">Amber</option>
            							   		<option value="Red">Red</option>
    									   </select>
    								  	</td>
								      	<td colspan="2" align="center" class = "select"><span class="performanceKeysLabel">Issues</span><br>
									  	   <select class="form-control" ng-model="reportsVal.issues" ng-init="reportsVal.issues='Select'"  ng-disabled="showVals">
            						       		<option value="Select">Select</option>
            						       		<option value="Green">Green</option>
            							   		<option value="Amber">Amber</option>
            							   		<option value="Red">Red</option>
    									   </select>
    								  	</td>
    								  	<td colspan="2" align="center" class = "select"><span class="performanceKeysLabel">Test Status</span><br>
									  	   <select class="form-control" ng-init="reportsVal.performance='Select'" ng-model="reportsVal.performance"  ng-disabled="showVals">
            						       		<option value="Select">Select</option>
            						       		<option value="Green">Green</option>
            							   		<option value="Amber">Amber</option>
            							   		<option value="Red">Red</option>
    									   </select>
    								  	</td>
								      </tr>
								    </thead>
								   </table>
							</div>
						
							<div class="col-md-12 statusView" id="statusView">
								<table class="table table-bordered">
								    <thead>
								      <tr>
								        <th>PORTFOLIO</th>
								        <!-- <th>BUSINESS UNIT</th> -->
								        <th>PROJECT NAME</th>
								        <th>TEST PHASE</th>
								        <th>START DATE</th>
								        <th>END DATE</th>
								        <th>PASS %</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								        <td rowspan="2" class="verticalAlign statusViewPortfolioName">{{reportsVal.portfolio}}</td>
								        <td rowspan="2" class="statusViewProjectName verticalAlign">{{reportsVal.project}}</td>
								        <td ng-model="reportsVal.test_phase">SIT</td>
										 <td style="width:19%"> <input type="text" id="MessageDateFrom"  loaded="{{reportsVal.release_iteration_start_date}}" ng-model="reportsVal.release_iteration_start_date" datepicker="" ng-disabled="showVals"  />
								       <div style="position:relative;"><span style="position: absolute; top: -25px; right: 6px; color:red;">*</span></div></td>
								        <td style="width:19%"><input type="text" id="MessageDateTo"  loaded="{{reportsVal.release_iteration_end_date}}" ng-model="reportsVal.release_iteration_end_date" datepicker="" ng-disabled="showVals"  />
								       <div style="position:relative;"><span style="position: absolute; top: -25px; right: 6px; color:red;">*</span></div></td>
								        
								        <td>{{((((reportsVal.pass/(reportsVal.pass+reportsVal.fail+reportsVal.blocked+reportsVal.in_progress+reportsVal.no_run))*100).toFixed(2))) |number:0}}</td>
								      </tr>
								      <tr>
								        <td>UAT</td>
								         <td style="width:19%"> <input type="text" id="MessageDateFrom_UAT"  loaded="{{reportsVal.uat_release_iteration_start_date}}" ng-model="reportsVal.uat_release_iteration_start_date" datepicker="" ng-disabled="showVals"  />
								        </td>
								        <td style="width:19%"><input type="text" id="MessageDateTo_UAT"  loaded="{{reportsVal.uat_release_iteration_end_date}}" ng-model="reportsVal.uat_release_iteration_end_date" datepicker="" ng-disabled="showVals"  />
								        </td>
								        <td>{{((((reportsVal.uat_pass/(reportsVal.uat_pass+reportsVal.uat_fail+reportsVal.uat_blocked+reportsVal.uat_in_progress+reportsVal.uat_no_run))*100).toFixed(2))) | number:0}}</td>
								      </tr>
								      </tbody>
								   </table>
							</div>
							<div>
							<div class="col-md-6 summary" id="summary">
								<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th class ="bottom-aligned-text" colSpan="8" style="padding: 5px;">
								    		SUMMARY
								    	</th>
										<th class ="bottom-aligned-text" colSpan="2" style="padding: 5px; width: 20%; text-align: center;">
								    		<span id="charLimitSummary">{{(500-reportsVal.summary.length)}} Chars</span>	
								    	</th>
								    </tr>
								    <tr>
								    	<td colSpan="10"> 
								    		<textarea ng-model="reportsVal.summary" rows="7" ng-trim="false" ng-disabled="showVals" cols="100" maxlength="500" class = "disableFields" style="width: 100%; height: 100%; border: none;"></textarea>	
    									</td>
    									<span id="charLimitSummary" hidden>{{(500-reportsVal.summary.length)}} Chars</span>
								    </tr>
								    </thead>
								   </table>
							</div>
							<div class="col-md-6 riskAndIssues" id="riskAndIssues">
								<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th class ="bottom-aligned-text" colSpan="8" style="padding: 5px;">
								    		RISK & ISSUES
								    	</th>
                                                                        <th class ="bottom-aligned-text" colSpan="2" style="padding: 5px; width: 20%; text-align: center;">
								    		<span id="charLimitRiskIssues"> {{500-reportsVal.risks_issues.length}} Chars </span>	
								    	</th>
								    </tr>
								    <tr>										<td colSpan="10"> 
								    		<textarea  ng-disabled="showVals" ng-trim="false" ng-model="reportsVal.risks_issues" id="riskIssuesTextarea" rows="7" cols="100" maxlength="500" class = "disableFields" style="width: 100%; height: 100%; border: none;"></textarea>	
    									</td>
    									<span id="charLimitRiskIssues" hidden> {{500-reportsVal.risks_issues.length}} Chars </span>	
								    </tr>
								    </thead>
								   </table>
							</div>
							</div>
							
							<div class="col-md-12 executionStatus" id="executionStatus">
								<table class="table table-striped table-bordered" style="width:100% ! important;">
								    <thead>
								    <tr>
								    	<th colSpan="11">
								    		EXECUTION STATUS
								    	</th>
								    </tr>
								    <tr>
								        <th align="left" style="width:12%;">Test Phase/Test Cycle</th>
								        <th>Pass</th>
								        <th>Fail</th>
								        <th>Blocked</th>
								         <th>In Progress</th>
								        <th>No Run</th>
								        <th>NA</th>
								        <th rowspan="2">Total</th>
								        <th style="width:15%;">Expected Scenarios Count</th>
								        <th style="width:13%;">Actual Scenarios Count</th>
										<th style="width:6%;">PASS %</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								       	<td align="left">SIT</td>
								         <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.pass" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals"  ng-model="reportsVal.fail" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals"  ng-model="reportsVal.blocked"id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals" ng-model="reportsVal.in_progress" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals" ng-model="reportsVal.no_run" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals"  ng-model="reportsVal.not_available" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><span ng-disabled="showVals" id="total">{{reportsVal.pass+reportsVal.fail+reportsVal.blocked+reportsVal.in_progress+reportsVal.no_run+reportsVal.not_available}}</span> </td>
								      	<td>{{reportsVal.expected_percent ||0}}</td>
								      	<td>{{reportsVal.pass}}</td>
								      	<td>{{((((reportsVal.pass/(reportsVal.pass+reportsVal.fail+reportsVal.blocked+reportsVal.in_progress+reportsVal.no_run))*100).toFixed(2))) |number:0}}</td>
								      </tr>
								      <tr>
								       <td align="left">UAT</td>
								          <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_pass" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_fail" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_blocked"id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_in_progress" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_no_run" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_not_available" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      	<td align="center" ><span id="uat_total">{{reportsVal.uat_pass+reportsVal.uat_fail+reportsVal.uat_blocked+reportsVal.uat_in_progress+reportsVal.uat_no_run+reportsVal.uat_not_available}}</span></td>
								      	<td>{{reportsVal.uat_expected_percent || 0}}</td>
								      	<td>{{reportsVal.uat_pass}}</td>
								      	<td>{{((((reportsVal.uat_pass/(reportsVal.uat_pass+reportsVal.uat_fail+reportsVal.uat_blocked+reportsVal.uat_in_progress+reportsVal.uat_no_run))*100).toFixed(2))) | number:0}}</td>
								      </tr>
								   </tbody>
								   </table>
							</div>
							<div>
							<div class="col-md-6 defectStatus" id="defectStatus">
									<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th colSpan="6">
								    		SIT DEFECT STATUS
								    	</th>
								    </tr>
								    <tr>
								        <th>Status</th>
								        <th style="width:15%">Sev1</th>
								        <th style="width:15%">Sev2</th>
								        <th style="width:15%">Sev3</th>
								        <th style="width:15%">Sev4</th>
								       	<th style="width:15%">Total</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								       	<td>Open</td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.open_Def_Severity1" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.open_Def_Severity2" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.open_Def_Severity3" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.open_Def_Severity4" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.open_Def_Severity1+reportsVal.open_Def_Severity2+reportsVal.open_Def_Severity3+reportsVal.open_Def_Severity4}} </td>
								      </tr>
								      <tr>
								       	<td>In Progress</td>
								         <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.inprogress_Def_Severity1" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.inprogress_Def_Severity2" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals"  ng-model="reportsVal.inprogress_Def_Severity3" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.inprogress_Def_Severity4" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.inprogress_Def_Severity1+reportsVal.inprogress_Def_Severity2+reportsVal.inprogress_Def_Severity3+reportsVal.inprogress_Def_Severity4}} </td>
								      </tr>
								       <tr>
								       	<td>Fixed</td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.fixed_Def_Severity1" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.fixed_Def_Severity2" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.fixed_Def_Severity3" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.fixed_Def_Severity4" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.fixed_Def_Severity1+reportsVal.fixed_Def_Severity2+reportsVal.fixed_Def_Severity3+reportsVal.fixed_Def_Severity4}}</td>
								      </tr>
								      <tr>
								       	<td>Retest</td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.retest_Def_Severity1" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.retest_Def_Severity2" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.retest_Def_Severity3" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.retest_Def_Severity4" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.retest_Def_Severity1+reportsVal.retest_Def_Severity2+reportsVal.retest_Def_Severity3+reportsVal.retest_Def_Severity4}}</td>
								      </tr>
								      <tr>
								       	<td>Reopen</td>
								         <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.reopen_Def_Severity1" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.reopen_Def_Severity2" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.reopen_Def_Severity3" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.reopen_Def_Severity4" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.reopen_Def_Severity1+reportsVal.reopen_Def_Severity2+reportsVal.reopen_Def_Severity3+reportsVal.reopen_Def_Severity4}}</td>
								      </tr>
								      <tr>
								       	<td>Closed</td>
								         <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.closed_Def_Severity1" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.closed_Def_Severity2" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.closed_Def_Severity3" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.closed_Def_Severity4" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.closed_Def_Severity1+reportsVal.closed_Def_Severity2+reportsVal.closed_Def_Severity3+reportsVal.closed_Def_Severity4}}</td>
								      </tr>
								      </tbody>
								   </table>
							</div>
							<div class="col-md-6 defectStatus" id="defectStatusUAT">
								<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th colSpan="6">
								    		UAT DEFECT STATUS
								    	</th>
								    </tr>
								    <tr>
								        <th>Status</th>
								        <th style="width:15%">Sev1</th>
								        <th style="width:15%">Sev2</th>
								        <th style="width:15%">Sev3</th>
								        <th style="width:15%">Sev4</th>
								       	<th style="width:15%">Total</th>
								      </tr>
								    </thead>
								    <tbody>
								    <tr>
								       	<td>Open</td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_open_Def_Severity1" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_open_Def_Severity2" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_open_Def_Severity3" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_open_Def_Severity4" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								       
								        <td align="center">{{reportsVal.uat_open_Def_Severity1+reportsVal.uat_open_Def_Severity2+reportsVal.uat_open_Def_Severity3+reportsVal.uat_open_Def_Severity4}} </td>
								      </tr>
								      <tr>
								       	<td>In Progress</td>
								         <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_inprogress_Def_Severity1" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_inprogress_Def_Severity2" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input  ng-model="reportsVal.uat_inprogress_Def_Severity3" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input  ng-model="reportsVal.uat_inprogress_Def_Severity4" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        
								        <td align="center">{{reportsVal.uat_inprogress_Def_Severity1+reportsVal.uat_inprogress_Def_Severity2+reportsVal.uat_inprogress_Def_Severity3+reportsVal.uat_inprogress_Def_Severity4}} </td>
								      </tr>
								       <tr>
								       	<td>Fixed</td>
								       <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_fixed_Def_Severity1" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_fixed_Def_Severity2" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_fixed_Def_Severity3" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_fixed_Def_Severity4" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.uat_fixed_Def_Severity1+reportsVal.uat_fixed_Def_Severity2+reportsVal.uat_fixed_Def_Severity3+reportsVal.uat_fixed_Def_Severity4}}</td>
								      </tr>
								      <tr>
								       	<td>Retest</td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_retest_Def_Severity1" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_retest_Def_Severity2" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_retest_Def_Severity3" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_retest_Def_Severity4" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.uat_retest_Def_Severity1+reportsVal.uat_retest_Def_Severity2+reportsVal.uat_retest_Def_Severity3+reportsVal.uat_retest_Def_Severity4}}</td>
								      </tr>
								      <tr>
								       	<td>Reopen</td>
								         <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_reopen_Def_Severity1" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_reopen_Def_Severity2" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_reopen_Def_Severity3" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_reopen_Def_Severity4" id="testingInput" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.uat_reopen_Def_Severity1+reportsVal.uat_reopen_Def_Severity2+reportsVal.uat_reopen_Def_Severity3+reportsVal.uat_reopen_Def_Severity4}}</td>
								      </tr>
								      <tr>
								       	<td>Closed</td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_closed_Def_Severity1" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_closed_Def_Severity2" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_closed_Def_Severity3" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_closed_Def_Severity4" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center">{{reportsVal.uat_closed_Def_Severity1+reportsVal.uat_closed_Def_Severity2+reportsVal.uat_closed_Def_Severity3+reportsVal.uat_closed_Def_Severity4}}</td>
								      </tr>
								      </tbody>
								   </table>
								  
							</div>
							</div>
							<div>
							<div class="col-md-6 sitRootCauseAnalysis" id="sitRootCauseAnalysis">
									<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th colSpan="7">
								    		SIT ROOT CAUSE ANALYSIS
								    	</th>
								    </tr>
								    <tr>
								        <th>Code</th>
								        <th style="width:15%">Fun Spec</th>
								        <th style="width:15%">Tech Spec</th>
								        <th style="width:15%">Envnt</th>
								        <th style="width:15%">Data</th>
								       	<th style="width:15%">Exist in Prod</th>
								       	<th style="width:15%">Test Scripts</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.code_caused_by_earlier_fix" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.code_database_design" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input  ng-disabled="showVals" ng-model="reportsVal.data_configuration_error" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.doc_functional_spec_problem" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.doc_technical_spec_problem" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.env_environment_problem" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.doc_test_script_problem" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      </tr>
								      </tbody>
								   </table>
							</div>
							<div class="col-md-6 uatRootCauseAnalysis" id="uatRootCauseAnalysis">
								<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th colSpan="7">
								    		UAT ROOT CAUSE ANALYSIS
								    	</th>
								    </tr>
								    <tr>
								        <th>Code</th>
								        <th style="width:15%">Fun Spec</th>
								        <th style="width:15%">Tech Spec</th>
								        <th style="width:15%">Envnt</th>
								        <th style="width:15%">Data</th>
								       	<th style="width:15%">Exist in Prod</th>
								       	<th style="width:15%">Test Scripts</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								         <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_code_caused_by_earlier_fix" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_doc_solution_design_problem" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_doc_technical_spec_problem" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_env_environment_problem" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_data_configuration_error" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_code_security" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								        <td align="center"><input ng-disabled="showVals" ng-model="reportsVal.uat_code_database_design" id="testingInput1" min="0" type = number class = "onlyNumber" placeholder="0"> </td>
								      </tr>
								      </tbody>
								   </table>
								   
								   </div>
								  	<div style="float:right;">
										<div class="col-lg-1"style="margin-right: 35%;" >
								  			<button ng-hide="showVals" type="button" ng-click="finalSubmition(reportsVal)" class="btn btn-primary submitBtn">SAVE</button>
					            		</div>
										<div class="col-lg-1" style="margin-right: 23%;" >
			              					<button ng-hide="false" type="button" ng-click="resetSubmition()" class="btn btn-primary cancel" >CANCEL</button>
										</div>
							</div>
							</div>
							<div class="modal"></div>
						</div>									
				</div>
			
			<!-- </div> -->
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


