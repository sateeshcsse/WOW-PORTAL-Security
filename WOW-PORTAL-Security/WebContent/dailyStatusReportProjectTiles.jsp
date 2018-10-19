<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Status Report</title> 
 <link rel="shortcut icon" href="<c:url value="/images/logo/favicon.ico"/>" type="image/x-icon" />
<link rel="stylesheet" href="<c:url value="/styles/animations.css"/>">
<link href="<c:url value="/styles/bootstrap.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/styles/skeleton.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/styles/jqueryUI.css"/>" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<c:url value="/styles/Home.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/metisMenu.min.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/sideBar.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/reportArea.css"/>">
<link rel="stylesheet" href="<c:url value="/styles/dataTables.bootstrap.css"/>">
 <link rel="stylesheet" href="<c:url value="/styles/angular-material.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/js/toastr.css"/>">
   <link rel="stylesheet" href="<c:url value="/styles/dailyStatusReportTile.css"/>">
<script src="<c:url value="/js/jquery-1.11.3.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/metisMenu.min.js"/>"></script>
<script src="<c:url value="/js/angular-1.4.7/angular.js"/>" ></script>
<style>
.bottomRow {
		margin-top: -25%;
	}
@media only screen and (max-width:1370px) {.bottomRow {margin-top: -25%;}}
@media only screen and (min-width:1371px) and (max-width:1500px){.bottomRow {margin-top: -23%;}}
@media only screen and (min-width:1501px) and (max-width:1600px){.bottomRow {margin-top: -20%;}}
@media only screen and (min-width:1601px) and (max-width:1700px){.bottomRow {margin-top: -19%;}}
@media only screen and (min-width:1701px) and (max-width:1800px){.bottomRow {margin-top: -19%;}}
@media only screen and (min-width:1801px) and (max-width:1900px){.bottomRow {margin-top: -18%;}}
@media only screen and (min-width:1901px) and (max-width:2000px){.bottomRow {margin-top: -17%;}}

@media only screen and (min-width:2001px) and (max-width:2100px){.bottomRow {margin-top: -16%;}}
@media only screen and (min-width:2101px) and (max-width:2200px){.bottomRow {margin-top: -15%;}}
@media only screen and (min-width:2201px) and (max-width:2300px){.bottomRow {margin-top: -14%;}}
@media only screen and (min-width:2301px) and (max-width:2400px){.bottomRow {margin-top: -13%;}}
@media only screen and (min-width:2401px) and (max-width:2500px){.bottomRow {margin-top: -12%;}}
@media only screen and (min-width:2501px) and (max-width:2700px){.bottomRow {margin-top: -10%;}}

@media only screen and (min-width:2501px) and (max-width:3000px){.bottomRow {margin-top: -11%;}}

@media only screen and (max-width:1370px) {.totalProjDisplayDiv {width : 100%;}}
@media only screen and (min-width:1371px) and (max-width:1625px){.totalProjDisplayDiv {width : 99.5%;}}
@media only screen and (min-width:1626px) and (max-width:1750px){.totalProjDisplayDiv {width : 99%;}}
@media only screen and (min-width:1751px) and (max-width:1825px){.totalProjDisplayDiv {width : 98.5%;}}
@media only screen and (min-width:1826px) and (max-width:2000px){.totalProjDisplayDiv {width : 98%;}}
@media only screen and (min-width:2001px) and (max-width:2125px){.totalProjDisplayDiv {width : 97%;}}
@media only screen and (min-width:2126px) and (max-width:2250px){.totalProjDisplayDiv {width : 96.5%;}}
@media only screen and (min-width:2251px) and (max-width:2375px){.totalProjDisplayDiv {width : 96%;}}
@media only screen and (min-width:2376px) and (max-width:2500px){.totalProjDisplayDiv {width : 95.5%;}}
@media only screen and (min-width:2501px) and (max-width:2625px){.totalProjDisplayDiv {width : 95%;}}
@media only screen and (min-width:2626px) and (max-width:2750px){.totalProjDisplayDiv {width : 94.5%;}}
@media only screen and (min-width:2751px) and (max-width:3000px){.totalProjDisplayDiv {width : 94%;}}

.totProjTextCenter {
	padding: 6%;
}

@media only screen and (min-width:1370px) and (max-width:1600px){.totProjTextCenter {padding : 8%;}}
@media only screen and (min-width:1601px) and (max-width:2300px){.totProjTextCenter {padding : 6%;}}
@media only screen and (min-width:2301px) and (max-width:2800px){.totProjTextCenter {padding : 5%;}}

