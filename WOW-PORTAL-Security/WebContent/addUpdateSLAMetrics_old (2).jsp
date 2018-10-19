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

.sideBarArea .metismenu .pageNameMenu a {
    padding: 19px 0px 11px 19px;
}
.sideBarArea .metismenu li:nth-child(1) a img {
width: 25px;
}
input[type=number]:disabled{
cursor:not-allowed
}
textarea:disabled{
cursor:not-allowed
}

.ui-datepicker-trigger {
	width: 20px ! important;
}
.addRedBorder {
	border: 1px solid red;
}
.removeRedBorder {
	border: 1px solid white;
}
input[type=image] {
	height: 20px ! important;
	margin-top: 4px! important;
}
.dateSpaceLess{
	left: -19% ! important;
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
        left: 2px;
}
.mandatory:after { content:"*"; }
::-webkit-input-placeholder {
   text-align: center;
}

:-ms-input-placeholder {  
   text-align: center; 
}
.inputField{
    text-align:center;
    width: 85%;
}
textarea-placeholder {
	vertical-align: bottom;
}
@media only screen and (min-width:1200px) and (max-width:1360px) {.addUpdate-Update {margin-left:-1% ! important;}}
@media only screen and (min-width:1361px) and (max-width:2500px) {.addUpdate-Update {margin-left:8% ! important;}}

input::-webkit-input-placeholder { /* WebKit, Blink, Edge */
color: #123456;
opacity:.95;
text-align:center ! important;
 transition: opacity 0.3s ease;
 
}

