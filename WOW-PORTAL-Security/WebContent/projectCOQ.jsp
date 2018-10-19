<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Project COQ</title> 
<!-- <link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon" /> -->
<link rel="stylesheet" href="<c:url value="/styles/animations.css"/>">
<link href="<c:url value="/styles/bootstrap.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/styles/skeleton.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/styles/jqueryUI.css"/>" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<c:url value="/styles/Home.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/metisMenu.min.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/sideBar.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/reportArea.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/dataTables.bootstrap.css"/>">
 <link rel="stylesheet" href="<c:url value="/js/toastr.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/styles/angular-toastr.css"/>" />

<script src="<c:url value="/js/jquery-1.11.3.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/js/jquery.scrollify.js"/>"></script>
<script src="<c:url value="/js/metisMenu.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.bootstrap.js"/>"></script>
<script src="<c:url value="/js/custom.js"/>"></script>
<script src="<c:url value="/js/angular-1.4.7/angular.js"/>" ></script>
<script src="<c:url value="/js/toastr.min.js"/>"></script>
<script src="<c:url value="/js/angularConfirm.js"/>"></script>


<script src="<c:url value="/js/angular.sanitize.js"/>"></script>
<script src="<c:url value="/js/angular.translate.js"/>"></script>
<script src="<c:url value="/js/ui.bootstrap.js"/>"></script>
<script src="<c:url value="/js/dialogs.main.js"/>"></script>

<script src="<c:url value="/js/angular-toastr.js"/>"></script>
<script src="<c:url value="/js/angular-toastr.tpls.min.js"/>"></script>
<script src="<c:url value="/js/moment.js"/>"></script>

<script>
$(document).ready(function(){
	console.log("window width : ...." + $(window).width());
	if($(window).width()<=1200) {
		$("#searchProjectCOQID").removeClass();
		$("#searchProjectCOQID").addClass("col-sm-9 col-md-9 col-lg-9");
		$("#sideMenuCOQID").removeClass();
		$("#sideMenuCOQID").addClass("col-sm-3 col-md-3 col-lg-3");
		$(".pageNameMenu").css("margin-left", "-6%");
		$(".sideBar").css({"width": "112%", "display" : "inline-block"});
	} else {
		$("#searchProjectCOQID").removeClass();
		$("#searchProjectCOQID").addClass("col-sm-10 col-md-10 col-lg-10");
		$("#sideMenuCOQID").removeClass();
		$("#sideMenuCOQID").addClass("col-sm-2 col-md-2 col-lg-2");
		$(".pageNameMenu").css("margin-left", "0%");
		$(".sideBar").css({"width": "111%", "display" : "inline-block"});
	}
	$( window ).resize(function() {
		if($(window).width()<=1200) {
			$("#searchProjectCOQID").removeClass();
			$("#searchProjectCOQID").addClass("col-sm-9 col-md-9 col-lg-9");
			$("#sideMenuCOQID").removeClass();
			$("#sideMenuCOQID").addClass("col-sm-3 col-md-3 col-lg-3");
			$(".pageNameMenu").css("margin-left", "-6%");
			$(".sideBar").css({"width": "112%", "display" : "inline-block"});
		} else {
			$("#searchProjectCOQID").removeClass();
			$("#searchProjectCOQID").addClass("col-sm-10 col-md-10 col-lg-10");
			$("#sideMenuCOQID").removeClass();
			$("#sideMenuCOQID").addClass("col-sm-2 col-md-2 col-lg-2");
			$(".pageNameMenu").css("margin-left", "0%");
			$(".sideBar").css({"width": "111%", "display" : "inline-block"});
		}
	});
	$('#coqDefinitionLabels').click(function(){
		window.open('COQDefinitions.jsp','_blank');
	});
	$("#goLiveDate").datepicker({
		showOn : "button",
		buttonImage : "images/icons/calender.png",
		buttonImageOnly : true,
		dateFormat:'dd/mm/yy',
		maxDate: new Date()
		//minDate: new Date()
	});
});

</script>
<script>


var app = angular.module('materialApp', ['toastr','ui.bootstrap','dialogs.main','pascalprecht.translate']);
app.config(function($httpProvider) {
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
});

