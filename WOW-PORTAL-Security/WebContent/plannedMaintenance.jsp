<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add/Update Planned Maintenance Details</title> 
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
<link rel="stylesheet" href="styles/ngDialog.css">
<link rel="stylesheet" href="styles/ngDialog-theme-default.css">
<link rel="stylesheet" href="styles/angular-datepicker.css">
<link rel="stylesheet" href="<c:url value="/js/toastr.css"/>">

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.scrollify.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/ui.bootstrap.js"></script>
<script src="js/angular-1.4.7/angular-animate.js" ></script>
<script type="text/javascript" src="js/angular-datepicker.js"></script>
<script src="<c:url value="/js/toastr.min.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>


<style>
.form-control {
	padding : 0px ! important;
}
.ui-datepicker-trigger {
    position: relative ! important;
}
::-webkit-input-placeholder {
   text-align: center;
}

:-ms-input-placeholder {  
   text-align: center; 
}
input{
    text-align:center;
   
}
.inputField{
    text-align:center;
    padding: 7px 21px;
    font-size: 15px;
}
.maintenaceTable table tbody tr td:nth-child(2) {
    cursor: auto;
}
.table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th {
	background-color : white;
}
.form-control {
	width: 84%;
}

..maintenaceTable table tbody tr td:nth-child(1) {
	cursor : auto;
}
.dropbtn {
    background-color: white;
    padding: 8px 30px;
    font-size: 15px;
    border:3px;
    border-radius: 8px;
   
  }
  .checkSquare {
	width: 17px;
	height: 17px;
	margin: 20px auto;
	position: relative;
}

.checkSquare label {
	cursor: pointer;
	position: absolute;
	width: 17px;
	height: 17px;
	left: 4px;
	top: 4px;
	
   }

.checkSquare label:after {
	
	opacity: 0;
	content: '';
	position: absolute;
	width: 17px;
	height: 17px;
	top: 2px;
	left: 2px;
	
}

</style>
</head>

<script>
var app=angular.module("planApp",["ui.bootstrap"])
app.controller('selectCtrl',function($scope,$http){

	$scope.PlanValues={};
	$scope.versions=['R8','R10'];
	 $scope.selectedVer= [];
	 $scope.date = new Date().getTime();
	 $scope.Reloaded=function(){
		 window.location = '/WOW-PORTAL-Security/plannedMaintenance.jsp'
			    return
		 
	 }

	
	$scope.toggRadio=function(value){
		$scope.IsVisible = false; 
		$scope.IsVisible1 = false;
		if(value=='single'){
		 $scope.IsVisible = value == "single"; 
		 $scope.PlanValues.store_version="";
		 $scope.PlanValues.environment="";
		 $scope.PlanValues.store_no="";
		 $scope.PlanValues.fromtime="";
		 $scope.PlanValues.totime="";
		}
		if(value=='multiple'){
			 $scope.IsVisible1 = value == "multiple"; 
			 $scope.PlanValues.store_version="";
			 $scope.PlanValues.environment="";
			 $scope.PlanValues.store_no="";
			 $scope.PlanValues.fromtime="";
			 $scope.PlanValues.totime="";
		}
		}
	

	 
	  // toggle selection for a given city
	  $scope.toggleSelection = function(verName) {
	    var index = $scope.selectedVer.indexOf(verName);
	    var flag=false;
	    $scope.PlanValues.store_version="";
	 
	    if (index > -1) 
		{
	      //if already selected then removed
			$scope.selectedVer.splice(index, 1);
		 }
	    else
		{
			//if not selected then added
	    	$scope.selectedVer.push(verName);
	    }
	    
	   	 
	   	    
	       if($scope.selectedVer[0]==="R8" && $scope.selectedVer[1]==="R10"||$scope.selectedVer[1]==="R8" && $scope.selectedVer[0]==="R10"){
	    	     $scope.PlanValues.store_version="";
	    	        flag=true;
	   
	     
	    }
	    else if(!flag){
	    if	(($scope.selectedVer[0]==="R8"&& $scope.selectedVer[1]!=="R10") ||($scope.selectedVer[0]==="R10"&& $scope.selectedVer[1]!=="R8"))
	    	{
	    	    	var value=$scope.selectedVer[0];
	          
	    	 $scope.PlanValues.store_version=value; 
	    		 
	    	  	}
	  	   
	           }
	   
	    	}
	 
	$scope.finalSubmition=function(PlanValues){
			var save = 'yes';
		if($scope.IsVisible) {
			if(!$scope.PlanValues.store_no ||$scope.PlanValues.store_no===""||$scope.PlanValues.store_no==undefined||$scope.PlanValues.store_no==null){
				save = 'no';
				toastr.error('Error', 'Enter Store_No', {
		      		  closeButton: true
		      		});
			}
			
	     if(!$scope.PlanValues.fromtime ||$scope.PlanValues.fromtime===""||$scope.PlanValues.fromtime==undefined||$scope.PlanValues.fromtime==null ){
				save = 'no';
				toastr.error('Error', 'Enter Valid Start Date and Time', {
		      		  closeButton: true
		      		});
			}
	     if(!$scope.PlanValues.totime ||$scope.PlanValues.totime===""||$scope.PlanValues.totime==undefined||$scope.PlanValues.totime==null){
				save = 'no';
				toastr.error('Error', 'Enter valid End Date and Time', {
		      		  closeButton: true
		      		});
			}
	     if($scope.PlanValues.fromtime <= $scope.date){
				save = 'no';
				toastr.error('Error', 'Enter Valid future Start Date and Time', {
		      		  closeButton: true
		      		});
			}
	     if($scope.PlanValues.totime <= $scope.date){
				save = 'no';
				toastr.error('Error', 'Enter Valid future End Date and Time', {
		      		  closeButton: true
		      		});
			}
	     if($scope.PlanValues.totime <= $scope.PlanValues.fromtime ){
				save = 'no';
				toastr.error('Error', 'End Date should be less than Start date', {
		      		  closeButton: true
		      		});
			}
		}
		else if($scope.IsVisible1) {
			if(!$scope.PlanValues.environment ||$scope.PlanValues.environment===""||$scope.PlanValues.environment==undefined||$scope.PlanValues.environment==null){
				save = 'no';
				toastr.error('Error', 'Select the Environment', {
		      		  closeButton: true
		      		});
			}
			
	     if(!$scope.PlanValues.fromtime ||$scope.PlanValues.fromtime===""||$scope.PlanValues.fromtime==undefined||$scope.PlanValues.fromtime==null){
				save = 'no';
				toastr.error('Error', 'Enter Valid Start Date and Time', {
		      		  closeButton: true
		      		});
			}
	     if(!$scope.PlanValues.totime ||$scope.PlanValues.totime===""||$scope.PlanValues.totime==undefined||$scope.PlanValues.totime==null){
				save = 'no';
				toastr.error('Error', 'Enter Valid End Date and Time', {
		      		  closeButton: true
		      		});
			}
	     if($scope.PlanValues.fromtime <= $scope.date){
				save = 'no';
				toastr.error('Error', 'Enter Valid future Start Date and Time', {
		      		  closeButton: true
		      		});
			}
	     if($scope.PlanValues.totime <= $scope.date){
				save = 'no';
				toastr.error('Error', 'Enter Valid future End Date and Time', {
		      		  closeButton: true
		      		});
			}
	     if($scope.PlanValues.totime <= $scope.PlanValues.fromtime ){
				save = 'no';
				toastr.error('Error', 'End Date should be less than Start date', {
		      		  closeButton: true
		      		});
			}
		}
		if(save==='yes'){
		$http({
            method: 'POST',
            url: 'planMaintenance.do',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            data: PlanValues
        }).success(function(){
        	$scope.PlanValues = {};
        	 toastr.success('Success', 'Added successfully', {
	        		  closeButton: true
	        		});
					
       		 })
	        .error(function(){
	        	toastr.error('Error', 'Enter Valid Data', {
	        		  closeButton: true
	        		});
	        });
	}
	}
});
 
  </script>
 