input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
color: #123456;
opacity: 1;
text-align:center ! important;
 transition: opacity 0.3s ease;
}
input::-moz-placeholder { /* Mozilla Firefox 19+ */
color: #123456;
opacity: 1;
text-align:center ! important;
 transition: opacity 0.3s ease;
}
input:focus::-webkit-input-placeholder {opacity: 0; transition: opacity 0.3s ease;}
input:focus::-moz-placeholder          {opacity: 0; transition: opacity 0.3s ease;}
input:focus:-moz-placeholder           {opacity: 0; transition: opacity 0.3s ease;}


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
	background-color : rgb(255,191,0);
}
.setRedColor {
	background-color : rgb(255,77,77);
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

<script>
$(document).ready(function(){
	$("#projectDetailsTable tbody tr:nth-child(1)").css("font-weight", "bold");
	$("#projectDetailsTable").css("text-align","center");
	$("#defectCountTable tbody tr:nth-child(1)").css("font-weight", "bold");
	$("#defectCountTable").css("text-align","center");
	$("#rootCauseTable tbody tr:nth-child(1)").css("font-weight", "bold");
	$("#rootCauseTable").css("text-align","center");
	
	$('#slaDefinitionLabels').click(function(){
		window.open('SLAMetricsDefinitions.jsp','_blank');
	});
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
              if(element[0].id==="reviewedDate"){
           	   $(".ui-datepicker-trigger").addClass("dateSpaceLess");
              } else {
           	   $(".ui-datepicker-trigger").removeClass("dateSpaceLess");
              }
            })
              
        }
    }
});
SLAMetricsApp.controller('SLAMetricsController',function($scope,$http){
	$scope.SLAMetricsValue={};
	$scope.SLAMetricsValue.allow = true;
	
	$scope.calculateEffortSlippage = function(SLAMetricsValue) {
		if(SLAMetricsValue.gold<=0 || SLAMetricsValue.gold===undefined)
			return 0;
		else 
			return +(((SLAMetricsValue.sit_actual_effort-SLAMetricsValue.gold)/SLAMetricsValue.gold)*100).toFixed(2) || 0;
	
	}
	
	$scope.calculateSITRejection = function(SLAMetricsValue) {
	if(SLAMetricsValue.defectsSITTotalRootCause<=0 || SLAMetricsValue.defectsSITTotalRootCause===undefined)
		return 0;
	else 
		return +(((SLAMetricsValue.sit_data+SLAMetricsValue.sit_test_script)/SLAMetricsValue.defectsSITTotalRootCause)*100).toFixed(2) || 0;
	}
	$scope.calculateUATRejection = function(SLAMetricsValue) {
		if(SLAMetricsValue.defectsUATTotalRootCause<=0 || SLAMetricsValue.defectsUATTotalRootCause===undefined)
			return 0;
		else 
			return +(((SLAMetricsValue.uat_data+SLAMetricsValue.uat_test_script)/SLAMetricsValue.defectsUATTotalRootCause)*100).toFixed(2) || 0;
		}
	$scope.calculatePRODRejection = function(SLAMetricsValue) {
		if(SLAMetricsValue.defectsPRODTotalRootCause<=0 || SLAMetricsValue.defectsPRODTotalRootCause==undefined)
			return 0;
		else 
			return +(((SLAMetricsValue.prod_data+SLAMetricsValue.prod_test_script)/SLAMetricsValue.defectsPRODTotalRootCause)*100).toFixed(2) || 0;
		}
	
	$scope.calculateSITTestEffectiveness = function(SLAMetricsValue) {
		if(SLAMetricsValue.defectsSITTotalStatus===undefined)
			SLAMetricsValue.defectsSITTotalStatus = 0;
		if(SLAMetricsValue.defectsUATTotalStatus===undefined)
			SLAMetricsValue.defectsUATTotalStatus = 0;
		if(SLAMetricsValue.defectsPRODTotalStatus===undefined)
			SLAMetricsValue.defectsPRODTotalStatus = 0;
		if(SLAMetricsValue.defectsSITTotalStatus<=0 || SLAMetricsValue.defectsSITTotalStatus===undefined)
			return 0;
		else
			return +((SLAMetricsValue.defectsSITTotalStatus/(SLAMetricsValue.defectsSITTotalStatus+SLAMetricsValue.defectsUATTotalStatus+SLAMetricsValue.defectsPRODTotalStatus))*100).toFixed(2) || 0 ;
	}
	
	$scope.calculateUATTestEffectiveness = function(SLAMetricsValue) {
		if(SLAMetricsValue.defectsSITTotalStatus===undefined)
			SLAMetricsValue.defectsSITTotalStatus = 0;
		if(SLAMetricsValue.defectsUATTotalStatus===undefined)
			SLAMetricsValue.defectsUATTotalStatus = 0;
		if(SLAMetricsValue.defectsPRODTotalStatus===undefined)
			SLAMetricsValue.defectsPRODTotalStatus = 0;
		if(SLAMetricsValue.defectsUATTotalStatus<=0 || SLAMetricsValue.defectsUATTotalStatus===undefined)
			return 0;
		else
			return +((SLAMetricsValue.defectsUATTotalStatus/(SLAMetricsValue.defectsSITTotalStatus+SLAMetricsValue.defectsUATTotalStatus+SLAMetricsValue.defectsPRODTotalStatus))*100).toFixed(2) || 0;
	}
	
	$scope.calculatePRODTestEffectiveness = function(SLAMetricsValue) {
		if(SLAMetricsValue.defectsSITTotalStatus===undefined)
			SLAMetricsValue.defectsSITTotalStatus = 0;
		if(SLAMetricsValue.defectsUATTotalStatus===undefined)
			SLAMetricsValue.defectsUATTotalStatus = 0;
		if(SLAMetricsValue.defectsPRODTotalStatus===undefined)
			SLAMetricsValue.defectsPRODTotalStatus = 0;
		if(SLAMetricsValue.defectsPRODTotalStatus<=0 || SLAMetricsValue.defectsPRODTotalStatus===undefined)
			return 0;
		else
			return +((SLAMetricsValue.defectsPRODTotalStatus/(SLAMetricsValue.defectsSITTotalStatus+SLAMetricsValue.defectsUATTotalStatus+SLAMetricsValue.defectsPRODTotalStatus))*100).toFixed(2) || 0;
	}
	
	$scope.calculateSITFailureRate = function(SLAMetricsValue) {
		if(SLAMetricsValue.sit_data<=0 || SLAMetricsValue.sit_data=== undefined) {
			SLAMetricsValue.sit_data=0;
		}
		if(SLAMetricsValue.sit_test_script<=0 || SLAMetricsValue.sit_test_script=== undefined) {
			SLAMetricsValue.sit_test_script=0;
		}
		if(SLAMetricsValue.total_scripts<=0 || SLAMetricsValue.total_scripts===undefined)
			return 0;
		else
			return +(((SLAMetricsValue.defectsSITTotalStatus-(SLAMetricsValue.sit_data+SLAMetricsValue.sit_test_script))/SLAMetricsValue.total_scripts)*100).toFixed(2) || 0;
	}
	
	$scope.calculateUATFailureRate = function(SLAMetricsValue) {
		if(SLAMetricsValue.uat_data<=0 || SLAMetricsValue.uat_data=== undefined) {
			SLAMetricsValue.uat_data=0;
		}
		if(SLAMetricsValue.uat_test_script<=0 || SLAMetricsValue.uat_test_script=== undefined) {
			SLAMetricsValue.uat_test_script=0;
		}
		if(SLAMetricsValue.total_scripts<=0 || SLAMetricsValue.total_scripts===undefined)
			return 0;
		else
			return +(((SLAMetricsValue.defectsUATTotalStatus-(SLAMetricsValue.uat_data+SLAMetricsValue.uat_test_script))/SLAMetricsValue.total_scripts)*100).toFixed(2) || 0;
	}
	
	$scope.calculatePRODFailureRate = function(SLAMetricsValue) {
		if(SLAMetricsValue.prod_data<=0 || SLAMetricsValue.prod_data=== undefined) {
			SLAMetricsValue.prod_data=0;
		}
		if(SLAMetricsValue.prod_test_script<=0 || SLAMetricsValue.prod_test_script=== undefined) {
			SLAMetricsValue.prod_test_script=0;
		}
		if(SLAMetricsValue.total_scripts<=0 || SLAMetricsValue.total_scripts===undefined)
			return 0;
		else
			return +(((SLAMetricsValue.defectsPRODTotalStatus-(SLAMetricsValue.prod_data+SLAMetricsValue.prod_test_script))/SLAMetricsValue.total_scripts)*100).toFixed(2) || 0;
	}
	
	
	
	$scope.finalSubmition = function(SLAMetricsValue) {
		var mandatorySuccess = true;
		SLAMetricsValue.scheduleSlippage = +$scope.scheduleSlippage;
		console.log("SLAMetricsValue---------------------"+SLAMetricsValue);
		if($scope.scheduleSlippage<=0 || $scope.scheduleSlippage==undefined) {
			if(isNaN($scope.plannedDuration) || $scope.plannedDuration<=0) {
				$("#sit_planned_period_from").addClass("addRedBorder");
				$("#sit_planned_period_to").addClass("addRedBorder");
			} else {
				$("#sit_planned_period_from").addClass("removeRedBorder");
				$("#sit_planned_period_to").addClass("removeRedBorder");
			}
			if(isNaN($scope.actualDuration) || $scope.actualDuration<=0) {
				$("#sit_actual_period_from").addClass("addRedBorder");
				$("#sit_actual_period_to").addClass("addRedBorder");	
			} else {
				$("#sit_actual_period_from").addClass("removeRedBorder");
				$("#sit_actual_period_to").addClass("removeRedBorder");
			}
			
			mandatorySuccess = false;
		} else {
			$("#sit_planned_period_from").addClass("removeRedBorder");
			$("#sit_planned_period_to").addClass("removeRedBorder");
			$("#sit_actual_period_from").addClass("removeRedBorder");
			$("#sit_actual_period_to").addClass("removeRedBorder");
		}
		
		if(SLAMetricsValue.effortSlippage<=0 || SLAMetricsValue.effortSlippage==undefined) {
			if(SLAMetricsValue.gold<=0 || SLAMetricsValue.gold==undefined) {
				$("#sit_gold").addClass("addRedBorder");
			} else {
				$("#sit_gold").addClass("removeRedBorder");
			}
			
			if(SLAMetricsValue.sit_actual_effort<=0 || SLAMetricsValue.sit_actual_effort==undefined) {
				$("#sit_actual_effort").addClass("addRedBorder");	
			} else {
				$("#sit_actual_effort").addClass("removeRedBorder");
			}
			mandatorySuccess = false;
		} else {
			$("#sit_gold").addClass("removeRedBorder");
			$("#sit_actual_effort").addClass("removeRedBorder");
		}
			
			if(SLAMetricsValue.defectsSITTotalRootCause<=0 || SLAMetricsValue.defectsSITTotalRootCause==undefined) {
				$("#totalSITDefects").removeClass("removeRedBorder");
				$("#totalSITDefects").addClass("addRedBorder");
				mandatorySuccess = false;
			} else {
				$("#totalSITDefects").addClass("removeRedBorder");
			}
			
		if(SLAMetricsValue.sitTestEffectiveness<=0 || SLAMetricsValue.sitTestEffectiveness==undefined) {
			if((SLAMetricsValue.defectsSITTotalStatus<=0 || SLAMetricsValue.defectsSITTotalStatus==undefined)) {
				if(SLAMetricsValue.defectsSITTotalStatus<=0 || SLAMetricsValue.defectsSITTotalStatus==undefined) {
					$("#totalSITDefectsCount").addClass("addRedBorder");
				} else {
					$("#totalSITDefectsCount").addClass("removeRedBorder");
				}
				/* if(SLAMetricsValue.defectsUATTotalStatus<=0 || SLAMetricsValue.defectsUATTotalStatus==undefined) {
					$("#totalUATDefectsCount").addClass("addRedBorder");
				} else {
					$("#totalUATDefectsCount").addClass("removeRedBorder");
				}
				if(SLAMetricsValue.defectsPRODTotalStatus<=0 || SLAMetricsValue.defectsPRODTotalStatus==undefined) {
					$("#totalPRODDefectsCount").addClass("addRedBorder");
				} else {
					$("#totalPRODDefectsCount").addClass("removeRedBorder");
				} */
				
			} else {
				$("#totalSITDefectsCount").addClass("removeRedBorder");
				$("#totalUATDefectsCount").addClass("removeRedBorder");
				$("#totalPRODDefectsCount").addClass("removeRedBorder");
			}
			mandatorySuccess = false;
		} else {
			$("#totalSITDefectsCount").addClass("removeRedBorder");
			$("#totalUATDefectsCount").addClass("removeRedBorder");
			$("#totalPRODDefectsCount").addClass("removeRedBorder");
		}
		
		if(SLAMetricsValue.sitFailureRate<=0 || SLAMetricsValue.sitFailureRate==undefined) {
			if(SLAMetricsValue.total_scripts<=0 || SLAMetricsValue.total_scripts==undefined) {
				$("#sitFailureCount").addClass("addRedBorder");
			} else {
				$("#sitFailureCount").addClass("removeRedBorder");
			}
			mandatorySuccess = false;
		} else {
			$("#sitFailureCount").addClass("removeRedBorder");
		}
		
		if($scope.SLAMetricsValue.reviewed=="1" &&(!($scope.SLAMetricsValue.reviewed_date) || $scope.SLAMetricsValue.reviewed_date==null || $scope.SLAMetricsValue.reviewed_date=="" || $scope.SLAMetricsValue.reviewed_date==undefined)) {
			$("#reviewedDate").removeClass("removeRedBorder");
			$("#reviewedDate").addClass("addRedBorder");
			mandatorySuccess = false;
		} else {
			$("#reviewedDate").removeClass("addRedBorder");
			$("#reviewedDate").addClass("removeRedBorder");
		}
		
		if(($scope.scheduleSlippage>5 || $scope.SLAMetricsValue.effortSlippage>5) && (SLAMetricsValue.comments_project_details=="" || SLAMetricsValue.comments_project_details==undefined)) {
			toastr.error('Failed', 'Please enter Project Detailed Comments', {
	       		  closeButton: true
	       		});
			mandatorySuccess = false;	
		}
		if((($scope.SLAMetricsValue.sitTestEffectiveness<=94 && $scope.SLAMetricsValue.sitTestEffectiveness>0) || ($scope.SLAMetricsValue.sitFailureRate<10 && $scope.SLAMetricsValue.sitFailureRate>0)) && ($scope.SLAMetricsValue.def_comments=="" || $scope.SLAMetricsValue.def_comments==undefined)) {
			toastr.error('Failed', 'Please enter Defect Count Comments', {
	       		  closeButton: true
	       		});
			mandatorySuccess = false;
		}  
		if(($scope.SLAMetricsValue.sitDefectRejection>=11 || $scope.SLAMetricsValue.uatDefectRejection>=11 || $scope.SLAMetricsValue.prodDefectRejection>=11) && ($scope.SLAMetricsValue.root_comments=="" || $scope.SLAMetricsValue.root_comments==undefined)) {
			toastr.error('Failed', 'Please enter Root Cause Comments', {
	       		  closeButton: true
	       		});
			mandatorySuccess = false;
		}
		
		
		if(mandatorySuccess===false) {
			toastr.error('Failed', 'Please enter mandatory data', {
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
						 $scope.SLAMetricsValue = {};
	     	    	$scope.scheduleSlippage = 0;
	     	    	$scope.SLAMetricsValue.allow = true;
	        		 })
		        .error(function(){
		        	toastr.error('Error', 'Try Updating It', {
		        		  closeButton: true
		        		});
		        });
		}
	}
	
	$scope.gotoHome = function() {
		window.location.href="home.jsp";
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
	
	$scope.setTestEffectivenessColor = function(value) {
		if(value>94 && value<=100)
			return "setGreenColor";
		else if(value>90 && value<=94)
			return "setAmberColor";
		else if(value<=90 && value>0)
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
        	$scope.SLAMetricsValue.project = result[0];
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
    	    else {
    	    	$scope.SLAMetricsValue = {};
    	    	$scope.scheduleSlippage = 0;
    	    }
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
    	$scope.scheduleSlippage = 0;
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
		
		if($scope.plannedDuration>=0 && $scope.actualDuration>=0) {
			$scope.scheduleSlippage = ((($scope.actualDuration - $scope.plannedDuration)/$scope.plannedDuration)*100).toFixed(2);	
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
			Add SLA Metrics
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
							      <select ng-model="SLAMetricsValue.portfolio" ng-init="SLAMetricsValue.portfolio='Select'" ng-change="loadAllProjects(SLAMetricsValue.portfolio)" class="form-control portfolioSelect" id="sel1" style="margin-top: -3px;">
							      <option value="Select" selected>Select</option>
							         <option>DIGITAL</option>
							       	 <option>ENTERPRISE APPLICATION</option>
							         <option>GFS</option>
							         <option>STORES</option>
							         <option>SAP</option>
							         <option>SUPPLY CHAIN</option>
							  </select>
							</div>
						<div class="col-md-4 projectSelectDiv">
							      <select  class="form-control projectSelect" ng-init="SLAMetricsValue.project='Select'" ng-disabled="SLAMetricsValue.portfolio==='Select'? true : false" ng-model="SLAMetricsValue.project" id="sel4" style="margin-top: -3px;" ng-options="v as v for (k,v) in dropDownvals">
							      
							      </select>
						</div>
      						<div>
						<div class="col-lg-1" style="margin-right:10%;">
							<button type="button" class="btn btn-primary submitBtn" style="margin-top: -17px;" ng-disabled = "SLAMetricsValue.portfolio==='Select'? true : false" ng-click="fetchSLADetails(SLAMetricsValue.portfolio,SLAMetricsValue.project)">SEARCH</button>
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
							  <div id="slaDefinitionLabels" style="float:left; color: #FF4500; margin-right:36px; margin-top: 16px;"> 
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
								        <td rowspan="2" style="vertical-align: middle; color: rgba(0,0,0,.87);">Test Phase</td>
	                                    <td colspan="2" style="vertical-align: middle;" rowspan="2">Planned Testing Period<span style="color:red;"> *</span></td>
	                                    <td colspan="2" style="vertical-align: middle;" rowspan="2">Actual Testing Period<span style="color:red;"> *</span></td>
	                                    <td colspan="3" style="vertical-align: middle;">Planned Testing Efforts in PD</td>
		                                <td rowspan="2" style="vertical-align: middle;">Actual Testing Efforts in PD<span style="color:red;"> *</span></td>
	                                    <td rowspan="2" style="vertical-align: middle;">Total # of scripts<span style="color:red;"> *</span></td>
	                                    <td colspan="3" style="vertical-align: middle; color: #8AC759;">SCHEDULE SLIPPAGE</td>
	                                    <td colspan="3" style="vertical-align: middle; color: #8AC759;">EFFORT <br> SLIPPAGE</td>
					    			</tr>
					    			<tr style="background-color: #F5F5F5;">
					    				<td>Silver</td>
					    				<td>Bronze</td>
					    				<td>Gold<span style="color:red;font-weight: bold;"> *</span></td>
					    				<td style="color: #8AC759;"><=5</td>
								      	<td style="color: rgb(255,191,0);">>5<=15</td>
								      	<td style="color: rgb(255,77,77);">>15</td>
								      	<td style="color: #8AC759;"><=5</td>
								      	<td style="color: rgb(255,191,0);">>5<=15</td>
								      	<td style="color: rgb(255,77,77);">>15</td>
					    				
					    			</tr>
								      <tr style="background-color: white;">
								      	  	<td> SIT </td>
								      	  	<td><input type="text" id="sit_planned_period_from" datepicker="" class="inputField" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" loaded="{{SLAMetricsValue.sit_planned_period_from}}" ng-model="SLAMetricsValue.sit_planned_period_from" ng-change="calculateSlippage();"/></td>
								      	  	<td><input type="text" id="sit_planned_period_to" datepicker="" class="inputField" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" loaded="{{SLAMetricsValue.sit_planned_period_to}}" ng-model="SLAMetricsValue.sit_planned_period_to" ng-change="calculateSlippage();"/></td>
								      	  	<td><input type="text" id="sit_actual_period_from" datepicker="" class="inputField" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" loaded="{{SLAMetricsValue.sit_actual_period_from}}" ng-model="SLAMetricsValue.sit_actual_period_from" ng-change="calculateSlippage();"/></td>
								      	  	<td><input type="text" id="sit_actual_period_to" datepicker="" class="inputField" ng-disabled="SLAMetricsValue.allow" style="background-color: white;" loaded="{{SLAMetricsValue.sit_actual_period_to}}" ng-model="SLAMetricsValue.sit_actual_period_to" ng-change="calculateSlippage();"/></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" placeholder="0" class="inputField" min="0" style="background-color: white;" ng-model="SLAMetricsValue.silver" ></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" placeholder="0" class="inputField" min="0" style="background-color: white;" ng-model="SLAMetricsValue.bronze"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" placeholder="0" class="inputField" min="0" style="background-color: white;" id = "sit_gold" ng-model="SLAMetricsValue.gold"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" placeholder="0" class="inputField" min="0" style="background-color: white;" id="sit_actual_effort" ng-model="SLAMetricsValue.sit_actual_effort"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" placeholder="0" class="inputField" min="0" id="sitFailureCount" style="background-color: white;" ng-model="SLAMetricsValue.total_scripts"></td>
								      	  	<td ng-class="setSlippageColor(scheduleSlippage)" id="scheduleSlippageId" colspan="3"> {{scheduleSlippage || 0}} </td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.effortSlippage" class="inputField" ng-value="SLAMetricsValue.effortSlippage = calculateEffortSlippage(SLAMetricsValue)">
								      	  	<td ng-class="setSlippageColor(SLAMetricsValue.effortSlippage)" colspan="3" ng-model="SLAMetricsValue.effortSlippage">{{SLAMetricsValue.effortSlippage}}</td>
								      </tr>
								      </tbody>
								   
								   </table>
								   </div>
								    <div class="col-sm-12 col-md-12 col-lg-12">
								    		<textarea rows="3" cols="100" maxlength="500" placeholder="Comments:" style="width: 100%; height: 100%; border: 3px solid #ddd;margin-bottom: 1.5%;" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.comments_project_details"></textarea>	
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
								        <td rowspan="2" style="vertical-align: middle; color: rgba(0,0,0,.87);">Test Phase</td>
	                                    <td rowspan="2" rowspan="2" style="vertical-align: middle;">Code</td>
	                                    <td rowspan="2" rowspan="2" style="vertical-align: middle;">Requirements</td>
	                                    <td rowspan="2" style="vertical-align: middle;">Design</td>
		                                <td rowspan="2" style="vertical-align: middle;">Environment</td>
	                                    <td rowspan="2" style="vertical-align: middle;">Data</td>
	                                    <td rowspan="2" style="vertical-align: middle;">Test Scripts</td>
	                                    <td rowspan="2" style="vertical-align: middle;">Exists in PROD</td>
	                                    <td rowspan="2" style="vertical-align: middle;">Others</td>
	                                    <td rowspan="2" style="vertical-align: middle;">Total</td>
	                                    <td colspan="3" style="vertical-align: middle; color: #8AC759;">DEFECT REJECTION</td>
					    			</tr>
					    			<tr style="background-color: #F5F5F5;">
					    				<td style="color: #8AC759;"> <11</td>
								      	<td style="color: rgb(255,191,0);">>11-15</td>
								      	<td style="color: rgb(255,77,77);">>15</td>
					    			</tr>
								      <tr style="background-color: white;">
								      	  	<td> SIT </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" min="0" placeholder="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_code"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" min="0" placeholder="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_req"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" min="0" placeholder="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_design"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" min="0" placeholder="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_environment"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" min="0" placeholder="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_data"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" min="0" placeholder="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_test_script"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" min="0" placeholder="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_exist_prod"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" min="0" placeholder="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_others"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsSITTotalRootCause" class="inputField" ng-value="SLAMetricsValue.defectsSITTotalRootCause = SLAMetricsValue.sit_code + SLAMetricsValue.sit_req + SLAMetricsValue.sit_design + SLAMetricsValue.sit_environment + SLAMetricsValue.sit_data + SLAMetricsValue.sit_test_script + SLAMetricsValue.sit_exist_prod + SLAMetricsValue.sit_others">
											<td><input type="number" id="totalSITDefects" ng-model="SLAMetricsValue.defectsSITTotalRootCause" disabled  style="background-color: white; width: 85%; text-align: center;"><span style="color:red; font-weight: bold;"> *</span></td>
								      	  	
								      	  	<input type="hidden" ng-model="SLAMetricsValue.sitDefectRejection" class="inputField" ng-value="SLAMetricsValue.sitDefectRejection = calculateSITRejection(SLAMetricsValue)">
								      	  	<td rowspan="3" style="vertical-align: middle;" ng-class="setDefectRejectionColor(SLAMetricsValue.sitDefectRejection)" colspan="3">{{SLAMetricsValue.sitDefectRejection}}</td>
								      </tr>
								      <tr style="background-color: #F5F5F5;">
								      	  	<td> UAT </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_code" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_req" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_design" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_environment" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_data" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_test_script" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_exist_prod" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_others" style="background-color: #F5F5F5;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsUATTotalRootCause" class="inputField" ng-value="SLAMetricsValue.defectsUATTotalRootCause = SLAMetricsValue.uat_code + SLAMetricsValue.uat_req + SLAMetricsValue.uat_design + SLAMetricsValue.uat_environment + SLAMetricsValue.uat_data + SLAMetricsValue.uat_test_script + SLAMetricsValue.uat_exist_prod + SLAMetricsValue.uat_others">
											<td><input type="number" id="totalUATDefects" ng-model="SLAMetricsValue.defectsUATTotalRootCause" disabled style="background-color: #F5F5F5; width: 85%; text-align: center;"><span style="color:red; visibility: hidden; font-weight: bold;"> *</span></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.uatDefectRejection" class="inputField" ng-value="SLAMetricsValue.uatDefectRejection = calculateUATRejection(SLAMetricsValue)">
								      	  	<td style="display:none;" ng-class="setDefectRejectionColor(SLAMetricsValue.uatDefectRejection)" colspan="3">{{SLAMetricsValue.uatDefectRejection}}</td>
								      </tr>
								      <tr style="background-color: white;">
								      	  	<td> PROD </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_code"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_req"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_design"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_environment"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_data"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_test_script"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_exist_prod"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_others"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsPRODTotalRootCause" class="inputField" ng-value="SLAMetricsValue.defectsPRODTotalRootCause = SLAMetricsValue.prod_code + SLAMetricsValue.prod_req + SLAMetricsValue.prod_design + SLAMetricsValue.prod_environment + SLAMetricsValue.prod_data + SLAMetricsValue.prod_test_script + SLAMetricsValue.prod_exist_prod + SLAMetricsValue.prod_others">
											<td><input type="number" id="totalPRODDefects" ng-model="SLAMetricsValue.defectsPRODTotalRootCause" disabled style="background-color: white; width: 85%; text-align: center;"><span style="color:red; visibility: hidden; font-weight: bold;"> *</span></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.prodDefectRejection" class="inputField" ng-value="SLAMetricsValue.prodDefectRejection = calculatePRODRejection(SLAMetricsValue)">
								      	  	<td style="display:none;" ng-class="setDefectRejectionColor(SLAMetricsValue.prodDefectRejection)" colspan="3">{{SLAMetricsValue.prodDefectRejection}}</td>
								      </tr>
								      </tbody>
								   
								   </table>
								   </div>
								    <div class="col-sm-12 col-md-12 col-lg-12">
								    		<textarea rows="3" cols="100" maxlength="500" placeholder="Comments:" style="width: 100%; height: 100%; border: 3px solid #ddd;margin-bottom: 1.5%;" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.root_comments"></textarea>	
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
								        <td rowspan="2" style="vertical-align: middle; color: rgba(0,0,0,.87);">Test Phase</td>
	                                    <td rowspan="2" rowspan="2" style="vertical-align: middle;">Open</td>
	                                    <td rowspan="2" rowspan="2" style="vertical-align: middle;">Close</td>
	                                    <td rowspan="2" style="vertical-align: middle;">Reopen<div class="colorPallet"></div></td>
		                                <td rowspan="2" style="vertical-align: middle;">Deferred / Cancelled</td>
	                                    <td rowspan="2" style="vertical-align: middle;">Total<div class="colorPallet"></div></td>
	                                    
	                                    <td rowspan="2" style="vertical-align: middle;">SEV 1</td>
	                                    <td rowspan="2" style="vertical-align: middle;">SEV 2</td>
	                                    <td rowspan="2" style="vertical-align: middle;">SEV 3</div></td>
		                                <td rowspan="2" style="vertical-align: middle;">SEV 4</td>
		                                <td rowspan="2" style="vertical-align: middle;">Total</td>
		                                
		                                <td colspan="3" style="vertical-align: middle;">TEST EFFECTIVENESS</td>
		                                <td colspan="2" style="vertical-align: middle;">FAILURE RATE</td>
					    			</tr>
					    			<tr style="background-color: #F5F5F5;">
					    				
					    				<td style="color: #8AC759;">>94</td>
								      	<td style="color: rgb(255,191,0);">>90<=94</td>
								      	<td style="color: rgb(255,77,77);"><90</td>
								      	<td style="color: #8AC759;"> >=10</td>
								      	<td style="color: rgb(255,191,0);"><10</td>
					    				
					    			</tr>
								      <tr style="background-color: white;">
								      	  	<td>SIT</td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_open"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_close"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_reopen"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_deferred"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsSITTotalStatus" class="inputField" ng-value="SLAMetricsValue.defectsSITTotalStatus = SLAMetricsValue.sit_open + SLAMetricsValue.sit_close + SLAMetricsValue.sit_reopen + SLAMetricsValue.sit_deferred">
								      	  	<td><input type="number" id="totalSITDefectsCount" class="inputField" ng-model="SLAMetricsValue.defectsSITTotalStatus" placeholder="0"  disabled style="background-color: white;"><span style="color:red; font-weight: bold;"> *</span></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_sev1"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_sev2"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_sev3"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.sit_sev4"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsSITTotalSeverity" class="inputField" ng-value="SLAMetricsValue.defectsSITTotalSeverity = SLAMetricsValue.sit_sev1 + SLAMetricsValue.sit_sev2 + SLAMetricsValue.sit_sev3 + SLAMetricsValue.sit_sev4">
								      	  	<td><input type="number" disabled ng-model="SLAMetricsValue.defectsSITTotalSeverity" placeholder="0" class="inputField" style="background-color: white;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.sitTestEffectiveness" class="inputField" ng-value="SLAMetricsValue.sitTestEffectiveness = calculateSITTestEffectiveness(SLAMetricsValue)">
								      	  	<td rowspan="3" style = "vertical-align: middle;" ng-class="setTestEffectivenessColor(SLAMetricsValue.sitTestEffectiveness)" colspan="3">{{SLAMetricsValue.sitTestEffectiveness}}</td>
								      	  	
								      	  	<input type="hidden" ng-model="SLAMetricsValue.sitFailureRate" class="inputField" ng-value="SLAMetricsValue.sitFailureRate = calculateSITFailureRate(SLAMetricsValue)">
								      	  	<td rowspan="3" style = "vertical-align: middle;" ng-class="setFailureColor(SLAMetricsValue.sitFailureRate)" colspan="2">{{SLAMetricsValue.sitFailureRate}}</td>
								      </tr>
								      <tr style="background-color: #F5F5F5;">
								      	  	<td> UAT </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_open" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_close" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_reopen" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_deferred" style="background-color: #F5F5F5;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsUATTotalStatus" class="inputField" ng-value="SLAMetricsValue.defectsUATTotalStatus = SLAMetricsValue.uat_open + SLAMetricsValue.uat_close + SLAMetricsValue.uat_reopen + SLAMetricsValue.uat_deferred">
								      	  	<td><input type="number"id="totalUATDefectsCount"  class="inputField" placeholder="0" ng-model="SLAMetricsValue.defectsUATTotalStatus" disabled style="background-color: #F5F5F5;"><span style="color:red; visibility:hidden; font-weight: bold;"> *</span></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_sev1" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_sev2" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_sev3" style="background-color: #F5F5F5;"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" ng-model="SLAMetricsValue.uat_sev4" style="background-color: #F5F5F5;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsUATTotalSeverity" class="inputField" ng-value="SLAMetricsValue.defectsUATTotalSeverity = SLAMetricsValue.uat_sev1 + SLAMetricsValue.uat_sev2 + SLAMetricsValue.uat_sev3 + SLAMetricsValue.uat_sev4">
								      	  	<td><input type="number" disabled ng-model="SLAMetricsValue.defectsUATTotalSeverity" placeholder="0" class="inputField" value=0 style="background-color: #F5F5F5;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.uatTestEffectiveness"class="inputField"  ng-value="SLAMetricsValue.uatTestEffectiveness = calculateUATTestEffectiveness(SLAMetricsValue)">
								      	  	<td style="display:none;" ng-class="setTestEffectivenessColor(SLAMetricsValue.uatTestEffectiveness)" colspan="3">{{SLAMetricsValue.uatTestEffectiveness}}</td>
								      	  	
								      	  	<input type="hidden" ng-model="SLAMetricsValue.uatFailureRate" class="inputField" ng-value="SLAMetricsValue.uatFailureRate = calculateUATFailureRate(SLAMetricsValue)">
								      	  	<td style="display:none;" ng-class="setFailureColor(SLAMetricsValue.uatFailureRate)" colspan="2">{{SLAMetricsValue.uatFailureRate}}</td>
								      </tr>
								      <tr style="background-color: white;">
								      	  	<td> PROD </td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_open"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_close"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_reopen"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_deferred"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsPRODTotalStatus" class="inputField" ng-value="SLAMetricsValue.defectsPRODTotalStatus = SLAMetricsValue.prod_open + SLAMetricsValue.prod_close + SLAMetricsValue.prod_reopen + SLAMetricsValue.prod_deferred">
								      	  	<td><input type="number" id="totalPRODDefectsCount" class="inputField" placeholder="0" ng-model="SLAMetricsValue.defectsPRODTotalStatus" disabled style="background-color: white;"><span style="color:red; visibility:hidden; font-weight: bold;"> *</span></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_sev1"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_sev2"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_sev3"></td>
								      	  	<td><input type="number" ng-disabled="SLAMetricsValue.allow" class="inputField" placeholder="0" min="0" style="background-color: white;" ng-model="SLAMetricsValue.prod_sev4"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.defectsPRODTotalSeverity" class="inputField" ng-value="SLAMetricsValue.defectsPRODTotalSeverity = SLAMetricsValue.prod_sev1 + SLAMetricsValue.prod_sev2 + SLAMetricsValue.prod_sev3 + SLAMetricsValue.prod_sev4">
								      	  	<td><input type="number" ng-model="SLAMetricsValue.defectsPRODTotalSeverity" placeholder="0" class="inputField" disabled style="background-color: white;"></td>
								      	  	<input type="hidden" ng-model="SLAMetricsValue.prodTestEffectiveness" class="inputField" ng-value="SLAMetricsValue.prodTestEffectiveness = calculatePRODTestEffectiveness(SLAMetricsValue)">
								      	  	<td style="display:none;" ng-class="setTestEffectivenessColor(SLAMetricsValue.prodTestEffectiveness)" colspan="3">{{SLAMetricsValue.prodTestEffectiveness}}</td>
								      	  	
								      	  	<input type="hidden" ng-model="SLAMetricsValue.prodFailureRate" class="inputField" ng-value="SLAMetricsValue.prodFailureRate = calculatePRODFailureRate(SLAMetricsValue)">
								      	  	<td style="display:none;" ng-class="setFailureColor(SLAMetricsValue.prodFailureRate)" colspan="2">{{SLAMetricsValue.prodFailureRate}}</td>
								      </tr>
								      </tbody>
								   
								   </table>
								   </div>
								    <div class="col-sm-12 col-md-12 col-lg-12">
								    		<textarea rows="3" cols="100" maxlength="500" placeholder="Comments:" style="width: 100%; height: 100%; border: 3px solid #ddd; margin-bottom: 1.5%;" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.def_comments"></textarea>	
    							</div>
    							 <div class="col-sm-12 col-md-12 col-lg-12">
    								<div class="col-sm-4 col-md-4 col-lg-4"><label style="font-size: larger; margin-right: 1%;">Reviewed Metrics with Project Team?</label></div>
									<div class="col-sm-1 col-md-1 col-lg-1" style="margin-left: -8%;"><input type="radio" name="addUpdate" value="0" checked style="width: 35% ! important;"ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.reviewed" > NO</div>
  									<div class="col-sm-1 col-md-1 col-lg-1" style="margin-left: -4%;"><input type="radio" name="addUpdate" value="1" style="margin-left: 1%; width: 35% ! important;"ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.reviewed" > YES</div>
  									<div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: -4%;"><input type="text" id="reviewedDate" datepicker="" loaded="{{SLAMetricsValue.reviewed_date}}" ng-disabled="SLAMetricsValue.allow" ng-model="SLAMetricsValue.reviewed_date"/></div>
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
			              					<button ng-hide="false" type="button" class="btn btn-primary cancel" ng-click="gotoHome()">CANCEL</button>
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