app.factory('ProjectPhaseService', ['$http', '$q', function($http) {

    var factory = {
        getProjectPhase: function(portfolio) {
            portfolio = angular.toJson(portfolio);
            console.log(portfolio);
            var data2 = $http({
                method: 'GET',
                url: 'getProjectforCOQInput.do',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                params: {
                    'portfolio': portfolio
                }
            }).then(function(response) {
               
                return response.data;

            });
            return data2;
        }
    };
    console.log('factory' + factory);
    return factory;
}]);

app.factory('TableReloadService', ['$http', '$q', function($http) {

    var factory = {
        getProjectData: function(portfolio,project) {
            portfolio = angular.toJson(portfolio);
            project = angular.toJson(project);
            
            console.log(portfolio);
            var data2 = $http({
                method: 'GET',
                url: 'getTableDataForPrject.do',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8'
                },
                params: {
                    'portfolio': portfolio,
                    'project':project
                    
                }
            }).then(function(response) {
               
                return response.data;

            });
            return data2;
        }
    };
    console.log('factory' + factory);
    return factory;
}]);

app.directive('datepicker', function() {
    return {
        restrict: 'A',
        require : 'ngModel',
        link : function (scope, element, attrs, ngModelCtrl) {
            $(function(){
                element.datepicker({
                    dateFormat: 'mm/dd/yy',
                    showStatus: true,
                    showWeeks: true,
                    highlightWeek: true,
                    minDate:"-30d",
                    maxDate: 0,
                    numberOfMonths: 1,
                    showAnim: "scale",
                    showOptions: { origin: ["bottom", "right"] },
                    onSelect: function (date) {
                        ngModelCtrl.$setViewValue(date);
                        scope.$apply();
                    }
                });
            });
        }
    }
});


 app.controller('AppCtrl', function($scope, $http, ProjectPhaseService,TableReloadService,$rootScope,$translate,dialogs) {

   
	    $scope.tableVal = {};
	    $scope.tableVal.portfolio='';
	    $scope.changesMade = false;
	    $scope.tableVal.project='';
	    $scope.tableVal.testingTotalPercent=parseFloat(0).toFixed(2);
	    $scope.tableVal.nonTestingPercent=parseFloat(0).toFixed(2);
	    $scope.alreadyLoaded=false;
	    $scope.updatePercent=function(total){
	    	$scope.changesMade = true;
	    	$scope.tableVal.nontestingTotal = Number(angular.element('#abccr').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.testingTotal = Number(angular.element('#testingTotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.tcsQATotal = Number(angular.element('#tcsQATotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.othersTotal = Number(angular.element('#othersTotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.tcsQAUATTotal = Number(angular.element('#tcsQAUATTotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.othersUATTotal = Number(angular.element('#othersUATTotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.nonTestingOthersTotalCost = Number(angular.element('#nonTestingOthersTotalCost').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.nonTestingProjectTotalCost = Number(angular.element('#nonTestingProjectTotalCost').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.nonTestingDevelopmentTotalCost = Number(angular.element('#nonTestingDevelopmentTotalCost').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.nonTestingBATotalCost = Number(angular.element('#nonTestingBATotalCost').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.total=total;
			//console.log($scope.tableVal.tcsQATotal)
	    	$scope.tableVal.qaPercent=parseFloat(($scope.tableVal.tcsQATotal/$scope.tableVal.total)*100).toFixed(2);
			
	    	$scope.tableVal.othersPercent=parseFloat(($scope.tableVal.othersTotal/$scope.tableVal.total)*100).toFixed(2);
	    	$scope.tableVal.qaUATPercent=parseFloat(($scope.tableVal.tcsQAUATTotal/$scope.tableVal.total)*100).toFixed(2);
	    	$scope.tableVal.othersUATPercent=parseFloat(($scope.tableVal.othersUATTotal/$scope.tableVal.total)*100).toFixed(2);
	    	$scope.tableVal.testingTotalPercent=parseFloat(($scope.tableVal.testingTotal/$scope.tableVal.total)*100).toFixed(2);
			if($scope.tableVal.testingTotalPercent==='Infinity' || $scope.tableVal.testingTotalPercent==='NaN'){
				$scope.tableVal.testingTotalPercent='0.00'
			}
			console.log('%%%%%%%%%%%%%%%%%%'+ $scope.tableVal.testingTotal +' %^%^^%  '+ $scope.tableVal.total)
	    	
	    	$scope.tableVal.nonTestBAPercent=parseFloat(($scope.tableVal.nonTestingBATotalCost/$scope.tableVal.total)*100).toFixed(2);
	    	$scope.tableVal.nonTestDevPercent=parseFloat(($scope.tableVal.nonTestingDevelopmentTotalCost/$scope.tableVal.total)*100).toFixed(2);
	    	$scope.tableVal.nonTestProjPercent=parseFloat(($scope.tableVal.nonTestingProjectTotalCost/$scope.tableVal.total)*100).toFixed(2);
	    	$scope.tableVal.nonTestOthersPercent=parseFloat(($scope.tableVal.nonTestingOthersTotalCost/$scope.tableVal.total)*100).toFixed(2);
	    	$scope.tableVal.nonTestingPercent=parseFloat(($scope.tableVal.nontestingTotal/$scope.tableVal.total)*100).toFixed(2);
			//console.log( $scope.tableVal.nonTestingPercent)
			if($scope.tableVal.nonTestingPercent==='Infinity' || $scope.tableVal.nonTestingPercent==='NaN'){
				$scope.tableVal.nonTestingPercent='0.00'
			}
			
	    };
	    
	    
	    $scope.processTableData = function(tableVal1) {
	    	$scope.tableVal.nontestingTotal = Number(angular.element('#abccr').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.testingTotal = Number(angular.element('#testingTotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.tcsQATotal = Number(angular.element('#tcsQATotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.othersTotal = Number(angular.element('#othersTotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.tcsQAUATTotal = Number(angular.element('#tcsQAUATTotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.othersUATTotal = Number(angular.element('#othersUATTotal').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.nonTestingOthersTotalCost = Number(angular.element('#nonTestingOthersTotalCost').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.nonTestingProjectTotalCost = Number(angular.element('#nonTestingProjectTotalCost').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.nonTestingDevelopmentTotalCost = Number(angular.element('#nonTestingDevelopmentTotalCost').text().replace(/[^0-9\.]+/g,""));
	    	$scope.tableVal.nonTestingBATotalCost = Number(angular.element('#nonTestingBATotalCost').text().replace(/[^0-9\.]+/g,""));
	       
	        tableVal1.lastUpdated = new Date().toISOString().slice(0, 10);
	        var d = new Date();
	        var curr_date = d.getDate();
	        var curr_month = d.getMonth() + 1; //Months are zero based
	        var curr_year = d.getFullYear();
	        tableVal1.lastUpdated=curr_date + "/" + curr_month + "/" + curr_year;
	        var data1 = angular.toJson(tableVal1);
	        data1 = data1.replace(/:(\d+)([,\}])/g, ':"$1"$2');

              /*   if(!tableVal1.overAllCost || tableVal1.overAllCost===null || tableVal1.overAllCost===0  ){
            	toastr.error('Please enter a Valid data for Overall Cost', 'Project COQ Data', {
	        		  closeButton: true
	        		});
            	return;
            } */
                      if(!tableVal1.projectEndDate || tableVal1.projectEndDate===undefined){
						  toastr.error('Please enter a Valid date for Project End', 'Project COQ Data', {
	        		  closeButton: true
	        		});
					return;
					  }
	        $http({
	            method: 'POST',
	            url: 'saveTableData.do',
	            headers: {
	                'Content-Type': 'application/json;'
	            },
	            data: data1
	        }).success(function(){
	        	toastr.success('Updated successfully', 'Project COQ Data', {
	        		  closeButton: true
	        		});
	        	$scope.changesMade = false;
	        })
	        .error(function(){
	        	toastr.error('Something went wrong', 'Project COQ Data', {
	        		  closeButton: true
	        		});
	        }); //angular.fromJson(data); for get success method

	    };
	    $scope.getProjectPhase = function(portfolio) {
	        console.log("getProjectPhase" + portfolio);
	        ProjectPhaseService.getProjectPhase(portfolio).
	        then(function(result) {
	            console.log('yyyyyyyyyyyyyyy' + result);
	            $scope.selectOptions = result;
	        },function(error){
	        	toastr.error('Returned following error',error, {
	        		  closeButton: true
	        		});
	        });
	        /* function(result) {
	            console.log("Error: No data returned"+result);
	        }); */
	    };
	    
	    
	    $scope.resetAll=function(){
	    	for (var key in $scope.tableVal) {
			    if (key !== 'project' && key !== 'portfolio') {
			        $scope.tableVal[key] = 0.00;
			        $scope.dateVal='';
			    }
			}
	    	$scope.dateVal='';
	    };
	    $scope.cancel=function(){
	    	
	    	if($scope.changesMade == true) {
	    		/* alert("changes made are not saved"); */
	    		var dlg = dialogs.confirm('Confirmation',' Changes made. Are you sure you want to cancel?','sm');
				dlg.result.then(function(btn){
					window.open('home.jsp','_self');
				},function(btn){
					
				});
	    	} else {
	    		window.open('home.jsp','_self');
	    	}
	    };
	    
	    $scope.getCompleteTableData = function(portfolio, project) {
	        console.log('the values are' + portfolio + '\t' + project);
	        
	        if(project===undefined||project===null||project.length==0){
	        	
	        }
	        else{
	        
	        
	        TableReloadService.getProjectData(portfolio,project).then(function(data){
	        	if(data==null || Object.keys(data).length===0){
	        		window.open('/projectCOQ.jsp'); 
	        	}
	        	for (var key in data) {
	        		   if (data.hasOwnProperty(key)) {
	        			   if(key==='lastUpdated' || key==='portfolio' || key==='project' || key==='testRelatedComments' || key==='nontestRelatedComments' || key==='overAllCostComments' || key==='projectEndDate' ){
	        				   data[key]=data[key];
	        			   }
	        			   else{
	        				    if(data[key] ===null|| data[key].length===0) {
	        					   data[key]=0.00;
	        				   }
	        				   else{
	        				   data[key]=parseFloat(data[key]);
	        				   }
	        			   }
	        		   }
	        		}
	        	
	        	$scope.dateVal=data.lastUpdated;
	        	$scope.tableVal=data;
	        	 $scope.alreadyLoaded=true;
	        },function(response){
	        	 console.log('nothing found' + portfolio + '\t' + project);
	        	 $scope.alreadyLoaded=false;
				        	for (var key in $scope.tableVal) {
			    if (key !== 'project' && key !== 'portfolio') {
			        $scope.tableVal[key] = '';
			        $scope.dateVal='';
			    }
			}
	        	
	        });
	        }
	    };
 $("#testingInput").keydown(function (e) {
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
.ui-datepicker-trigger {
    position: absolute;
    float: right;
    right: 63px;
    width: 23px;
    }
input::-webkit-input-placeholder { /* WebKit, Blink, Edge */
color: #123456;
opacity:.95;
 transition: opacity 0.3s ease;
 
}
input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
color: #123456;
opacity: 1;
 transition: opacity 0.3s ease;
}
input::-moz-placeholder { /* Mozilla Firefox 19+ */
color: #123456;
opacity: 1;
 transition: opacity 0.3s ease;
}
input:focus::-webkit-input-placeholder {opacity: 0; transition: opacity 0.3s ease;}
input:focus::-moz-placeholder          {opacity: 0; transition: opacity 0.3s ease;}
input:focus:-moz-placeholder           {opacity: 0; transition: opacity 0.3s ease;}

input{
border: none;
border-color: transparent;
background-color: #F5F5F5;
    height: 100%;    
}
input[type=image] {
	height: 20px ! important;
	margin-top: 4px! important;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}
input[type=number]:disabled{
cursor:not-allowed
}
textarea:disabled{
cursor:not-allowed
}
.redStar{
color:red;
}
 textarea {
    resize: none;
}
#coqDefinitionLabels{
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
.modal-open .modal {
	margin-top: 10%;
}
.modal-content {
	width: 146%;
    margin-left: -10%;
}
.modal-title {
	color : red;
}
.modal-body {
    font-size: large;
    font-family: "Roboto Condensed", Arial, sans-serif;
}
</style>
</head>
<body ng-app="materialApp" ng-controller="AppCtrl" >
<div class="container-fluid">
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
    <form name="DailyStatusReport" id="DailyStatusReport" method="post">
        <div class="workArea container-fluid">
            <div class="sideBarArea">
                <div class="col-sm-2 col-md-2 col-lg-2" id="sideMenuCOQID">
                    <div class="sideBar">
                        <ul class="metismenu" id="menu">
    <li class="pageNameMenu sideMenu">
		<a href="projectCOQ.jsp">
			<img src="images/icons/Metrics Menu Icon.png" class="img2">
			Add Project COQ 
		</a>
	</li>
    </ul>
                    </div>
                </div>
                <div class="col-sm-10 col-md-10 col-lg-10" id="searchProjectCOQID">
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
                            <div class="col-sm-3 col-md-3 col-lg-3">
                                <select ng-model="tableVal.portfolio" ng-change="getProjectPhase(tableVal.portfolio)" class="form-control portfolioSelect" id="sel1" style="margin-top: -3px;">
                                    <option value="">-select-</option>
                                   
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
                            <div class="col-sm-5 col-md-5 col-lg-5">
                                <select ng-change="getCompleteTableData(tableVal.portfolio,tableVal.project)"  ng-model="tableVal.project" ng-options="v as v for (k,v) in selectOptions" class="form-control projectPhaseSelect" id="sel3" style="margin-top: -3px;">
									<option value="">-select-</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="col-sm-12 col-md-12 col-lg-12" style="width: 101%;">
                
                    <div class="pageName">
                        <label style="padding: 0px 0px 0px 14px;">PROJECT COQ</label>
                        <div id="coqDefinitionLabels" style="float:left; color: #FF4500; margin-right:36px; margin-top: 16px;"> 
							COQ DEFINITION
                        </div>
                        <div style="float:right; color: #FF4500; margin-right:36px; margin-top: 16px;"> Last Updated On:
                            <span ng-disabled="!tableVal.project" ng-model="tableVal.lastUpdated">{{dateVal}} </span>
                        </div>
                    </div>
                    <div>
                        <div class="col-sm-12 col-md-12 col-lg-12 generationArea">
                            <div class="col-sm-12 col-md-12 col-lg-12 projectCOQTable" ng-cloak style="margin-top: -0.5%;">
                                <table class="table table-bordered" id="projectCOQTable">
                                    <thead>
                                        <tr class="TestingPart">
                                            <th></th>
                                            <th>TEAM</th>
                                            <th>PREVENTION COST</th>
                                            <th>APPRAISAL COST</th>
                                            <th>INTERNAL FAILURE COST</th>
                                            <th>EXTERNAL FAILURE COST</th>
                                            <th>PERFORMANCE COST</th>
                                            <th>TOTAL</th>
                                            <th>PERCENTAGE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="TestingPart">
                                            <td rowspan="4"><span style = "margin-left: 13px;" class="textRotate textRotateStyle">TESTING</span></td>
                                            <td>QA - SIT</td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00"step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.tcsQAPrevention"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.tcsQAAppraisal"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.tcsQAInternalFailure"> </td>
                                            <td>$
                                                <input  onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.tcsQAExternalFailure"> </td>
                                            <td align="center">NA
                                               <!--  <input  id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" step="0.02" ng-model="tableVal.tcsQAPerformance" disabled> --></td>
                                            <!-- <td ><span ng-disabled="!tableVal.project" ng-model="tcsTotal">{{(tableVal.tcsQAPrevention|number) -- (tableVal.tcsQAAppraisal|number)}}</span></td> -->
                                            <td><span id="tcsQATotal" ng-disabled="!tableVal.project" ng-model="tableVal.tcsQATotal">{{tableVal.tcsQAPrevention + tableVal.tcsQAAppraisal+tableVal.tcsQAInternalFailure+tableVal.tcsQAExternalFailure+tableVal.tcsQAPerformance | currency:undefined:2 }} </span></td>
                                            <td style="text-align: center;"><span class="redStar" ng-hide="tableVal.overAllCost">0.00*</span><span ng-show="tableVal.overAllCost" ng-model="tableVal.qaPercent">{{tableVal.qaPercent}}</span>%</td>
                                        </tr>
                                        <tr class="TestingPart">
                                            <td>Others - SIT</td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.othersPrevention"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.othersAppraisal"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.othersInternalFailure"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.othersExternalFailure"> </td>
                                            <td  align="center">NA
                                                <!-- <input  id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" step="0.02"  ng-model="tableVal.othersPerformance" disabled> --></td>
                                            <td><span id="othersTotal" ng-disabled="!tableVal.project" ng-model="tableVal.othersTotal">{{tableVal.othersPrevention +tableVal.othersAppraisal+tableVal.othersInternalFailure+tableVal.othersExternalFailure+tableVal.othersPerformance | currency:undefined:2 }} </span></td>
                                            <td style="text-align: center;"><span class="redStar" ng-hide="tableVal.overAllCost">0.00*</span><span ng-show="tableVal.overAllCost"  ng-model="tableVal.othersPercent">{{tableVal.othersPercent}}</span>%</td>
                                        </tr>
                                        <tr class="TestingPart">
                                            <td>QA - UAT</td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.tcsQAUATPrevention"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.tcsQAUATAppraisal"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.tcsQAUATInternalFailure"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.tcsQAUATExternalFailure"> </td>
                                            <td  align="center">NA
                                               <!--  <input id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" step="0.02"  ng-model="tableVal.tcsQAUATPerformance" disabled> --></td>
                                            <td><span id="tcsQAUATTotal" ng-disabled="!tableVal.project" ng-model="tableVal.tcsUATTotal">{{tableVal.tcsQAUATPrevention + tableVal.tcsQAUATAppraisal+tableVal.tcsQAUATInternalFailure+tableVal.tcsQAUATExternalFailure+tableVal.tcsQAUATPerformance | currency:undefined:2  }} </span></td>
                                            <td style="text-align: center;"><span class="redStar" ng-hide="tableVal.overAllCost">0.00*</span><span ng-show="tableVal.overAllCost" ng-model="tableVal.qaUATPercent">{{tableVal.qaUATPercent}}</span>%</td>
                                        </tr>
                                        <tr class="TestingPart">
                                            <td>Others - UAT</td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.othersUATPrevention"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.othersUATAppraisal"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.othersUATInternalFailure"> </td>
                                            <td>$
                                                <input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.othersUATExternalFailure"> </td>
                                            <td  align="center">NA
                                                <!-- <input id="testingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)"  step="0.02" ng-model="tableVal.othersUATPerformance" disabled> --></td>
                                            <td><span id="othersUATTotal" ng-disabled="!tableVal.project" ng-model="tableVal.othersUATTotal">{{tableVal.othersUATPrevention+tableVal.othersUATAppraisal+tableVal.othersUATInternalFailure+tableVal.othersUATExternalFailure+tableVal.othersUATPerformance | currency:undefined:2  }} </span></td>
                                            <td style="text-align: center;"><span class="redStar" ng-hide="tableVal.overAllCost">0.00*</span><span ng-show="tableVal.overAllCost" ng-model="tableVal.othersUATPercent">{{tableVal.othersUATPercent}}</span>%</td>
                                        </tr>
                                        <tr class="TestingPart">
                                            <td colspan="7" style="text-align:right ! important">TOTAL</td>
                                            <td><span id="testingTotal" ng-disabled="!tableVal.project" ng-model="tableVal.testingTotal">{{tableVal.tcsQAPrevention + tableVal.tcsQAAppraisal+tableVal.tcsQAInternalFailure+tableVal.tcsQAExternalFailure+tableVal.tcsQAPerformance + tableVal.othersPrevention +tableVal.othersAppraisal+tableVal.othersInternalFailure+tableVal.othersExternalFailure+tableVal.othersPerformance 
								    		+tableVal.tcsQAUATPrevention + tableVal.tcsQAUATAppraisal+tableVal.tcsQAUATInternalFailure+tableVal.tcsQAUATExternalFailure+tableVal.tcsQAUATPerformance+tableVal.othersUATPrevention +tableVal.othersUATAppraisal+tableVal.othersUATInternalFailure+tableVal.othersUATExternalFailure+tableVal.othersUATPerformance | currency:undefined:2 }} </span></td>
                                            <td style="text-align: center;"><span ng-model="tableVal.testingTotalPercent">{{tableVal.testingTotalPercent}}</span>%</td>
                                        </tr>

                                        <tr class="NonTestingPart">
                                            <td rowspan="4"><span class="textRotate textRotateStyle">NON TESTING</span></td>
                                            <td>BA</td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingBAPreventionCost"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingBAAppraisalCost"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingBAInternalFailure"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingBAExternalFailure"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingBAPreformanceCost" > </td>
                                            <td><span id="nonTestingBATotalCost" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingBATotalCost">{{tableVal.nonTestingBAPreventionCost+tableVal.nonTestingBAAppraisalCost+tableVal.nonTestingBAInternalFailure+tableVal.nonTestingBAExternalFailure+tableVal.nonTestingBAPreformanceCost | currency:undefined:2 }}</span></td>
                                            <td style="text-align: center;"><span class="redStar" ng-hide="tableVal.overAllCost">0.00*</span><span ng-show="tableVal.overAllCost"  ng-model="tableVal.nonTestBAPercent">{{tableVal.nonTestBAPercent}}</span>%</td>
                                        </tr>
                                        <tr class="NonTestingPart">
                                            <td>Development</td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingDevelopmentPreventionCost"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingDevelopmentAppraisalCost"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingDevelopmentInternalFailure"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingDevelopmentExternalFailure"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingDevelopmentPreformanceCost" > </td>
                                            <td><span id="nonTestingDevelopmentTotalCost" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingDevelopmentTotalCost">{{tableVal.nonTestingDevelopmentPreventionCost+tableVal.nonTestingDevelopmentAppraisalCost+tableVal.nonTestingDevelopmentInternalFailure+tableVal.nonTestingDevelopmentExternalFailure+tableVal.nonTestingDevelopmentPreformanceCost | currency:undefined:2 }}</span></td>
                                            <td style="text-align: center;"><span class="redStar" ng-hide="tableVal.overAllCost">0.00*</span><span ng-show="tableVal.overAllCost"  ng-model="tableVal.nonTestDevPercent">{{tableVal.nonTestDevPercent}}</span>%</td>
                                        </tr>
                                        <tr class="NonTestingPart">
                                            <td>Project Management</td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingProjectPreventionCost"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingProjectAppraisalCost"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingProjectInternalFailure"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingProjectExternalFailure"></td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingProjectPreformanceCost" > </td>
                                            <td><span id="nonTestingProjectTotalCost" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingProjectTotalCost">{{tableVal.nonTestingProjectPreventionCost+tableVal.nonTestingProjectAppraisalCost+tableVal.nonTestingProjectInternalFailure+tableVal.nonTestingProjectExternalFailure+tableVal.nonTestingProjectPreformanceCost | currency:undefined:2 }}</span></td>

                                            <td style="text-align: center;"><span class="redStar" ng-hide="tableVal.overAllCost">0.00*</span><span ng-show="tableVal.overAllCost"  ng-model="tableVal.nonTestProjPercent">{{tableVal.nonTestProjPercent}}</span>%</td>
                                        </tr>
                                        <tr class="NonTestingPart">
                                            <td>Others</td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingOthersPreventionCost" > </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingOthersAppraisalCost"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingOthersInternalFailure"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingOthersExternalFailure"> </td>
                                            <td>$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" id="nonTestingInput" type="number" ng-change="updatePercent(tableVal.overAllCost)" placeholder="0.00" step="0.02" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingOthersPreformanceCost" ></td>
                                            <td><span id="nonTestingOthersTotalCost" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingOthersTotalCost">{{tableVal.nonTestingOthersPreventionCost+tableVal.nonTestingOthersAppraisalCost+tableVal.nonTestingOthersInternalFailure+tableVal.nonTestingOthersExternalFailure+tableVal.nonTestingOthersPreformanceCost | currency:undefined:2 }}</span></td>
                                            <td style="text-align: center;"><span class="redStar" ng-hide="tableVal.overAllCost">0.00*</span><span ng-show="tableVal.overAllCost"  ng-model="tableVal.nonTestOthersPercent">{{tableVal.nonTestOthersPercent}}</span>%</td>
                                        </tr>
                                        <tr class="NonTestingPart">
                                            <td colspan="7" style="text-align:right ! important">TOTAL</td>
                                            <td><span id="abccr" ng-disabled="!tableVal.project" ng-model="tableVal.nonTestingTotal">{{tableVal.nonTestingBAPreventionCost+tableVal.nonTestingBAAppraisalCost+tableVal.nonTestingBAInternalFailure+tableVal.nonTestingBAExternalFailure+tableVal.nonTestingBAPreformanceCost+tableVal.nonTestingDevelopmentPreventionCost+tableVal.nonTestingDevelopmentAppraisalCost+tableVal.nonTestingDevelopmentInternalFailure+tableVal.nonTestingDevelopmentExternalFailure+tableVal.nonTestingDevelopmentPreformanceCost
								    		+tableVal.nonTestingProjectPreventionCost+tableVal.nonTestingProjectAppraisalCost+tableVal.nonTestingProjectInternalFailure+tableVal.nonTestingProjectExternalFailure+tableVal.nonTestingProjectPreformanceCost+tableVal.nonTestingOthersPreventionCost+tableVal.nonTestingOthersAppraisalCost+tableVal.nonTestingOthersInternalFailure+tableVal.nonTestingOthersExternalFailure+tableVal.nonTestingOthersPreformanceCost | currency:undefined:2 }}</span></td>
                                            <td style="text-align: center;"><span ng-model="tableVal.nonTestingPercent">{{tableVal.nonTestingPercent}}</span>%</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div style="margin-top: -1%; margin-bottom: 1%;"><span class="redStar">* </span> - Indicates that Overall Project cost is not Entered</div>
                            </div>
							
									
									<div class="col-sm-4 col-md-4 col-lg-4" style="margin-top:1%">
									<label> Project Completion date:</label>
							<input type="datetime" id="goLiveDate" ng-model="tableVal.projectEndDate" /><span style="position: absolute; right: 52px; color:red;">*</span>
							<br>
							</div>					

                            <div class="col-sm-12 col-md-12 col-lg-12 projectCOQCommentsTable" style="margin-top:2%">
                                <table class="table table-bordered">
                                      <tbody>
                                        <tr class="TestingPart">
                                            <td style="width: 25%; vertical-align: middle;">Overall Project cost</td>
                                             <td style="width: 25%;" colspan="1">$<input onchange="(function(el){el.value=parseFloat(el.value).toFixed(2);})(this)" ng-disabled="!tableVal.project" ng-model="tableVal.overAllCost" id="testingInput" type="number" min="0" placeholder="0.00" step="0.02" ng-change="updatePercent(tableVal.overAllCost)"></td>
                                             <td style="width: 50%;" colspan="1">
                                                <textarea style="border: none; width: 100%;" ng-disabled="!tableVal.project" ng-model="tableVal.overAllCostComments" id="testingInput" type="text" placeholder="Comments" maxlength="500"></textarea>
                                            </td>
                                        </tr>
                                        <tr class="TestingPart">
                                            <td style="vertical-align: middle;">Testing related Cost - Comments</td>
                                            
                                            <td id="testingInputcomm1" colspan="2" >
                                                <textarea style="border: none" ng-disabled="!tableVal.project" id="testingInputcomm" ng-model="tableVal.testRelatedComments" type="text" placeholder="Comments" maxlength="500"></textarea>
                                            </td>
                                      
                                        </tr>
                                        <tr class="NonTestingPart">
                                            <td style="vertical-align: middle;">NON Testing related Cost - Comments</td>
                                            
                                               
                                            <td id="nonTestingInputcomm1" colspan="2">
                                                <textarea style="border: none" ng-disabled="!tableVal.project" ng-model="tableVal.nontestRelatedComments"  id="nonTestingInputcomm" type="text" placeholder="Comments" maxlength="500"></textarea>
                                            </td>
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div style="float:right;">
                                <div class="col-sm-3 col-md-3 col-lg-3">
                                    <button type="button"  class="btn btn-primary submitBtn" ng-click="processTableData(tableVal)" style="margin-top: -11px;" ng-show="tableVal.project && !alreadyLoaded">SUBMIT</button>
                                    <button type="button"  class="btn btn-primary submitBtn" ng-click="processTableData(tableVal)" style="margin-top: -11px;" ng-show="tableVal.project && alreadyLoaded">UPDATE</button>
                                </div>
                                <div class="col-sm-3 col-md-3 col-lg-3">
                                    <button type="button" class="btn btn-primary" ng-click="resetAll()"style="margin-top: -11px;" ng-show="tableVal.project">RESET</button>
                                </div>
                                <div class="col-sm-3 col-md-3 col-lg-3">
                                    <button type="button" class="btn btn-primary" ng-click="cancel()" style="margin-top: -11px;" ng-show="tableVal.project">CANCEL</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <section class="footerSection">
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </section>
</div>
</body>
<script src="<c:url value="js/css3-animate-it.js"/>"></script>
</html>
