<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Store Details </title> 
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

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/chart.js" type="text/javascript"> </script>
<script src="js/angularChart.js" type="text/javascript"> </script>
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
	$scope.init=function(){
		var params = window.location.href;
		var tmp = params.split("?")[1].split("&");
		$scope.environment = tmp[0];
		$scope.wmtype = tmp[1];
		$scope.division = tmp[2];
		$scope.storeNo = tmp[3];
		$http({
			url:'getISStatusByStore.do?environment='+$scope.environment+'&store='+$scope.storeNo,
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
		}).then(function(results){
			$scope.ISStatus = results.data[0][1];
			if(results.data[0][1] == "FINE")
				$scope.ISStatusColor = 	"#3f9f3f";
			else if(results.data[0][1] == "ERROR")
				$scope.ISStatusColor = 	"#FF4D4D";
			else
				$scope.ISStatusColor = 	"white";
			$("#ISStatusColorID").css("background-color",$scope.ISStatusColor);
			$("#ISStatusColorID").css("color","white");
			$("#ISStatusColorID1").css("background-color",$scope.ISStatusColor);
			$("#ISStatusColorID1").css("color","white");
		});
		$http({
			url:'getOverallStoreStatus.do?&store='+$scope.storeNo,
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
		}).then(function(results){
			
			$scope.StoreStatus = results.data[0][1];
			
			if(results.data[0][1] == "Available")
			{				
			$scope.StoreStatusColor = 	"#3f9f3f";			
			}
			else if(results.data[0][1] == "Partially Available")
			{				
			$scope.StoreStatusColor = 	"##FFA829";			
			}
			else if(results.data[0][1] == "Not Available")
			{
			$scope.StoreStatusColor = 	"#FF4D4D";
			}
			else if(results.data[0][1] == "Planned maintenance")
			{
			$scope.StoreStatusColor = 	"#C0C5CA";
			}
			else
			{
				$scope.StoreStatus = "ERROR"
				$scope.StoreStatusColor = 	"#FF4D4D";
			}
		
			$("#StoreStatusColorID").css("color","white");	
			$("#StoreStatusColorID").css("background-color",$scope.StoreStatusColor);
			
		});
		if($scope.wmtype=="R8") {
			$("#R8Div").css("display","block");
			$("#R10Div").css("display","none");
			$http({
			url:'getInMsgDetailByDiv.do?environment='+$scope.environment+'&wmType='+$scope.wmtype+'&division='+$scope.division,
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
		}).then(function(results){
			var inboundmsgs = [];
			inboundmsgs = results.data;
			for(var i=0; i<inboundmsgs.length; i++) {
				if(inboundmsgs[i][1] === "FINE")
					color1 = "#3f9f3f";
				else if(inboundmsgs[i][1] === "ERROR")
					color1 = "#FF4D4D";
				else
					color1 = "white";
				
				if(inboundmsgs[i][2] === "FINE")
					color2 = "#3f9f3f";
				else if(inboundmsgs[i][2] === "ERROR")
					color2 = "#FF4D4D";
				else
					color2 = "white";
				
				if(inboundmsgs[i][3] < 85 )
					color3 = "#3f9f3f";
				else
					color3 = "#FF4D4D";
				
				if(inboundmsgs[i][4] === "FINE")
					color4 = "#3f9f3f";
				else if(inboundmsgs[i][4] === "ERROR")
					color4 = "#FF4D4D";
				else
					color4 = "white";
				
				if(inboundmsgs[i][5] < 85)
					color5 = "#3f9f3f";
				else
					color5 = "#FF4D4D";
				
				if(inboundmsgs[i][6] === "FINE")
					color6 = "#3f9f3f";
				else if(inboundmsgs[i][6] === "ERROR")
					color6 = "#FF4D4D";
				else
					color6 = "white";
				if(i==0)
					$("#inboundMessagesTable > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+inboundmsgs[i][0]+"</th><th>"+inboundmsgs[i][1]+"</th><th>"+inboundmsgs[i][2]+"</th><th>"+inboundmsgs[i][3]+"</th><th>"+inboundmsgs[i][4]+"</th><th>"+inboundmsgs[i][5]+"</th><th>"+inboundmsgs[i][6]+"</th><th>"+inboundmsgs[i][7]+"</th></tr>");
				else
					$("#inboundMessagesTable > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+inboundmsgs[i][0]+"</td><td style='background-color: "+color1+";'>"+inboundmsgs[i][1]+"</td><td style='background-color: "+color2+";'>"+inboundmsgs[i][2]+"</td><td style='background-color: "+color3+";'>"+inboundmsgs[i][3]+"</td><td  style='background-color: "+color4+";'>"+inboundmsgs[i][4]+"</td><td style='background-color: "+color5+";'>"+inboundmsgs[i][5]+"</td><td style='background-color: "+color6+";'>"+inboundmsgs[i][6]+"</td><td  style='background-color: white;'>"+inboundmsgs[i][7]+"</td></tr>");
			}
		});
		$http({
			url:'getOutMsgDetailByDiv.do?environment='+$scope.environment+'&wmType='+$scope.wmtype+'&division='+$scope.division,
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
			var outboundmsgs = [];
			outboundmsgs = results.data;
			for(var i=0; i<outboundmsgs.length; i++) {
				if(outboundmsgs[i][1] === "FINE")
					color1 = "#3f9f3f";
				else if(outboundmsgs[i][1] === "ERROR")
					color1 = "#FF4D4D";
				else
					color1 = "white";
				
				if(outboundmsgs[i][2] === "FINE")
					color2 = "#3f9f3f";
				else if(outboundmsgs[i][2] === "ERROR")
					color2 = "#FF4D4D";
				else
					color2 = "white";
				
				if(outboundmsgs[i][3] < 85)
					color3 = "#3f9f3f";
				else
					color3 = "#FF4D4D";
				
				if(outboundmsgs[i][4] < 85)
					color4 = "#3f9f3f";
				else
					color4 = "#FF4D4D";
				
				if(outboundmsgs[i][5] === "FINE")
					color5 = "#3f9f3f";
				else if(outboundmsgs[i][5] === "ERROR")
					color5 = "#FF4D4D";
				else
					color5 = "white";
				
				if(outboundmsgs[i][6] === "FINE")
					color6 = "#3f9f3f";
				else if(outboundmsgs[i][6] === "ERROR")
					color6 = "#FF4D4D";
				else
					color6 = "white";

				if(i==0)
					$("#outboundMessagesTable > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+outboundmsgs[i][0]+"</th><th>"+outboundmsgs[i][1]+"</th><th>"+outboundmsgs[i][2]+"</th><th>"+outboundmsgs[i][3]+"</th><th>"+outboundmsgs[i][4]+"</th><th>"+outboundmsgs[i][5]+"</th><th>"+outboundmsgs[i][6]+"</th><th>"+outboundmsgs[i][7]+"</th></tr>");
				else
					$("#outboundMessagesTable > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+outboundmsgs[i][0]+"</td><td style='background-color: "+color1+";'>"+outboundmsgs[i][1]+"</td><td style='background-color: "+color2+";'>"+outboundmsgs[i][2]+"</td><td style='background-color: "+color3+";'>"+outboundmsgs[i][3]+"</td><td style='background-color: "+color4+";'>"+outboundmsgs[i][4]+"</td><td style='background-color: "+color5+";'>"+outboundmsgs[i][5]+"</td><td style='background-color: "+color6+";'>"+outboundmsgs[i][6]+"</td><td style='background-color: white;'>"+outboundmsgs[i][7]+"</td></tr>");
			}
		});
		$http({
			url:'getInFileDetailByDiv.do?environment='+$scope.environment+'&wmType='+$scope.wmtype+'&division='+$scope.division,
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
			var inboundfiles = [];
			inboundfiles = results.data;
			for(var i=0; i<inboundfiles.length; i++) {
				if(inboundfiles[i][1] === "FINE")
					color1 = "#3f9f3f";
				else if(inboundfiles[i][1] === "ERROR")
					color1 = "#FF4D4D";
				else
					color1 = "white";
				
				if(inboundfiles[i][2] === "FINE")
					color2 = "#3f9f3f";
				else if(inboundfiles[i][2] === "ERROR")
					color2 = "#FF4D4D";
				else
					color2 = "white";
				
				if(inboundfiles[i][3] === "FINE")
					color3 = "#3f9f3f";
				else if(inboundfiles[i][3] === "ERROR")
					color3 = "#FF4D4D";
				else
					color3 = "white";
				
				if(inboundfiles[i][4] === "FINE")
					color4 = "#3f9f3f";
				else if(inboundfiles[i][4] === "ERROR")
					color4 = "#FF4D4D";
				else
					color4 = "white";
				
				if(inboundfiles[i][5] < 85)
					color5 = "#3f9f3f";
				else
					color5 = "#FF4D4D";
				
				if(inboundfiles[i][6] === "FINE")
					color6 = "#3f9f3f";
				else if(inboundfiles[i][6] === "ERROR")
					color6 = "#FF4D4D";
				else
					color6 = "white";
				
				if(inboundfiles[i][7] === "FINE")
					color7 = "#3f9f3f";
				else if(inboundfiles[i][7] === "ERROR")
					color7 = "#FF4D4D";
				else
					color7 = "white";
				
				if(inboundfiles[i][8] === "FINE")
					color8 = "#3f9f3f";
				else if(inboundfiles[i][8] === "ERROR")
					color8 = "#FF4D4D";
				else
					color8 = "white";
				if(i==0)
					$("#inboundFilesTable > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+inboundfiles[i][0]+"</th><th>"+inboundfiles[i][1]+"</th><th>"+inboundfiles[i][2]+"</th><th>"+inboundfiles[i][3]+"</th><th>"+inboundfiles[i][4]+"</th><th>"+inboundfiles[i][5]+"</th><th>"+inboundfiles[i][6]+"</th><th>"+inboundfiles[i][7]+"</th><th>"+inboundfiles[i][8]+"</th><th>"+inboundfiles[i][9]+"</th></tr>");
				else
					$("#inboundFilesTable > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+inboundfiles[i][0]+"</td><td style='background-color: "+color1+";'>"+inboundfiles[i][1]+"</td><td style='background-color: "+color2+";'>"+inboundfiles[i][2]+"</td><td style='background-color: "+color3+";'>"+inboundfiles[i][3]+"</td><td style='background-color: "+color4+";'>"+inboundfiles[i][4]+"</td><td style='background-color: "+color5+";'>"+inboundfiles[i][5]+"</td><td style='background-color: "+color6+";'>"+inboundfiles[i][6]+"</td><td style='background-color: "+color7+";'>"+inboundfiles[i][7]+"</td><td style='background-color: "+color8+";'>"+inboundfiles[i][8]+"</td><td style='background-color: white;'>"+inboundfiles[i][9]+"</td></tr>");
			}
		});
		$http({
			url:'getOutFileDetailByDiv.do?environment='+$scope.environment+'&wmType='+$scope.wmtype+'&division='+$scope.division,
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results) {
			var outboundfiles = [];
			outboundfiles = results.data;
			for(var i=0; i<outboundfiles.length; i++) {
				if(outboundfiles[i][1] === "FINE")
					color1 = "#3f9f3f";
				else if(outboundfiles[i][1] === "ERROR")
					color1 = "#FF4D4D";
				else
					color1 = "white";
				
				if(outboundfiles[i][2] === "FINE")
					color2 = "#3f9f3f";
				else if(outboundfiles[i][2] === "ERROR")
					color2 = "#FF4D4D";
				else
					color2 = "white";
				
				if(outboundfiles[i][3] < 85)
					color3 = "#3f9f3f";
				else
					color3 = "#FF4D4D";
				
				if(outboundfiles[i][4] === "FINE")
					color4 = "#3f9f3f";
				else if(outboundfiles[i][4] === "ERROR")
					color4 = "#FF4D4D";
				else
					color4 = "white";
				
				if(outboundfiles[i][5] === "FINE")
					color5 = "#3f9f3f";
				else if(outboundfiles[i][5] === "ERROR")
					color5 = "#FF4D4D";
				else
					color5 = "white";
				
				if(outboundfiles[i][6] < 85)
					color6 = "#3f9f3f";
				else
					color6 = "#FF4D4D";
				
				if(i==0)
					$("#outboundFilesTable > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+outboundfiles[i][0]+"</th><th>"+outboundfiles[i][1]+"</th><th>"+outboundfiles[i][2]+"</th><th>"+outboundfiles[i][3]+"</th><th>"+outboundfiles[i][4]+"</th><th>"+outboundfiles[i][5]+"</th><th>"+outboundfiles[i][6]+"</th><th>"+outboundfiles[i][7]+"</th></tr>");
				else
					$("#outboundFilesTable > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+outboundfiles[i][0]+"</td><td style='background-color: "+color1+";'>"+outboundfiles[i][1]+"</td><td style='background-color: "+color2+";'>"+outboundfiles[i][2]+"</td><td style='background-color: "+color3+";'>"+outboundfiles[i][3]+"</td><td style='background-color: "+color4+";'>"+outboundfiles[i][4]+"</td><td style='background-color: "+color5+";'>"+outboundfiles[i][5]+"</td><td style='background-color: "+color6+";'>"+outboundfiles[i][6]+"</td><td style='background-color: white;'>"+outboundfiles[i][7]+"</td></tr>");
			}
		});
		}
	if($scope.wmtype=="R10") {
		$("#R10Div").css("display","block");
		$("#R8Div").css("display","none");
		$http({
			url:'getInMsgDetailByDiv.do?environment='+$scope.environment+'&wmType='+$scope.wmtype+'&division='+$scope.division,
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results) {
			var inboundmsgs = [];
			inboundmsgs = results.data;
			for(var i=0; i<inboundmsgs.length; i++) {
				if(inboundmsgs[i][1] === "FINE")
					color1 = "#3f9f3f";
				else if(inboundmsgs[i][1] === "ERROR")
					color1 = "#FF4D4D";
				else
					color1 = "white";
				
				if(inboundmsgs[i][2] === "FINE")
					color2 = "#3f9f3f";
				else if(inboundmsgs[i][2] === "ERROR")
					color2 = "#FF4D4D";
				else
					color2 = "white";
				
				if(inboundmsgs[i][3] < 85)
					color3 = "#3f9f3f"; // green
				else
					color3 = "#FF4D4D"; // red
				
				if(inboundmsgs[i][4] === "FINE")
					color4 = "#3f9f3f";
				else if(inboundmsgs[i][4] === "ERROR")
					color4 = "#FF4D4D";
				else
					color4 = "white";
				
				if(inboundmsgs[i][5] < 85)
					color5 = "#3f9f3f"; // green
				else
					color5 = "#FF4D4D"; // red
				
				if(inboundmsgs[i][6] === "FINE")
					color6 = "#3f9f3f";
				else if(inboundmsgs[i][6] === "ERROR")
					color6 = "#FF4D4D";
				else
					color6 = "white";
				
				if(inboundmsgs[i][7] === "FINE")
					color7 = "#3f9f3f";
				else if(inboundmsgs[i][7] === "ERROR")
					color7 = "#FF4D4D";
				else
					color7 = "white";
				
				if(inboundmsgs[i][8] === "FINE")
					color8 = "#3f9f3f";
				else if(inboundmsgs[i][8] === "ERROR")
					color8 = "#FF4D4D";
				else
					color8 = "white";
				
				if(inboundmsgs[i][9] === "FINE")
					color9 = "#3f9f3f";
				else if(inboundmsgs[i][9] === "ERROR")
					color9 = "#FF4D4D";
				else
					color9 = "white";

				if($scope.environment == "UAT") {
					if(i==0)
						$("#inboundMessagesR10Table > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+inboundmsgs[i][0]+"</th><th>"+inboundmsgs[i][1]+"</th><th>"+inboundmsgs[i][2]+"</th><th>"+inboundmsgs[i][3]+"</th><th>"+inboundmsgs[i][4]+"</th><th>"+inboundmsgs[i][5]+"</th><th>"+inboundmsgs[i][6]+"</th><th>"+inboundmsgs[i][7]+"</th><th>"+inboundmsgs[i][8]+"</th><th>"+inboundmsgs[i][9]+"</th><th>"+inboundmsgs[i][10]+"</th></tr>");
					else
						$("#inboundMessagesR10Table > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+inboundmsgs[i][0]+"</td><td style='background-color: "+color1+";'>"+inboundmsgs[i][1]+"</td><td style='background-color: "+color2+";'>"+inboundmsgs[i][2]+"</td><td style='background-color: "+color3+";'>"+inboundmsgs[i][3]+"</td><td style='background-color: "+color4+";'>"+inboundmsgs[i][4]+"</td><td style='background-color: "+color5+";'>"+inboundmsgs[i][5]+"</td><td style='background-color: "+color6+";'>"+inboundmsgs[i][6]+"</td><td style='background-color: "+color7+";'>"+inboundmsgs[i][7]+"</td><td style='background-color: "+color8+";'>"+inboundmsgs[i][8]+"</td><td style='background-color: "+color9+";'>"+inboundmsgs[i][9]+"</td><td>"+inboundmsgs[i][10]+"</td></tr>");
				} else if($scope.environment == "SIT") {
					if(i==0)
						$("#inboundMessagesR10Table > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+inboundmsgs[i][0]+"</th><th>"+inboundmsgs[i][1]+"</th><th>"+inboundmsgs[i][2]+"</th><th>"+inboundmsgs[i][3]+"</th><th>"+inboundmsgs[i][4]+"</th><th>"+inboundmsgs[i][5]+"</th><th>"+inboundmsgs[i][6]+"</th><th>"+inboundmsgs[i][7]+"</th><th>"+inboundmsgs[i][8]+"</th></tr>");
					else
						$("#inboundMessagesR10Table > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+inboundmsgs[i][0]+"</td><td style='background-color: "+color1+";'>"+inboundmsgs[i][1]+"</td><td style='background-color: "+color2+";'>"+inboundmsgs[i][2]+"</td><td style='background-color: "+color3+";'>"+inboundmsgs[i][3]+"</td><td style='background-color: "+color4+";'>"+inboundmsgs[i][4]+"</td><td style='background-color: "+color5+";'>"+inboundmsgs[i][5]+"</td><td style='background-color: "+color6+";'>"+inboundmsgs[i][6]+"</td><td style='background-color: "+color7+";'>"+inboundmsgs[i][7]+"</td><td>"+inboundmsgs[i][8]+"</td></tr>");
				}
				
			}
		});
		$http({
			url:'getOutMsgDetailByDiv.do?environment='+$scope.environment+'&wmType='+$scope.wmtype+'&division='+$scope.division,
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results) {
			var outboundmsgs = [];
			outboundmsgs = results.data;
			for(var i=0; i<outboundmsgs.length; i++) {
				if(outboundmsgs[i][1] === "FINE")
					color1 = "#3f9f3f";
				else if(outboundmsgs[i][1] === "ERROR")
					color1 = "#FF4D4D";
				else
					color1 = "white";
				
				if(outboundmsgs[i][2] === "FINE")
					color2 = "#3f9f3f";
				else if(outboundmsgs[i][2] === "ERROR")
					color2 = "#FF4D4D";
				else
					color2 = "white";
				
				if(outboundmsgs[i][3] < 85)
					color3 = "#3f9f3f"; // green
				else
					color3 = "#FF4D4D"; // red
				
				if(outboundmsgs[i][4] < 85)
					color4 = "#3f9f3f"; // green
				else
					color4 = "#FF4D4D"; // red
				
				if(outboundmsgs[i][5] === "FINE")
					color5 = "#3f9f3f";
				else if(outboundmsgs[i][5] === "ERROR")
					color5 = "#FF4D4D";
				else
					color5 = "white";
				
				if(outboundmsgs[i][6] === "FINE")
					color6 = "#3f9f3f";
				else if(outboundmsgs[i][6] === "ERROR")
					color6 = "#FF4D4D";
				else
					color6 = "white";
				
				if(outboundmsgs[i][7] === "FINE")
					color7 = "#3f9f3f";
				else if(outboundmsgs[i][7] === "ERROR")
					color7 = "#FF4D4D";
				else
					color7 = "white";
				
				if(outboundmsgs[i][8] === "FINE")
					color8 = "#3f9f3f";
				else if(outboundmsgs[i][8] === "ERROR")
					color8 = "#FF4D4D";
				else
					color8 = "white";
				
				if(outboundmsgs[i][9] === "FINE")
					color9 = "#3f9f3f";
				else if(outboundmsgs[i][9] === "ERROR")
					color9 = "#FF4D4D";
				else
					color9 = "white";

				if($scope.environment == "UAT") {
					if(i==0)
					$("#outboundMessagesR10Table > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+outboundmsgs[i][0]+"</th><th>"+outboundmsgs[i][1]+"</th><th>"+outboundmsgs[i][2]+"</th><th>"+outboundmsgs[i][3]+"</th><th>"+outboundmsgs[i][4]+"</th><th>"+outboundmsgs[i][5]+"</th><th>"+outboundmsgs[i][6]+"</th><th>"+outboundmsgs[i][7]+"</th><th>"+outboundmsgs[i][8]+"</th><th>"+outboundmsgs[i][9]+"</th><th>"+outboundmsgs[i][10]+"</th></tr>");
				else
					$("#outboundMessagesR10Table > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+outboundmsgs[i][0]+"</td><td style='background-color: "+color1+";'>"+outboundmsgs[i][1]+"</td><td style='background-color: "+color2+";'>"+outboundmsgs[i][2]+"</td><td style='background-color: "+color3+";'>"+outboundmsgs[i][3]+"</td><td style='background-color: "+color4+";'>"+outboundmsgs[i][4]+"</td><td style='background-color: "+color5+";'>"+outboundmsgs[i][5]+"</td><td style='background-color: "+color6+";'>"+outboundmsgs[i][6]+"</td><td style='background-color: "+color7+";'>"+outboundmsgs[i][7]+"</td><td style='background-color: "+color8+";'>"+outboundmsgs[i][8]+"</td><td style='background-color: "+color9+";'>"+outboundmsgs[i][9]+"</td><td>"+outboundmsgs[i][10]+"</td></tr>");
				} else if($scope.environment == "SIT") {
					if(i==0)
					$("#outboundMessagesR10Table > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+outboundmsgs[i][0]+"</th><th>"+outboundmsgs[i][1]+"</th><th>"+outboundmsgs[i][2]+"</th><th>"+outboundmsgs[i][3]+"</th><th>"+outboundmsgs[i][4]+"</th><th>"+outboundmsgs[i][5]+"</th><th>"+outboundmsgs[i][6]+"</th><th>"+outboundmsgs[i][7]+"</th><th>"+outboundmsgs[i][8]+"</th></tr>");
				else
					$("#outboundMessagesR10Table > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+outboundmsgs[i][0]+"</td><td style='background-color: "+color1+";'>"+outboundmsgs[i][1]+"</td><td style='background-color: "+color2+";'>"+outboundmsgs[i][2]+"</td><td style='background-color: "+color3+";'>"+outboundmsgs[i][3]+"</td><td style='background-color: "+color4+";'>"+outboundmsgs[i][4]+"</td><td style='background-color: "+color5+";'>"+outboundmsgs[i][5]+"</td><td style='background-color: "+color6+";'>"+outboundmsgs[i][6]+"</td><td style='background-color: "+color7+";'>"+outboundmsgs[i][7]+"</td><td>"+outboundmsgs[i][8]+"</td></tr>");
				}
				
				
			}
		});
		$http({
			url:'getInMasterDetailByDiv.do?environment='+$scope.environment+'&wmType='+$scope.wmtype+'&division='+$scope.division,
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results) {
			var inboundMasterDetail = [];
			inboundMasterDetail = results.data;
			for(var i=0; i<inboundMasterDetail.length; i++) {
				if(inboundMasterDetail[i][1] < 85)
					color1 = "#3f9f3f"; // green
				else
					color1 = "#FF4D4D"; // red
				
				if(inboundMasterDetail[i][2] === "FINE")
					color2 = "#3f9f3f";
				else if(inboundMasterDetail[i][2] === "ERROR")
					color2 = "#FF4D4D";
				else
					color2 = "white";
				
				if(inboundMasterDetail[i][3] === "FINE")
					color3 = "#3f9f3f";
				else if(inboundMasterDetail[i][3] === "ERROR")
					color3 = "#FF4D4D";
				else
					color3 = "white";
				
				if(inboundMasterDetail[i][4] === "FINE")
					color4 = "#3f9f3f";
				else if(inboundMasterDetail[i][4] === "ERROR")
					color4 = "#FF4D4D";
				else
					color4 = "white";
				
				if($scope.environment == "UAT") {
					if(i==0)
						$("#inboundMasterDetailsR10Table > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+inboundMasterDetail[i][0]+"</th><th>"+inboundMasterDetail[i][1]+"</th><th>"+inboundMasterDetail[i][2]+"</th><th>"+inboundMasterDetail[i][3]+"</th><th>"+inboundMasterDetail[i][4]+"</th><th>"+inboundMasterDetail[i][5]+"</th></tr>");
					else
						$("#inboundMasterDetailsR10Table > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+inboundMasterDetail[i][0]+"</td><td style='background-color: "+color1+";'>"+inboundMasterDetail[i][1]+"</td><td style='background-color: "+color2+";'>"+inboundMasterDetail[i][2]+"</td><td style='background-color: "+color3+";'>"+inboundMasterDetail[i][3]+"</td><td style='background-color: "+color4+";'>"+inboundMasterDetail[i][4]+"</td><td>"+inboundMasterDetail[i][5]+"</td></tr>");
				} else if($scope.environment == "SIT") {
					if(i==0)
						$("#inboundMasterDetailsR10Table > thead").append("<tr style='text-align: center;'><th style='width:12%;'>"+inboundMasterDetail[i][0]+"</th><th>"+inboundMasterDetail[i][1]+"</th><th>"+inboundMasterDetail[i][2]+"</th><th>"+inboundMasterDetail[i][3]+"</th><th>"+inboundMasterDetail[i][4]+"</th></tr>");
					else
						$("#inboundMasterDetailsR10Table > tbody").append("<tr style='text-align: center;'><td style='background-color:rgb(198,217,241);'>"+inboundMasterDetail[i][0]+"</td><td style='background-color: "+color1+";'>"+inboundMasterDetail[i][1]+"</td><td style='background-color: "+color2+";'>"+inboundMasterDetail[i][2]+"</td><td style='background-color: "+color3+";'>"+inboundMasterDetail[i][3]+"</td><td>"+inboundMasterDetail[i][4]+"</td></tr>");
				}
			}
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
							 {{wmtype}} - {{storeNo}} - STORE STATUS
                        </div>
                </div>
		</div>
    </div>
	<br>
	<br>
	<div class="col-sm-12 col-md-12 col-lg-12 generationArea" id="generationArea" style="padding-bottom: 50px; margin-left: 0.5%;">
		<div class="col-sm-12 col-md-12 col-lg-12 COQReportTable" id ="COQReportTable">
			<div class="col-sm-12 col-md-12 col-lg-12">
			
			<div class="col-sm-4 col-md-4 col-lg-4">
			<span style="margin-left: 1.5%; font-weight: bolder; font-size: x-large;"> Store Status : <span id="StoreStatusColorID"> {{ StoreStatus}} </span> </span>
			</div>
			<br><br>
			<div class="col-sm-5 col-md-5 col-lg-5">			
			</div>
			
						</div>
						<div class="col-sm-12 col-md-12 col-lg-12" id="R8Div">						
						<div class="col-sm-12 col-md-12 col-lg-12" style="border-style: solid; border-width: 2px; border-color: #484848;">
						<br>
						<div class="pageName">
						<div class="col-sm-2 col-md-2 col-lg-2">
						<label style="font-weight: bolder; font-size: large; color:black;"> IS Status : <span id="ISStatusColorID"> {{ ISStatus}} </span></label>
						</div>
						
						<div class="col-sm-10 col-md-10 col-lg-10">
							<label style="margin-right: 19.5%;">Store {{storeNo}} - Inbound Messages</label></div>
							
						</div>
							<br><br><br>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table class="table table-bordered" id="inboundMessagesTable">
								<thead>
									<tr class="TestingPart">
										
								    </tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							<div class="pageName">
							<label>Store {{storeNo}} - Inbound Files</label>
						</div>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table class="table table-bordered" id="inboundFilesTable">
								<thead>
									<tr class="TestingPart">
										
								    </tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
							</div>
							</div>
							<br>
							<br>
							<div class="col-sm-12 col-md-12 col-lg-12" style="border-style: solid; border-width: 2px; border-color: #484848; margin-top: 3%;">
							<div class="pageName">							
						
							<label>Store {{storeNo}} -  Outbound Messages</label>
						</div>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table class="table table-bordered" id="outboundMessagesTable">
								<thead>
									<tr class="TestingPart">
										
								    </tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							<div class="pageName">
							<label>Store {{storeNo}} -  Outbound Files</label>
						</div>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table class="table table-bordered" id="outboundFilesTable">
								<thead>
									<tr class="TestingPart">
										
								    </tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							</div>
						</div>
						<div class="col-sm-12 col-md-12 col-lg-12" id="R10Div">
						<div class="col-sm-12 col-md-12 col-lg-12" style="border-style: solid; border-width: 2px; border-color: #484848;">
							<div class="pageName">
							<br>
							<div class="col-sm-2 col-md-2 col-lg-2">
						<label style="font-weight: bolder; font-size: large; color:black;"> IS Status : <span id="ISStatusColorID1"> {{ ISStatus}} </span></label>
						</div>
							<label style="margin-right: 19.5%;">Store {{storeNo}} -  Inbound Messages</label>
						</div>
						<br>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table class="table table-bordered" id="inboundMessagesR10Table">
								<thead>
									<tr class="TestingPart">
										
								    </tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							<div class="pageName">
							<label>Store {{storeNo}} -  Outbound Messages</label>
						</div>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table class="table table-bordered" id="outboundMessagesR10Table">
								<thead>
									<tr class="TestingPart">
										
								    </tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							<div class="pageName">
							<label>Store {{storeNo}} -  Inbound Master Details</label>
						</div>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<table class="table table-bordered" id="inboundMasterDetailsR10Table">
								<thead>
									<tr class="TestingPart">
										
								    </tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							</div>
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