<body>
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
<div id="content" ng-app="planApp" ng-controller="selectCtrl" >
<div class="workArea container-fluid">
<div class="pageName"  style="font-size: 20px;">
	<label> Add/Update Planned Maintenance Details</label>
</div>
<div class="generationArea" id="generationArea" style="margin-top: 2%;" align="center">
<div class="maintenanceTable"  align="center">
<label style="margin-left: 13%; font-size: 16px;" for="q1-a"><input type="radio" name="au" ng-change="toggRadio('single')" ng-model="selectValue"  value="single" />Single store</label>
<label style="margin-right: 12%;margin-left: 5%; font-size: 16px;" for="q1-u"><input type="radio" name="au" ng-change="toggRadio('multiple')"  ng-model="selectValue" value="multiple"/>Multiple stores</label>
</div>
<div id="div1" ng-show="IsVisible"  align="center" >
<table class="table table-bordered table-condensed" align="center" style="margin-left: 13%;">
<tr>
<td style="float: right; font-size: 16px;">Store Number </td>
<td><input type="number" ng-model ="PlanValues.store_no" class="inputField" style="background-color: white;"></td>
</tr>
<tr>
<td style="float: right; font-size: 16px;">Start Date </td>
<td><input type="datetime-local" ng-model="PlanValues.fromtime"></td>
</tr>
<tr>
<td style="float: right; font-size: 16px;">End Date </td>
<td><input type="datetime-local" ng-model="PlanValues.totime"></td>
</tr>
</table></div>

<div id="div2" ng-show="IsVisible1"  align="center" >
<table class="table table-bordered table-condensed" align="center"  style="margin-left: 13%;">
<tr>
<td style="float: right; font-size: 16px;">Environment </td>
<td  align="left">
<select class = "dropbtn"  ng-model = "PlanValues.environment" id="dropbtn">
       		<option value="" disabled selected>  Select environment  </option>
            <option value="UAT">UAT</option>
            <option value="SIT">SIT</option>
</select></td>
</tr>
<tr>
<td style="float: right; font-size: 16px;">Store Version </td>
<td align="left">
<label ng-repeat="ver in versions" style="margin-left: 2%; font-size: 16px;">
      <input class="checkSquare" type="checkbox" checklist-model="selectedVer" checklist-value="ver"  ng-checked="selectedVer.indexOf(ver) > -1" ng-click="toggleSelection(ver)"  > {{ver}}
</label>
</tr>
<tr>
<td style="float: right; font-size: 16px;">Start Date </td>
<td align="left"><input type="datetime-local" ng-model="PlanValues.fromtime"></td>
</tr>
<tr>
<td style="float: right; font-size: 16px;">End Date </td>
<td align="left"><input type="datetime-local" ng-model="PlanValues.totime"></td>
</tr>


</table></div>

<div  class="col-sm-12 col-md-12 col-lg-12"  align="centre">
<button type="button" ng-click="finalSubmition(PlanValues)" class="btn btn-primary submitBtn" style="font-size: 16px; margin-left: 30%;">ADD</button>

<button type="button" class="btn btn-primary cancel" ng-click="Reloaded()" style="font-size: 16px; margin-left: 1%;">CANCEL</button>
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
	</div>
	</div>
	
</body>
</html>