@media only screen and (min-width:1370px) and (max-width:1500px){#colorPalletDashboardTileRed {border-radius: 50% 0% 50% 50%;
    color: rgb(255,77,77);
    background: white;
    margin-top:4%;
    width: 16%;
    height: 67%;
    margin-right:10%;
    margin-left:6%;
    float:right;
    font-size: large;}}
@media only screen and (min-width:1501px) and (max-width:2000px){#colorPalletDashboardTileRed {border-radius: 50% 0% 50% 50%;
    color: rgb(255,77,77);
    background: white;
    margin-top: 3%;
    width: 16%;
    height: 90%;
    margin-right: 10%;
    margin-left: 6%;
    float: right;
    font-size: large;}}
@media only screen and (min-width:2001px) and (max-width:2500px){#colorPalletDashboardTileRed {border-radius: 50% 0% 50% 50%;
    color: rgb(255,77,77);
    background: white;
    margin-top: 1.5%;
    width: 16%;
    height: 98%;
    margin-right: 10%;
    margin-left: 6%;
    float: right;
    font-size: large;
}}

@media only screen and (min-width:1370px) and (max-width:1500px){#colorPalletDashboardTileGreen {border-radius: 50% 0% 50% 50%;
    color: rgb(0,176,80);
    background: white;
    margin-top:4%;
    width: 16%;
    height: 67%;
    margin-right:10%;
    margin-left:6%;
    float:right;
    font-size: large;}}
@media only screen and (min-width:1501px) and (max-width:2000px){#colorPalletDashboardTileGreen {border-radius: 50% 0% 50% 50%;
    color: rgb(0,176,80);
    background: white;
    margin-top:3%;
    width: 16%;
    height: 90%;
    margin-right:10%;
    margin-left:6%;
    float:right;
    font-size: large;}}
@media only screen and (min-width:2001px) and (max-width:2500px){#colorPalletDashboardTileGreen {border-radius: 50% 0% 50% 50%;
    color: rgb(0,176,80);
    background: white;
    margin-top:1.5%;
    width: 16%;
    height: 98%;
    margin-right:10%;
    margin-left:6%;
    float:right;
    font-size: large;
}}

@media only screen and (min-width:1370px) and (max-width:1500px){#colorPalletDashboardTileAmber {border-radius: 50% 0% 50% 50%;
    color: rgb(255,191,0);
    background: white;
    margin-top:4%;
    width: 16%;
    height: 67%;
    margin-right:10%;
    margin-left:6%;
    float:right;
    font-size: large;}}
@media only screen and (min-width:1501px) and (max-width:2000px){#colorPalletDashboardTileAmber {border-radius: 50% 0% 50% 50%;
    color: rgb(255,191,0);
    background: white;
    margin-top:3%;
    width: 16%;
    height: 90%;
    margin-right:10%;
    margin-left:6%;
    float:right;
    font-size: large;}}
@media only screen and (min-width:2001px) and (max-width:2500px){#colorPalletDashboardTileAmber {border-radius: 50% 0% 50% 50%;
    color: rgb(255,191,0);
    background: white;
    margin-top:1.5%;
    width: 16%;
    height: 98%;
    margin-right:10%;
    margin-left:6%;
    float:right;
    font-size: large;
}}


.rotateVertical{
-webkit-transform: rotate(270deg);   
-moz-transform: rotate(270deg);
-ms-transform: rotate(270deg);
-o-transform: rotate(270deg);
transform: rotate(270deg);

}
#tileGroup {
margin-left : 10%;
margin-right : 20%;
}
p{
font-weight:bold;
}
a> label{
cursor:pointer;
}
#overallTile{
    width: 16%;
    margin-left: 17%;
    
}
</style>
<script>
/* $(document).ready(function(){
$('.openDailyStatusReport').click(function(){
	window.location.href="reports/dailyStatusReportOverall.do";
});
}); */

</script>

<script>

var app=angular.module('tilesModule',[]);
app.controller('tilesController',function($scope,$http){

	 $scope.DIGITAL={};
	 $scope.ENTERPRISEAPPLICATION={};
	 $scope.GFS={};
	 $scope.MARKETPLACE={};
	 $scope.MASTERS={};
	 $scope.SAP={};
	 $scope.Stores={};
	 $scope.SupplyChain={};
	 $scope.RUNIT={};
	$scope.dailyStatusWithParams=function($event){
		var elem=$event.currentTarget.parentElement.parentElement;
		var port=elem.innerText.split("\n");
		console.log(port[0]);
		if(port[0]==='Service' || port[0] ==='Service Delivery Applications') port[0]='ALL';
		if($event.currentTarget.id.indexOf('Red')>0){
			window.location.href='dailyStatusReportOverall.do?portfolio='+port[0]+'&status=red';
		//console.log(temp);
		}
		if($event.currentTarget.id.indexOf('Green')>0){
			window.location.href='dailyStatusReportOverall.do?portfolio='+port[0]+'&status=green';
		}
		if($event.currentTarget.id.indexOf('Amber')>0){
			window.location.href='dailyStatusReportOverall.do?portfolio='+port[0]+'&status=amber';
	
        }
	};
	$scope.init=function(){
		$http({
			method: 'GET',
            url: 'getTilesDataForPrjectReport.do',
		}).then(function(response){
			 $scope.DIGITAL=0;
			 $scope.ENTERPRISEAPPLICATION=0;
			 $scope.GFS=0;
			 $scope.MARKETPLACE=0;
			 $scope.MASTERS=0;
			 $scope.SAP=0;
			 $scope.Stores=0;
			 $scope.SupplyChain=0;
			 $scope.RUNIT=0;
			 var size =5;
			 var jsonObj = [];
			 for (var i=0; i<response.data.length; i+=size) {
				 var rowItem = {};
				    var smallarray = response.data.slice(i,i+size);
				    rowItem["portfolio"] = smallarray[0];
				    rowItem["totalProj"] = smallarray[1];
				    rowItem["amber"] = smallarray[2];
				    rowItem["red"] = smallarray[3];
				    rowItem["green"] = smallarray[4];
				  
				  
				    
				    jsonObj.push(rowItem);
			 }
			 for(var z=0;z<jsonObj.length;z++){
				
				 console.log(jsonObj[z].portfolio);
				if(jsonObj[z].portfolio==='DIGITAL'){
					console.log('inside digital');
					 $scope.DIGITAL=jsonObj[z];
				}
				else if(jsonObj[z].portfolio==='MASTERS'){
					console.log('inside MASTERS');
					 $scope.MASTERS=jsonObj[z];
				}
				else if(jsonObj[z].portfolio==='ENTERPRISE APPLICATION'){
					console.log('inside ENTERPRISE APPLICATION');
					 $scope.ENTERPRISEAPPLICATION=jsonObj[z];
								}
				else if(jsonObj[z].portfolio==='GFS'){
					console.log('inside GFS APPLICATION');
					$scope.GFS=jsonObj[z];
				}
				else if(jsonObj[z].portfolio==='MARKET PLACE'){
					console.log('inside MARKET PLACE');
					$scope.MARKETPLACE=jsonObj[z];
				}
				else if(jsonObj[z].portfolio==='SAP'){
					console.log('inside sap');
					$scope.SAP=jsonObj[z];
				}
				else if(jsonObj[z].portfolio==='STORES'){
					 $scope.Stores=jsonObj[z];
				}
				else if(jsonObj[z].portfolio==='SECURITY'){
					 $scope.SECURITY=jsonObj[z];
				}
				else if(jsonObj[z].portfolio==='SUPPLY CHAIN'){
					 $scope.SupplyChain=jsonObj[z];
				}
				else if(jsonObj[z].portfolio==='RUN IT') {
					 $scope.RUNIT=jsonObj[z];
				}
				else if(jsonObj[z].portfolio==='All'){
					 $scope.All=jsonObj[z];
				}
				
				/*  console.log(portfolios[z]);
				 $scope.DIGITAL=jsonObj[0];
				 $scope.ENTERPRISEAPPLICATION=jsonObj[1];
				 $scope.GFS=jsonObj[2];
				 $scope.MARKETPLACE=jsonObj[3];
				 $scope.MASTERS=jsonObj[4];
				 $scope.SAP=jsonObj[5];
				 $scope.Stores=jsonObj[6];
				 $scope.SupplyChain=jsonObj[7]; */
			
			 }
			console.log(jsonObj);
		});
		
		
	};
	
	
});



</script>
</head>
<body ng-app="tilesModule">
<div  class="container-fluid">
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
	<form name="DailyStatusReport" id="DailyStatusReport" method="post" ng-controller="tilesController" ng-init="init()">
	<div class="workArea container-fluid">
	<div style="margin-bottom:50px;">
	</div>
	<div id="tileGroup" style="width: 75%;">
		<div class="row" style="margin-left: 7%;">
    <div class="col-md-2" style="padding-left: 0%; padding-right: 1%;">
       <div class="thumbnail tile tile-mediumOverall tile-teal" style="width: 144%; margin-left: -31%;">
	<div class="totalProjDisplayDiv" style="height:90%; display: flex; align-items: center; justify-content: center;    background-color: #91dbf9;">
	<a href="dailyStatusReportOverall.do" >
			<label style="font-size : x-large ! important; font-weight: bolder; color: #0875a0"><strong style="font-size: 142%;">Service Delivery Applications</strong></label>
			
			</a>
	</div>
	<div class="totalProjDisplayDiv" style="height:11%; background-color:#68cff8; padding-bottom: 3%;">
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileRed">{{All.red || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileAmber">{{All.amber || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileGreen">{{All.green || 0}}</p>
	</div>
	<div class="totalProjDisplayDiv" style="height:14%; background-color:#37c0f6;">
	<p class="totProjTextCenter" style="padding: 6%; font-size: large;"> Total Projects : {{All.totalProj || 0}}</p>
	</div>
     </div>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
    </div>
    <div class="col-md-10">
        <div class="row">
            <div class="col-md-3">
                <div class="thumbnail tile tile-medium tile-teal">
	<div style="height:70%; display: flex; align-items: center; justify-content: center">
	<a href="dailyStatusReportOverall.do?portfolio=ENTERPRISE APPLICATION" >
			<label style="font-size : x-large ! important; font-weight: bolder; color:#54842E"><strong> ENTERPRISE APPLICATION </strong></label>
			</a>
	</div>
	<div class="totalProjDisplayDiv" style="height:20%; background-color:#94CB67; padding-bottom: 3%;">
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileRed">{{ENTERPRISEAPPLICATION.red || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileAmber">{{ENTERPRISEAPPLICATION.amber || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileGreen">{{ENTERPRISEAPPLICATION.green || 0}}</p>
	</div>
	<div class="totalProjDisplayDiv" style="height:18%; background-color:#78BD41;">
	<p style="padding: 3%; font-size: large;"> Total Projects : {{ENTERPRISEAPPLICATION.totalProj || 0}}</p>
	</div>
		
		</div>
            </div>
            <div class="col-md-3">
                <div class="thumbnail tile tile-medium tile-teal">
		<div style="height:70%; display: flex; align-items: center; justify-content: center">
	<a href="dailyStatusReportOverall.do?portfolio=GFS" >
			<label style="font-size : x-large ! important; font-weight: bolder; color:#ff8a81"><strong>GFS</strong></label>
			</a>
	</div>
	<div class="totalProjDisplayDiv" style="height:20%; background-color:#ff7268; padding-bottom: 3%;">
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileRed">{{GFS.red || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileAmber">{{GFS.amber || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileGreen">{{GFS.green || 0}}</p>
	</div>
			<div class="totalProjDisplayDiv" style="height:18%; background-color:#ff5b4e;">
	<p style="padding: 3%; font-size: large;"> Total Projects : {{GFS.totalProj || 0}} </p>
	</div>
		
		</div>
            </div>
            <div class="col-md-3">
                <div class="thumbnail tile tile-medium tile-teal">
		<div style="height:70%; display: flex; align-items: center; justify-content: center">
	<a href="dailyStatusReportOverall.do?portfolio=RUN IT" >
			<label style="font-size : x-large ! important; font-weight: bolder; color:#0875a0"><strong>RUN IT</strong></label>
			</a>
	</div>
	<div class="totalProjDisplayDiv" style="height:20%; background-color:#91dbf9; padding-bottom: 3%;">
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileRed">{{RUNIT.red || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileAmber">{{RUNIT.amber || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileGreen">{{RUNIT.green || 0}}</p>
	</div>
			<div class="totalProjDisplayDiv" style="height:18%; background-color:#68cff8;">
	<p style="padding: 3%; font-size: large;"> Total Projects : {{RUNIT.totalProj || 0}} </p>
	</div>
		
		</div>
            </div>
             <div class="col-md-3">
                <div class="thumbnail tile tile-medium tile-teal">
		<div style="height:70%; display: flex; align-items: center; justify-content: center">
	<a href="dailyStatusReportOverall.do?portfolio=DIGITAL" >
			<label style="font-size : x-large ! important; font-weight: bolder; color:#e1b308;"><strong>DIGITAL</strong></label>
			</a>
	</div>
	<div style="height:20%; background-color:#f7ca25; padding-bottom: 3%;">
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileRed">{{DIGITAL.red || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileAmber">{{DIGITAL.amber || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileGreen">{{DIGITAL.green || 0}}</p>
	
	</div>
	<div style="height:18%; background-color:#f6c40d;">
	<p style="padding: 3%; font-size: large;"> Total Projects : {{DIGITAL.totalProj || 0}} </p>
	</div>
		
		</div>
            </div>
           
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="thumbnail tile tile-medium tile-teal">
		<div style="height:70%; display: flex; align-items: center; justify-content: center">
	<a href="dailyStatusReportOverall.do?portfolio=SUPPLY CHAIN" >
			<label style="font-size : x-large ! important; font-weight: bolder; color:#e1b308"><strong>SUPPLY CHAIN</strong></label>
			</a>
	</div>
	<div class="totalProjDisplayDiv" style="height:20%; background-color:#f7ca25; padding-bottom: 3%;">
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileRed">{{SupplyChain.red || 0}} </p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileAmber">{{SupplyChain.amber || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileGreen">{{SupplyChain.green || 0}}</p>
	</div>
	<div class="totalProjDisplayDiv" style="height:18%; background-color:#f6c40d;">
	<p style="padding: 3%; font-size: large;"> Total Projects : {{SupplyChain.totalProj || 0}} </p>
	</div>
		
		</div>
            </div>
            <div class="col-md-3">
                <div class="thumbnail tile tile-medium tile-teal">
		<div style="height:70%; display: flex; align-items: center; justify-content: center">
	<a href="dailyStatusReportOverall.do?portfolio=STORES" >
			<label style="font-size : x-large ! important; font-weight: bolder; color:#0875a0;"><strong>STORES</strong></label>
			</a>
	</div>
	<div class="totalProjDisplayDiv" style="height:20%; background-color:#91dbf9; padding-bottom: 3%;">
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileRed" ng-model="MASTERS"> {{Stores.red || 0 }}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileAmber" ng-model="MASTERS"> {{Stores.amber || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileGreen" ng-model="MASTERS"> {{Stores.green || 0}}</p>
	</div>
	<div class="totalProjDisplayDiv" style="height:18%; background-color:#68cff8;">
	<p ng-model="MASTERS" style="padding: 3%; font-size: large;"> Total Projects : {{Stores.totalProj || 0}}</p>
	</div>
		
		</div>
            </div>
            <div class="col-md-3">
                <div class="thumbnail tile tile-medium tile-teal">
		<div style="height:70%; display: flex; align-items: center; justify-content: center">
	<a href="dailyStatusReportOverall.do?portfolio=SAP" >
			<label style="font-size : x-large ! important; font-weight: bolder; color:#ff8a81"><strong>SAP</strong></label>
			</a>
	</div>
	<div class="totalProjDisplayDiv" style="height:20%; background-color:#ff7268; padding-bottom: 3%;">
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileRed" ng-model="SAP"> {{SAP.red || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileAmber" ng-model="SAP">{{SAP.amber || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileGreen" ng-model="SAP">{{SAP.green || 0}}</p>
	</div>
	<div class="totalProjDisplayDiv" style="height:18%; background-color:#ff5b4e;">
	<p ng-model="SAP" style="padding: 3%; font-size: large;"> Total Projects : {{SAP.totalProj || 0}} </p>
	</div>
		
		</div>
            </div>
            <div class="col-md-3">
                <div class="thumbnail tile tile-medium tile-teal">
		<div style="height:70%; display: flex; align-items: center; justify-content: center">
	<a href="dailyStatusReportOverall.do?portfolio=SECURITY" >
			<label style="font-size : x-large ! important; font-weight: bolder; color:#54842E;"><strong>SECURITY</strong></label>
			</a>
	</div>
	<div class="totalProjDisplayDiv" style="height:20%; background-color:#94CB67; padding-bottom: 3%;">
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileRed" ng-model="SECURITY"> {{SECURITY.red || 0 }}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileAmber" ng-model="SECURITY"> {{SECURITY.amber || 0}}</p>
	<p ng-click="dailyStatusWithParams($event)" id="colorPalletDashboardTileGreen" ng-model="SECURITY"> {{SECURITY.green || 0}}</p>
	</div>
	<div class="totalProjDisplayDiv" style="height:18%; background-color:#78BD41;">
	<p ng-model="SECURITY" style="padding: 3%; font-size: large;"> Total Projects : {{SECURITY.totalProj || 0}}</p>
	</div>
		
		</div>
            </div>
        </div>
    </div>
</div>
	</div>	
		</div>
	
	</form>
	</div>

	<section class="footerSection" id="footer">
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
	</section>
</div>
</body>
<script src='js/css3-animate-it.js'></script>
</html>
