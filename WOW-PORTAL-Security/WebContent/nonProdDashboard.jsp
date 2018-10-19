<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QA Dashboards</title> 
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

<!-- <link rel="stylesheet" href="styles/jqx.light.css"> -->
<link rel="stylesheet" href="styles/jqx.base.css">
<link rel="stylesheet" href="styles/jqGauge.css">

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/chart.js" type="text/javascript"> </script>
<script src="js/angularChart.js" type="text/javascript"> </script>
<script src="js/horizontalBarChart.js" type="text/javascript"> </script>
<script src="js/flip.js" type="text/javascript"> </script>

<script>
angular.module('materialApp', ['chart.js'])
.config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
}])

.controller('wmCtrl', function($scope,$http) {
  $scope.wmLabels = ["Available", "Partially Available","Planned Maintenance","Not available"];
  $scope.options= {
		  percentageInnerCutout: 70,
		  /* tooltipFillColor: "red", */
		  multiTooltipTemplate: function(labelsWomenRatio) {
		  	return labelsWomenRatio + '\n ' + dataOffshoreLeverage;
		  }
		  /* toolTipContent: "y: <span style='\"'color: red;'\"'>{y}</span>" */
  }
  $scope.getWMSit=function(){
	  window.location.href="webMDashboard.jsp?SIT";
  }
  
  $scope.getWMUat=function(){
	  window.location.href="webMDashboard.jsp?UAT";
  }
  
	$scope.init=function(){
		
		$http({
			url:'getWMEnvOveralStatus.do?environment=UAT',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
			$scope.wmUATData=[results.data[0].toFixed(2),results.data[1].toFixed(2),results.data[2].toFixed(2),results.data[3].toFixed(2)];	
			$scope.wmUATFine = (results.data[0].toFixed(2));			
		});
		
		//////////////////
		
		$http({
			url:'getWMEnvOveralStatus.do?environment=SIT',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
			$scope.wmSITData=[results.data[0].toFixed(2),results.data[1].toFixed(2),results.data[2].toFixed(2),results.data[3].toFixed(2)];	
			$scope.wmSITFine = (results.data[0].toFixed(2));			
		});
		
	};
  
	   
})

// for meter chart starts
.controller('replenishController',function($scope, $http){

	$scope.setRplnColor = function(value) {
		if(value>=0 && value<=70)
			return "setRedColor";
		else if(value>70 && value<=85)
			return "setAmberColor";
		else if(value>85 && value<=101)
			return "setGreenColor";
	}
	
	 $http({
             method: 'GET',
             url: 'getSmktSitOverview.do',
             headers: {
                 'Content-Type': 'application/json; charset=UTF-8'
             },
         }).success(function(result){
        	 
        	 	$scope.rplnSmktSitFinePercent=result[0].toFixed(2);
        		$scope.rplnSmktSitFinePercentChart = result[0].toFixed(0);        		
        		 })
	        .error(function(){
	        	
	        });
	 
	 $http({
         method: 'GET',
         url: 'getBigwSitOverview.do',
         headers: {
             'Content-Type': 'application/json; charset=UTF-8'
         },
     }).success(function(result){
    	 
    	 	$scope.rplnBigWSitFinePercent=result[0].toFixed(2);
    		$scope.rplnBigWSitFinePercentChart = result[0].toFixed(0);        		
    		 })
        .error(function(){
        	
        });
	 
	 $http({
         method: 'GET',
         url: 'getSmktUatOverview.do',
         headers: {
             'Content-Type': 'application/json; charset=UTF-8'
         },
     }).success(function(result){
    	 
    	 	$scope.rplnSmktUatFinePercent=result[0].toFixed(2);
    		$scope.rplnSmktUatFinePercentChart = result[0].toFixed(0);        		
    		 })
        .error(function(){
        	
        });
	 
	 $http({
         method: 'GET',
         url: 'getBigwUatOverview.do',
         headers: {
             'Content-Type': 'application/json; charset=UTF-8'
         },
     }).success(function(result){
    	 
    	 	$scope.rplnBigWUatFinePercent=result[0].toFixed(2);
    		$scope.rplnBigWUatFinePercentChart = result[0].toFixed(0);        		
    		 })
        .error(function(){
        	
        });
})

.controller('rootCauseController', function($scope,$http) {
	
	$scope.labels = ["Reqt", "Doc", "Code", "Data", "Envt", "Scripts", "Exist in Prod", "Others"];
	//$scope.labels = ["Code", "Reqt", "Data", "Doc", "Envt", "Scripts", "Others"];
    $scope.colours = ['#ae87e0', '#ff9797', '#6ea9b9', '#ddcc51', '#7ca8de', '#9cd45f', '#e9893a', '#BC8F8F'];
    $scope.options = {
    		fullWidth : true
    }
	
  $scope.init=function(){
		$http({
 			url:'getRCADashboard.do',
 			type:'get',
 			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
 		}).then(function(results){
 			console.log("eeeeeeeeeeeeeeeeeeeeeee"+results);
 			$scope.data = results.data[0];
 			$scope.setSeries();
 		});
	};
	
	$scope.setSeries = function() {
		var pieData = [];
			pieData = $scope.data;

	        /* this.datasets.forEach(function (dataset) {
	            dataset.bars.forEach(function (bar, i) {
	                ctx.fillText(i + 1, bar.x, bar.y - 5);
	            });
	        }); */
			//$scope.seriesRCA = ["Code"+pieData[0], "Requirement"+pieData[1], "Envt"+pieData[2], "Data"+pieData[3], "TestScripts"+pieData[4]];	
	};
	
})

.controller('mcalmCtrl', function($scope,$http) {
  $scope.labelsMcalmDomains = ["Others", "1POS", "Galaxy", "HCM"];
  $scope.labelsMcalmActiveUsers = ["Others", "1POS", "Galaxy", "HCM"];
  $scope.fillColors = [{fillColor:['#f78f39', '#02B7FF', '#9ACD32', '#B07AD8']}];
  $scope.licenseColors = ["#f78f39","#02B7FF", "#9ACD32", "#B07AD8"];
  $scope.totalMCALM="200";
  $scope.totalActiveUsers="5205";
  $scope.options= {
		  percentageInnerCutout: 70,
  }
  $scope.mcalmDetailedReport=function(){
	  //window.location.href="QAResourcesDetailedDashboard.jsp";
  }
  
	$scope.init=function(){
		
		//$scope.totalActiveUsersSplit = [["56", "1", "8", "5"]];
		$http({
			url:'getMcalmDashboard.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
		}).then(function(results){
			console.log(results);
			$scope.totalActiveUsersSplit = results.data;
		});
		
		$http({
			url:'getMcalmLicenseDashboard.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
		}).then(function(results){
			console.log(results);
			$scope.totalMCALMSplit = results.data;
		});
	};
})

.controller('vmUtilisationController',function($scope,$http,$location){
	//$scope.totalStatusProjects=[];
	$scope.vmLabels=['Assigned','Available'];
	
	$scope.getDetailedVM = function() {
		//window.location.href='detailedVMDetails.jsp';
	}
	$scope.init=function(){
		
		$http({
			url:'getVMDashboard.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
		}).then(function(results){
			console.log(results.data);
			$scope.totalVMSplit = results.data;
			$scope.totalVM=(results.data[0]/(results.data[0]+ results.data[1]))*100;
			$scope.totalVMCount = results.data[0]+ results.data[1];
		});
	};
})

.controller('labUtilisationController',function($scope,$http,$location){
	//$scope.totalStatusProjects=[];
	$scope.labLabels=['Assigned','Available'];
	$scope.totalLAB="43";
	$scope.getDetailedLAB = function() {
		window.location.href='detailedLABDetails.jsp';
	}
	$scope.init=function(){
		
		$scope.totalLABSplit = ["41","2"];
		//alert('sss');
// 		$http({
// 			url:'getCurrentEngageMent.do',
// 			type:'get',
// 			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
// 		}).then(function(results){
// 			console.log(results);
// 			$scope.totalNoOfProjects=results.data[0]+results.data[1]+results.data[2];
// 			var projListAlphabet = [];
// 			projListAlphabet = (results.data).slice();
// 			newArray = [projListAlphabet[1], projListAlphabet[0], projListAlphabet[2]];
// 			$scope.totalStatusProjects=newArray;
// 			console.log($scope.totalStatusProjects);
			
// 		});
	};
})
.controller('performanceController',function($scope,$http,$location){
	//$scope.totalStatusProjects=[];
	$scope.performanceLabels=['Completed','In Progress'];
	/* $scope.getDetailedPERFORMANCE = function() {
		window.location.href='detailedPERFORMANCEDetails.jsp';
	} */
	$scope.init=function(){
		
		$http({
			url:'getPerformanceDashboard.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
		}).then(function(results){
			console.log(results);
			$scope.totalPERFORMANCESplit = [results.data[1], (results.data[0]-results.data[1])];
			$scope.totalPERFORMANCE=results.data[0];
		});
	};
})

.controller('automationController', function($scope,$http) {
  $scope.labelsAutomatedApps = ["InProgress", "Yet to Start"];
  $scope.labelsRegressionScripts = ["InProgress", "Yet to Start"];
  $scope.options= {
		  percentageInnerCutout: 70,
		  /* tooltipFillColor: "red", */
		  multiTooltipTemplate: function(labelsRegressionScripts) {
		  	return labelsRegressionScripts + '\n ' + dataOffshoreLeverage;
		  }
		  /* toolTipContent: "y: <span style='\"'color: red;'\"'>{y}</span>" */
  }
  /* $scope.getResource=function(){
	  window.location.href="QAResourcesDetailedDashboard.jsp";
  } */
  
	$scope.init=function(){
		
		$http({
			url:'getAutomationDashboard.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
			console.log("automation results...."+results);
			var automationInProgress = parseFloat(results.data[0]);
			var total = parseFloat(results.data[1]);
			$scope.automationArray = [automationInProgress, (total-automationInProgress)]
			$scope.totalApps = total;
			$scope.regressionPercent = ((automationInProgress/total)*100).toFixed(2);
			var regressionPercent = ((automationInProgress/total)*100).toFixed(2);
			$scope.regressionArray = [regressionPercent, (100-regressionPercent)];
			/* $scope.offshoreLeveragePercent = (results.data[1].toFixed(2));
			$scope.womenRatioPercent = +(results.data[0].toFixed(2));
			$scope.dataOffshoreLeverage=[results.data[3],results.data[2]];
			$scope.dataWomenRatio=[results.data[5],results.data[4]]; */
		});
	};
  
	   
})

.directive( 'ridgeSpeedometer', [ '$timeout','$window', function( $timeout, $window ){
	return {
		restrict: 'EAC',
		scope: { targetVal: '=val', conf: '=', label: '@' },
		template: '<canvas>HTML Canvas not supported by your browser</canvas><div class="ridge-speedometer-label" style="text-align: center">{{label}}</div>',
		link: function( scope, el, attr ){
			
			scope.val = 0;
			scope.width = $window.innerWidth;
			if(scope.width <= 1000) {
				scope.conf.size = 200;
				$('#slaMerticsID').addClass("width1000");
			} else if(scope.width >1000 && scope.width<=1250) {
				scope.conf.size = 300;
				$('#slaMerticsID').addClass("width1250");
			} else if(scope.width >1250 && scope.width<=1500) {
				scope.conf.size = 300;
				$('#slaMerticsID').addClass("width1500");
			} else if(scope.width >1500 && scope.width<=1750) {
				scope.conf.size = 400;
				$('#slaMerticsID').addClass("width1750");
			} else if(scope.width >1750 && scope.width<=2000) {
				scope.conf.size = 400;
				$('#slaMerticsID').addClass("width2000");
			} else if(scope.width >2000 && scope.width<=2250) {
				scope.conf.size = 500;
				$('#slaMerticsID').addClass("width2250");
			} else if(scope.width >2250 && scope.width<=2500) {
				scope.conf.size = 500;
				$('#slaMerticsID').addClass("width2500");
			} else if(scope.width >2500 && scope.width<=2750) {
				scope.conf.size = 600;
				$('#slaMerticsID').addClass("width2750");
			} else if(scope.width >2750 && scope.width<=3000) {
				scope.conf.size = 600;
				$('#slaMerticsID').addClass("width3000");
			} else if(scope.width >3000) {
				scope.conf.size = 700;
				$('#slaMerticsID').addClass("width3500");
			}
			
			var conf = setupConf( scope.conf );
			if( isNaN( scope.targetVal ) ){
				scope.targetVal = conf.min;
			}
			else if( scope.targetVal < conf.min){
				scope.targetVal = conf.min;
			}
			else if( scope.targetVal > conf.max ){
				scope.targetVal = conf.max;
			}
			
			if( conf.size )
				angular.element(el).find('canvas').attr( 'width', conf.size).attr( 'height', Math.floor( conf.size/2) );
			draw();
			angular.element($window).bind('resize', function() {
				scope.width = $window.innerWidth;

				if(scope.width <= 1000) {
					scope.conf.size = 200;
					$('#slaMerticsID').addClass("width1000");
				} else if(scope.width >1000 && scope.width<=1250) {
					scope.conf.size = 300;
					$('#slaMerticsID').addClass("width1250");
				} else if(scope.width >1250 && scope.width<=1500) {
					scope.conf.size = 300;
					$('#slaMerticsID').addClass("width1500");
				} else if(scope.width >1500 && scope.width<=1750) {
					scope.conf.size = 400;
					$('#slaMerticsID').addClass("width1750");
				} else if(scope.width >1750 && scope.width<=2000) {
					scope.conf.size = 400;
					$('#slaMerticsID').addClass("width2000");
				} else if(scope.width >2000 && scope.width<=2250) {
					scope.conf.size = 500;
					$('#slaMerticsID').addClass("width2250");
				} else if(scope.width >2250 && scope.width<=2500) {
					scope.conf.size = 500;
					$('#slaMerticsID').addClass("width2500");
				} else if(scope.width >2500 && scope.width<=2750) {
					scope.conf.size = 600;
					$('#slaMerticsID').addClass("width2750");
				} else if(scope.width >2750 && scope.width<=3000) {
					scope.conf.size = 600;
					$('#slaMerticsID').addClass("width3000");
				} else if(scope.width >3000) {
					scope.conf.size = 700;
					$('#slaMerticsID').addClass("width3500");
				}
				
				conf = setupConf( scope.conf );
				if( isNaN( scope.targetVal ) ){
					scope.targetVal = conf.min;
				}
				else if( scope.targetVal < conf.min){
					scope.targetVal = conf.min;
				}
				else if( scope.targetVal > conf.max ){
					scope.targetVal = conf.max;
				}
				
				if( conf.size )
					angular.element(el).find('canvas').attr( 'width', conf.size).attr( 'height', Math.floor( conf.size/2) );
				draw();
			});

			

			

			function draw() {
				var canvas = angular.element(el).find('canvas')[0],
				    options = null;
				
				// Canvas good?
				if (canvas !== null && canvas.getContext) {

					options = buildOptionsAsJSON(canvas, scope.val, conf );

				    // Clear canvas
				    clearCanvas(options);

					// Draw the styled edge
					drawEdgeArcs(options, "outer");
					drawEdgeArcs(options, "inner");

					// Draw thw background
					drawBackground(options);

					// Draw tick marks
					drawTickMarks(options, "large");
					drawTickMarks(options, "small");

					// Draw labels on markers
					drawTextMarkers(options);

					// Draw speeometer colour arc
					drawGaugeColourArc(options);

					// Draw the needle and base
					drawNeedle(options);
					
				} else {
					alert("HTML Canvas not supported by your browser!");
				}

				// Give the imppression of an "active" needle even if
				// our values are staying the same
				
				if( scope.val == scope.targetVal ){
					if( conf.wobble )
						scope.val = scope.val + 1;
				}
				else if ( scope.val < scope.targetVal ){
					if( scope.val+10 < scope.targetVal )
						scope.val = scope.val + 5;
					else
						scope.val = scope.val + 1;
				}
				else{
					if( scope.val-10 > scope.targetVal )
						scope.val = scope.val -5;
					else
						scope.val = scope.val - 1;
				}
				
				$timeout( draw, conf.redrawPeriod );
				
			}
			draw();
		}
	};
}])
function degToRad(angle) {
	// Degrees to radians
	return ((angle * Math.PI) / 180);
}

function radToDeg(angle) {
	// Radians to degree
	return ((angle * 180) / Math.PI);
}

function drawLine(options, line) {
	// Draw a line using the line object passed in
	options.ctx.beginPath();

	// Set attributes of open
	options.ctx.globalAlpha = line.alpha;
	options.ctx.lineWidth = line.lineWidth;
	options.ctx.fillStyle = line.fillStyle;
	options.ctx.strokeStyle = line.fillStyle;
	options.ctx.moveTo(line.from.X,
		line.from.Y);

	// Plot the line
	options.ctx.lineTo(
		line.to.X,
		line.to.Y
	);

	options.ctx.stroke();
}

function createLine(fromX, fromY, toX, toY, fillStyle, lineWidth, alpha) {
	// Create a line object using Javascript object notation
	return {
		from: {
			X: fromX,
			Y: fromY
		},
		to:	{
			X: toX,
			Y: toY
		},
		fillStyle: fillStyle,
		lineWidth: lineWidth,
		alpha: alpha
	};
}

function drawEdgeArcs(options, type) {

	options.ctx.beginPath();
	options.ctx.fillStyle = type == "inner" ? options.gaugeOptions.edgeInnerColor : options.gaugeOptions.edgeOuterColor;
	options.ctx.globalAlpha = type == "outer" ? options.gaugeOptions.edgeInnerAlpha : options.gaugeOptions.edgeOuterAlpha;

	options.ctx.arc(options.center.X,
					options.center.Y,
					type == "inner" ? Math.floor(options.gaugeOptions.edgeSize*options.radius) : options.radius,
					0,
					Math.PI,
					true);

	options.ctx.fill();
}

function drawBackground(options) {

    var i = 0;
	options.ctx.globalAlpha = options.gaugeOptions.backgroundAlpha;
	options.ctx.fillStyle   = options.gaugeOptions.backgroundColor;

	for (i = Math.floor(options.radius*.87); i < Math.floor(options.radius*.98); i++) {
		options.ctx.beginPath();
		options.ctx.arc(options.center.X,
			options.center.Y,
			i,
			0,
			Math.PI,
			true);
		options.ctx.fill();
	}
}

function applyDefaultContextSettings(options) {
	/* Helper function to revert to gauges
	 * default settings
	 */
	options.ctx.lineWidth   = 2;
	options.ctx.globalAlpha = 0.5;
	options.ctx.strokeStyle = "rgb(255,255,255)";
	options.ctx.fillStyle   = "rgb(255,255,255)";
}

function drawTickMarks(options, type) {

	var tickvalue = options.levelRadius - ( type == "large" ? 2 : 8 ),
	    iTick = 0,
        gaugeOptions = options.gaugeOptions,
        tickIncrement = type == "large" ? gaugeOptions.largeTickIncrement : gaugeOptions.smallTickIncrement,
        tickColor = type == "large" ? gaugeOptions.largeTickColor : gaugeOptions.smallTickColor,
        tickAlpha = type == "large" ? gaugeOptions.largeTickAlpha : gaugeOptions.smallTickAlpha,
        tickWidth = type == "large" ? gaugeOptions.largeTickWidth : gaugeOptions.smallTickWidth,
        iTickRad = 0,
        innerTickY,
        innerTickX,
        onArchX,
        onArchY,
        fromX,
        fromY,
        toX,
        toY,
        line;

	applyDefaultContextSettings(options);

	var degreeIncrement = (gaugeOptions.maxDegree - gaugeOptions.minDegree)/((gaugeOptions.max-gaugeOptions.min)/(tickIncrement))

	for (iTick = gaugeOptions.minDegree; iTick <= gaugeOptions.maxDegree; iTick += degreeIncrement) {

		iTickRad = degToRad(iTick);

		/* Calculate the X and Y of both ends of the
		 * line I need to draw at angle represented at Tick.
		 * The aim is to draw the a line starting on the 
		 * coloured arc and continueing towards the outer edge
		 * in the direction from the center of the gauge. 
		 */

		onArchX = gaugeOptions.radius - (Math.cos(iTickRad) * tickvalue);
		onArchY = gaugeOptions.radius - (Math.sin(iTickRad) * tickvalue);
		innerTickX = gaugeOptions.radius - (Math.cos(iTickRad) * gaugeOptions.radius);
		innerTickY = gaugeOptions.radius - (Math.sin(iTickRad) * gaugeOptions.radius);

		fromX = (options.center.X - gaugeOptions.radius) + onArchX;
		fromY = (gaugeOptions.center.Y - gaugeOptions.radius) + onArchY;
		toX = (options.center.X - gaugeOptions.radius) + innerTickX;
		toY = (gaugeOptions.center.Y - gaugeOptions.radius) + innerTickY;

		// Create a line expressed in JSON
		line = createLine(fromX, fromY, toX, toY, tickColor, tickWidth, tickAlpha);

		// Draw the line
		drawLine(options, line);
	}
}

function drawTextMarkers(options) {

	var innerTickX = 0,
	    innerTickY = 0,
        iTick = 0,
        gaugeOptions = options.gaugeOptions,
        iTickToPrint = 0;

	applyDefaultContextSettings(options);

	// Font styling
	options.ctx.font = gaugeOptions.markerFont;
	options.ctx.textBaseline = gaugeOptions.markerBaseline;
	options.ctx.fillStyle = gaugeOptions.markerColor;
	options.ctx.globalAlpha = gaugeOptions.markerAlpha;
	options.ctx.beginPath();
	var degreeIncrement = (gaugeOptions.maxDegree-gaugeOptions.minDegree)/((gaugeOptions.max-gaugeOptions.min)/gaugeOptions.largeTickIncrement)
	
	for (iTick = gaugeOptions.minDegree; iTick <= gaugeOptions.maxDegree; iTick += degreeIncrement) {

		innerTickX = gaugeOptions.radius - (Math.cos(degToRad(iTick)) * gaugeOptions.radius);
		innerTickY = gaugeOptions.radius - (Math.sin(degToRad(iTick)) * gaugeOptions.radius);

		// Some cludging to center the values (TODO: Improve)
		if (iTick <= 10) {
			options.ctx.fillText(iTickToPrint, (options.center.X - gaugeOptions.radius - 12) + innerTickX,
					(gaugeOptions.center.Y - gaugeOptions.radius - 12) + innerTickY + 5);
		} else if (iTick < 50) {
			options.ctx.fillText(iTickToPrint, (options.center.X - gaugeOptions.radius - 12) + innerTickX - 5,
					(gaugeOptions.center.Y - gaugeOptions.radius - 12) + innerTickY + 5);
		} else if (iTick < 90) {
			options.ctx.fillText(iTickToPrint, (options.center.X - gaugeOptions.radius - 12) + innerTickX,
					(gaugeOptions.center.Y - gaugeOptions.radius - 12) + innerTickY);
		} else if (iTick === 90) {
			options.ctx.fillText(iTickToPrint, (options.center.X - gaugeOptions.radius - 12) + innerTickX + 4,
					(gaugeOptions.center.Y - gaugeOptions.radius - 12) + innerTickY);
		} else if (iTick < 145) {
			options.ctx.fillText(iTickToPrint, (options.center.X - gaugeOptions.radius - 12) + innerTickX + 10,
					(gaugeOptions.center.Y - gaugeOptions.radius - 12) + innerTickY);
		} else {
			options.ctx.fillText(iTickToPrint, (options.center.X - gaugeOptions.radius - 12) + innerTickX + 15,
					(gaugeOptions.center.Y - gaugeOptions.radius - 12) + innerTickY + 5);
		}
		
		iTickToPrint += Math.round(gaugeOptions.largeTickIncrement);
	}

    options.ctx.stroke();
}

function drawGaugePart(options, alphaValue, strokeStyle, startPos) {
	/* Draw part of the arc that represents
	* the colour Gauge arc
	*/

	options.ctx.beginPath();

	options.ctx.globalAlpha = alphaValue;
	options.ctx.lineWidth = options.gaugeOptions.colorArcWidth;
	options.ctx.strokeStyle = strokeStyle;

	options.ctx.arc(options.center.X,
		options.center.Y,
		options.levelRadius,
		Math.PI + (Math.PI / 360 * startPos),
		0 - (Math.PI / 360 * 10),
		false);

	options.ctx.stroke();
}

function drawGaugeColourArc(options) {
	/* Draws the colour arc.  Three different colours
	 * used here; thus, same arc drawn 3 times with
	 * different colours.
	 * TODO: Gradient possible?
	 */
	var gaugeOptions = options.gaugeOptions;

	drawGaugePart(options, 1.0, gaugeOptions.normalColor, gaugeOptions.startOfNormalDegree || gaugeOptions.minDegree);
	drawGaugePart(options, 0.9, gaugeOptions.warningColor, gaugeOptions.endOfNormalDegree);
	drawGaugePart(options, 0.9, gaugeOptions.criticalColor, gaugeOptions.endOfWarningDegree);

}

function drawNeedleDial(options, alphaValue, strokeStyle, fillStyle) {

    var i = 0;

	options.ctx.globalAlpha = alphaValue;
	options.ctx.lineWidth = 3;
	options.ctx.strokeStyle = strokeStyle;
	options.ctx.fillStyle = fillStyle;

	// Draw several transparent circles with alpha
	for (i = 0; i < options.gaugeOptions.needleBaseSize; i++) {
		options.ctx.beginPath();
		options.ctx.arc(options.center.X,
			options.center.Y,
			i,
			0,
			Math.PI,
			true);

		options.ctx.fill();
		options.ctx.stroke();
	}
}

function convertValToAngle(options, increment) {
	/* Helper function to convert a value to the 
	* equivelant angle.
	*/
	var iVal = (options.val / increment),
		gaugeOptions = options.gaugeOptions,
		degIncrement = (gaugeOptions.maxDegree-gaugeOptions.minDegree)/((gaugeOptions.max-gaugeOptions.min)/increment)
	    iValAsAngle = ((iVal * degIncrement) + options.gaugeOptions.minDegree) % 180;

	// Ensure the angle is within range
	if (iValAsAngle > gaugeOptions.maxDegree) {
        iValAsAngle = iValAsAngle - gaugeOptions.maxDegree;
    } else if (iValAsAngle < gaugeOptions.minDegree) {
        iValAsAngle = iValAsAngle + gaugeOptions.maxDegree;
    }

	return iValAsAngle;
}

function drawNeedle(options) {

	var iValAsAngleRad = degToRad(convertValToAngle(options, options.gaugeOptions.largeTickIncrement)),
        gaugeOptions = options.gaugeOptions,
        innerTickX = gaugeOptions.radius - (Math.cos(iValAsAngleRad) ),
        innerTickY = gaugeOptions.radius - (Math.sin(iValAsAngleRad) ),
        fromX = (options.center.X - gaugeOptions.radius) + innerTickX,
        fromY = (gaugeOptions.center.Y - gaugeOptions.radius) + innerTickY,
        endNeedleX = gaugeOptions.radius - (Math.cos(iValAsAngleRad) * gaugeOptions.radius),
        endNeedleY = gaugeOptions.radius - (Math.sin(iValAsAngleRad) * gaugeOptions.radius),
        toX = (options.center.X - gaugeOptions.radius) + endNeedleX,
        toY = (gaugeOptions.center.Y - gaugeOptions.radius) + endNeedleY,
        line = createLine(fromX, fromY, toX, toY, gaugeOptions.needleColor, gaugeOptions.needleWidth, gaugeOptions.needleAlpha);

	drawLine(options, line);

	// Two circle to draw the dial at the base (give its a nice effect?)
	drawNeedleDial(options, gaugeOptions.needleBaseAlpha1, gaugeOptions.needleBaseColor1, gaugeOptions.needleBaseColor2);
	drawNeedleDial(options, gaugeOptions.needleBaseAlpha2, gaugeOptions.needleBaseColor1, gaugeOptions.needleBaseColor1);

}

function buildOptionsAsJSON(canvas, iVal, conf) {
	/* Setting for the gauge 
	* Alter these to modify its look and feel
	*/
	var centerX = Math.floor( canvas.width/2 ),
	    centerY = canvas.height,
        radius = Math.floor( canvas.height*2/3 ),
        outerRadius = Math.floor( canvas.height*10/11 );

	// Create a gauge object using Javascript object notation
	return {
		ctx: canvas.getContext('2d'),
		val: iVal,
		center:	{
			X: centerX,
			Y: centerY
		},
		levelRadius: radius - 10,
		gaugeOptions: {
			center:	{
				X: centerX,
				Y: centerY
			},
			radius: radius,
			edgeSize: conf.edgeSize,
			edgeOuterColor: conf.edgeOuterColor,
			edgeOuterAlpha: conf.edgeOuterAlpha,
			edgeInnerColor: conf.edgeInnerColor,
			edgeInnerAlpha: conf.edgeInnerAlpha, 
			backgroundColor: conf.backgroundColor,
			backgroundAlpha: conf.backgroundAlpha,
			smallTickColor: conf.smallTickColor,
			smallTickAlpha: conf.smallTickAlpha,
			smallTickWidth: conf.smallTickWidth,
			smallTickIncrement: conf.smallTickIncrement,
			largeTickColor: conf.largeTickColor,
			largeTickAlpha: conf.largeTickAlpha,
			largeTickIncrement: conf.largeTickIncrement,
			largeTickWidth: conf.largeTickWidth,
			markerFont: conf.markerFont,
			markerBaseline: conf.markerBaseline,
			markerColor: conf.markerColor,
			markerAlpha: conf.markerAlpha,
			colorArcWidth: conf.colorArcWidth,
			normalColor: conf.normalColor,
			warningColor: conf.warningColor,
			criticalColor: conf.criticalColor,
			min: conf.min,
			max: conf.max,
			minDegree: conf.minDegree,
			maxDegree: conf.maxDegree,
			endOfNormalDegree: conf.endOfNormalDegree,
			endOfWarningDegree: conf.endOfWarningDegree,
			needleColor: conf.needleColor,
			needleAlpha: conf.needleAlpha,
			needleWidth: conf.needleWidth,
			needleBaseColor1: conf.needleBaseColor1,
			needleBaseColor2: conf.needleBaseColor2,
			needleBaseAlpha1: conf.needleBaseAlpha1,
			needleBaseAlpha2: conf.needleBaseAlpha2,
			needleBaseSize: conf.needleBaseSize,
		},
		radius: outerRadius
	};
}

function clearCanvas(options) {
	options.ctx.clearRect(0, 0, options.width, options.height);
	applyDefaultContextSettings(options);
}

function setupConf( conf ) {
	conf = conf || {};
	var defaults = {};
	newConf = {
		minDegree: 10,
		maxDegree: 170,
	};
	if(conf.chartName == "rplnSmktSitChart") { // defect slippage
		defaults = {
				size: 700,
				redrawPeriod: 30,
				backgroundColor: 'rgb(0,0,0)',
				backgroundAlpha: 0.2,
				wobble: false,
				edgeSize: .97,
				edgeOuterColor: "rgb(255,255,255)",
				edgeOuterAlpha: 0.5,
				edgeInnerColor: "rgb(255,255,255)",
				edgeInnerAlpha: 0.5,
				min: 0,
				max: 100,
				smallTickColor: "rgb(255,255,255)",
				smallTickAlpha: 1,
				smallTickWidth: 1,
				smallTickIncrement: 5,
				largeTickColor: "rbg(255,255,255)",
				largeTickAlpha: 1,
				largeTickIncrement: 5,
				largeTickWidth: 3,
				markerFont: 'italic 11px sans-serif',
				markerBaseline: 'top',
				markerColor: 'rgb(255,255,255)',
				markerAlpha: 1,
				colorArcWidth: 15,
				normalColor: "rgb(255,77,77)",
				warningColor: "#FFA829",
				criticalColor: "rgb(0,176,80)",
				endOfNormalDegree: 240,
				endOfWarningDegree: 300,
				needleColor: "rgb(107, 119, 130)",
				needleAlpha: 1,
				needleWidth: 4,
				needleBaseColor1: "rgb(127,127,127)",
				needleBaseColor2: "rgb(255,255,255)",
				needleBaseAlpha1: 0.6,
				needleBaseAlpha2: 0.2,
				needleBaseSize: 20,
				width: 600,
				height: 400,
			}
	} else if(conf.chartName == "rplnBigWSitChart") {
		defaults = {
				size: 700,
				redrawPeriod: 30,
				backgroundColor: 'rgb(0,0,0)',
				backgroundAlpha: 0.2,
				wobble: false,
				edgeSize: .97,
				edgeOuterColor: "rgb(255,255,255)",
				edgeOuterAlpha: 0.5,
				edgeInnerColor: "rgb(255,255,255)",
				edgeInnerAlpha: 0.5,
				min: 0,
				max: 100,
				smallTickColor: "rgb(255,255,255)",
				smallTickAlpha: 1,
				smallTickWidth: 1,
				smallTickIncrement: 5,
				largeTickColor: "rbg(255,255,255)",
				largeTickAlpha: 1,
				largeTickIncrement: 5,
				largeTickWidth: 3,
				markerFont: 'italic 11px sans-serif',
				markerBaseline: 'top',
				markerColor: 'rgb(255,255,255)',
				markerAlpha: 1,
				colorArcWidth: 15,
				normalColor: "rgb(255,77,77)",
				warningColor: "#FFA829",
				criticalColor: "rgb(0,176,80)",
				endOfNormalDegree: 240,
				endOfWarningDegree: 300,
				needleColor: "rgb(107, 119, 130)",
				needleAlpha: 1,
				needleWidth: 4,
				needleBaseColor1: "rgb(127,127,127)",
				needleBaseColor2: "rgb(255,255,255)",
				needleBaseAlpha1: 0.6,
				needleBaseAlpha2: 0.2,
				needleBaseSize: 20,
				width: 600,
				height: 400,
			}
	} else if(conf.chartName == "rplnSmktUatChart") {
		defaults = {
				size: 700,
				redrawPeriod: 30,
				backgroundColor: 'rgb(0,0,0)',
				backgroundAlpha: 0.2,
				wobble: false,
				edgeSize: .97,
				edgeOuterColor: "rgb(255,255,255)",
				edgeOuterAlpha: 0.5,
				edgeInnerColor: "rgb(255,255,255)",
				edgeInnerAlpha: 0.5,
				min: 0,
				max: 100,
				smallTickColor: "rgb(255,255,255)",
				smallTickAlpha: 1,
				smallTickWidth: 1,
				smallTickIncrement: 5,
				largeTickColor: "rbg(255,255,255)",
				largeTickAlpha: 1,
				largeTickIncrement: 5,
				largeTickWidth: 3,
				markerFont: 'italic 11px sans-serif',
				markerBaseline: 'top',
				markerColor: 'rgb(255,255,255)',
				markerAlpha: 1,
				colorArcWidth: 15,
				normalColor: "rgb(255,77,77)",
				warningColor: "#FFA829",
				criticalColor: "rgb(0,176,80)",
				endOfNormalDegree: 240,
				endOfWarningDegree: 300,
				needleColor: "rgb(107, 119, 130)",
				needleAlpha: 1,
				needleWidth: 4,
				needleBaseColor1: "rgb(127,127,127)",
				needleBaseColor2: "rgb(255,255,255)",
				needleBaseAlpha1: 0.6,
				needleBaseAlpha2: 0.2,
				needleBaseSize: 20,
				width: 600,
				height: 400,
			}
	} else if(conf.chartName == "rplnBigWUatChart") {
		defaults = {
				size: 700,
				redrawPeriod: 30,
				backgroundColor: 'rgb(0,0,0)',
				backgroundAlpha: 0.2,
				wobble: false,
				edgeSize: .97,
				edgeOuterColor: "rgb(255,255,255)",
				edgeOuterAlpha: 0.5,
				edgeInnerColor: "rgb(255,255,255)",
				edgeInnerAlpha: 0.5,
				min: 0,
				max: 100,
				smallTickColor: "rgb(255,255,255)",
				smallTickAlpha: 1,
				smallTickWidth: 1,
				smallTickIncrement: 5,
				largeTickColor: "rbg(255,255,255)",
				largeTickAlpha: 1,
				largeTickIncrement: 5,
				largeTickWidth: 3,
				markerFont: 'italic 11px sans-serif',
				markerBaseline: 'top',
				markerColor: 'rgb(255,255,255)',
				markerAlpha: 1,
				colorArcWidth: 15,
				normalColor: "rgb(255,77,77)",
				warningColor: "#FFA829",
				criticalColor: "rgb(0,176,80)",
				endOfNormalDegree: 240,
				endOfWarningDegree: 300,
				needleColor: "rgb(107, 119, 130)",
				needleAlpha: 1,
				needleWidth: 4,
				needleBaseColor1: "rgb(127,127,127)",
				needleBaseColor2: "rgb(255,255,255)",
				needleBaseAlpha1: 0.6,
				needleBaseAlpha2: 0.2,
				needleBaseSize: 20,
				width: 600,
				height: 400,
			}
	}
	
	Object.keys( defaults ).forEach( function(key){
		newConf[key] = conf[key] || defaults[key];
	})

	return newConf;
}

// for meter chart ends



</script>
<script>
$(document).ready(function(){
	$('.chart-doughnut').css('width: 50px; height: 100px');
	$(".clickGoToReport").click(function() {
		window.open('slaMetricsReport.jsp','_self');
	});
	$(".clickGoToRCAReport").click(function() {
		window.open('rootCauseAnalysisReport.jsp','_self');
	});
});

</script>
<style>
.clickGoToReport {
	cursor: pointer;
}
.clickGoToRCAReport {
	cursor: pointer;
}
.addGreen {
	color: rgb(0,176,80) ! important;
}
.addRed {
	color: rgb(255,77,77) ! important;
}
.setGreenColor {
	color : rgb(0,176,80) ! important;
}
.setAmberColor {
	color : #FFA829 ! important;
}
.setRedColor {
	color : rgb(255,77,77) ! important;
}

.slaMetricsImage {
    position: absolute;
    left: 106px;
    right: 0;
    margin: 0 auto;
    top: 60%;
    transform: translateY(-50%);
    width: 28px;
    text-align: center;
    }


 #chartjs-tooltip {
      opacity: 1;
      position: absolute;
      background: rgba(0, 0, 0, .7);
      color: white;
      border-radius: 3px;
      -webkit-transition: all .1s ease;
      transition: all .1s ease;
      pointer-events: none;
      -webkit-transform: translate(-50%, 0);
      transform: translate(-50%, 0);
    }
    .chartjs-tooltip-key {
      display: inline-block;
      width: 10px;
      height: 10px;
    }
 .chart-innerTextWithTargetText {
      position: absolute;
      left: 0;
      right: 0;
      margin: 0 auto;
      top: 40%;
      transform: translateY(-50%);
      width: 52%;
          font-size: x-large;
      text-align: center;
    }
     .chart-innerTextWithoutTargetText {
      position: absolute;
      left: 0;
      right: 0;
      margin: 0 auto;
      top: 44%;
      transform: translateY(-50%);
      width: 52%;
          font-size: x-large;
      text-align: center;
    }
    .chart-outerText {
    	position: absolute;
      	right: 0;
      	margin: 0 auto;
      	top: 7%;
      	transform: translateY(-50%);
      	width: 100%;
        font-size: large;
      	text-align: center;
      	font-weight: bold;
    }
    .chartArrowImageWithTargetText {
    	position: absolute;
      left: 0;
    right: 0;
    margin: 0 auto;
    top: 64%;
    transform: translateY(-50%);
    width: 17%;
    text-align: center;
    }
	.chartArrowImageWithoutTargetText {
    	position: absolute;
      left: 0;
    right: 0;
    margin: 0 auto;
    top: 72%;
    transform: translateY(-50%);
    width: 17%;
    text-align: center;
    }    
.pageName {
	padding-bottom: 10px;
    padding-top: 3px;
}
.reportJpg {
position: absolute;
width: 27px;
/* right: 9px; */
left: 5px;
cursor: pointer;
}
select {
	font-family: "Roboto Condensed", Arial, sans-serif ! important;
}
label {
	color: rgba(0, 182, 255, 0.99) ! important;
	padding-left: 5px;
    padding-top: 8px;
    font-size: initial;
}
.chart-title {
	color: rgba(0, 182, 255, 0.99) ! important;
	font-weight: bold ! important;
	background-color : rgb(242, 242, 242) ! important;
}
.chart-wrapper .chart-title {
    padding: 0px 0px 4px ! important;
}
.trapezoid {
    visibility: hidden;
background-color: rgba(0, 182, 255, 0.99) ! important;
	    width: 102px;
    height: 19px;
    line-height: 18px;
    padding: 18px 4px 21px 4px;
    background-color: #ccc;
    padding-right: 29px;
    border-right: 0;
    position: relative;
    float: right;
    -moz-transform: scaleX(-1);
        -o-transform: scaleX(-1);
        -webkit-transform: scaleX(-1);
        transform: scaleX(-1);
        filter: FlipH;
        -ms-filter: "FlipH";
}

.width1000 {
    	right: 4%;
    }
    .width1250 {
    	right: 3%;
    }
    .width1500 {
    	right: 0%;
    }
     .width1750 {
    	right: 1.5%;
    }
    .width2000 {
    	right: 0%;
    }
     .width2250 {
    	right: -1%;
    }
    .width2500 {
    	right: -0.5%;
    }
     .width2750 {
    	right: 0.5%;
    }
    .width3000 {
    	right: 0.5%;
    }
    .width3500 {
    	right: -2.5%;
    }

.trapezoid:after {
	border-color: rgba(0, 182, 255, 0.99) transparent transparent transparent ! important; 
  	content: "";
  	display: block;
  	border-style: solid;
  	/* border-color: #ccc transparent transparent transparent; */
  	border-width: 40px 0 0 37px;
  	width: 0;
  	height: 0;
  	position: absolute;
  	top: 0;
  	right: -35px;
  	-moz-transform: scaleX(-1);
    -o-transform: scaleX(-1);
    -webkit-transform: scaleX(-1);
    transform: scaleX(-1);
    filter: FlipH;
    -ms-filter: "FlipH";
}
.chartImage {
	height : 205px;
	margin-left: 25%;
}

.pie-legend {
  list-style-type: none;
  padding-left: 0px;
  /* margin-left: 13%; */
}
.pie-legend li {
  display: block ;
  float: left;
  padding:5px;
  padding-left: 41px;
}
.pie-legend li span {
  width:10px;
  height:10px;
  float:left;
  margin-right:20px;
}
.pie-legend-text {
	white-space: nowrap;
}
.pie-legend-icon {
	margin-right: 6px ! important;
	margin-top:5px ! important;
}

.doughnut-legend {
  list-style-type: none;
  padding-left: 0px;
  margin-left: 35%;
  width: 200%;
}
.doughnut-legend li {
  display: inline ;
  float: left;
  padding:5px;
  margin-bottom: 3%;
}
.doughnut-legend li span {
  width:10px;
  height:10px;
  float:left;
  margin-right:20px;
}
.doughnut-legend-icon {
	margin-right: 6px ! important;
	margin-top:5px ! important;
}

.comingSoon {
	color: rgb(107, 119, 130) ! important;
	vertical-align: middle;
    text-align: center;
    font-size: -webkit-xxx-large;
    font-weight: bolder;
    margin-top: 21%;
    margin-bottom: 22%;
}
.chart-pie {
	margin-top: 4% !important;
}

</style>

</head>
<body ng-app = "materialApp" ng-cloak>
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
	<div class="workArea">
		<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="pageName">
        	        <label>QA DASHBOARD</label>
                </div>
				<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12">
      				<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="wmCtrl" ng-init="init()">
        				<div class="chart-wrapper" style = "margin-right: -3%;">
          					<div class="chart-title">
            					<label> Webmethods Integration</label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
            					<label class="chart-outerText" style="left: -48%;"><font color="#6b7782">WebMethods - SIT</font></label>
            					<div class="col-sm-6 col-md-6 col-lg-6"  style="margin-top: 10%;">
            						
            						<label class="chart-innerTextWithTargetText">{{wmSITFine}}%<BR>Available</label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="175" height="175" click="getWMSit"
  										chart-colours = ["#3f9f3f","#FFA829","#C0C5CA","#FF4D4D"] chart-options= options chart-data="wmSITData" chart-labels="wmLabels">
									</canvas>
									</div>
									
									<label class="chart-outerText" style="left: 21%;"><font color="#6b7782">Webmethods - UAT</font></label>
									<div class="col-sm-6 col-md-6 col-lg-6" style="margin-top: 10%;">
									<label class="chart-innerTextWithoutTargetText">{{wmUATFine}}%<BR>Available</label>
									<canvas id="doughnut" class="chart chart-doughnut" width="175" height="175" click="getWMUat"
  										chart-colours = ["#3f9f3f","#FFA829","#C0C5CA","#FF4D4D"] chart-options="{ percentageInnerCutout: 70 }" chart-data="wmUATData" chart-labels="wmLabels">
									</canvas>
									
									</div>
            					</div>
            					
          					</div>
          					
        				</div>
      				</div>
					
      				</div>
<!-- end of three -->
					<div class="col-sm-12 col-md-12 col-lg-12">
 					<div class="col-sm-12 col-md-12 col-lg-12 chartBox" ng-controller="replenishController">
        				<div class="chart-wrapper">
          					<div class="chart-title">
            					<label>Replenishment Dashboard</label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage">
            					<div id="grid-1-1">
								    <div class="col-sm-12 col-md-12 col-lg-12" style="text-align: center;">
								    <div class="col-sm-3 col-md-3 col-lg-3">
        								<span><label style="color: rgb(107, 119, 130) ! important; font-weight: bold;">SMKT/PEL/LIQUOR TEST</label></span>
    								</div>
    								<div class="col-sm-3 col-md-3 col-lg-3">
        								<span><label style="color: rgb(107, 119, 130) ! important; font-weight: bold;">BIGW TEST</label></span>
    								</div>
    								<div class="col-sm-3 col-md-3 col-lg-3">
        								<span><label style="color: rgb(107, 119, 130) ! important; font-weight: bold;">SMKT/PEL/LIQUOR UAT</label></span>
    								</div>
    								<div class="col-sm-3 col-md-3 col-lg-3">
        								<span><label style="color: rgb(107, 119, 130) ! important; font-weight: bold;">BIGW UAT</label></span>
    								</div>
    								</div>
    								
								    <div class="col-sm-12 col-md-12 col-lg-12" id="slaMerticsID">
								    <div class="col-sm-3 col-md-3 col-lg-3 clickGoToReport">
        								<ridge-speedometer x-val="rplnSmktSitFinePercentChart" x-conf="{chartName: 'rplnSmktSitChart', size: 300, backgroundColor: 'white', markerColor: 'black', smallTickColor: 'white', smallTickIncrement: 2, largeTickColor: 'white'}" />
        							</div>
        							<div class="col-sm-3 col-md-3 col-lg-3 clickGoToReport">
        								<ridge-speedometer x-val="rplnBigWSitFinePercentChart" x-conf="{chartName: 'rplnBigWSitChart', size: 300 ,backgroundColor : 'white', markerColor: 'black', smallTickColor: 'white', smallTickIncrement: 2, largeTickColor: 'white'}" />
        							</div>
        							<div class="col-sm-3 col-md-3 col-lg-3 clickGoToReport">
        								<ridge-speedometer x-val="rplnSmktUatFinePercentChart" x-conf="{chartName: 'rplnSmktUatChart', size: 300,backgroundColor: 'white', markerColor: 'black', smallTickColor: 'white', smallTickIncrement: 2, largeTickColor: 'white'}" />
        							</div>
        							<div class="col-sm-3 col-md-3 col-lg-3 clickGoToReport">
        								<ridge-speedometer x-val="rplnBigWUatFinePercentChart" x-conf="{chartName: 'rplnBigWUatChart', size: 300,backgroundColor: 'white', markerColor: 'black', smallTickColor: 'white', smallTickIncrement: 2, largeTickColor: 'white'}" />
        							</div>
        							</div>
        							
        							<div class="col-sm-12 col-md-12 col-lg-12" style="text-align: center;">
        							<div class="col-sm-3 col-md-3 col-lg-3">
        								<span><label style="font-weight: bold;" ng-class="setRplnColor(rplnSmktSitFinePercent)">{{rplnSmktSitFinePercent}}%</label>
    								</div>
    								<div class="col-sm-3 col-md-3 col-lg-3">
        								<span><label style="font-weight: bold;" ng-class="setRplnColor(rplnBigWSitFinePercent)">{{rplnBigWSitFinePercent}}%</label></span>
    								</div>
    								<div class="col-sm-3 col-md-3 col-lg-3">
        								<span><label style="font-weight: bold;" ng-class="setRplnColor(rplnSmktUatFinePercent)">{{rplnSmktUatFinePercent}}%</label></span>
    								</div>
    								<div class="col-sm-3 col-md-3 col-lg-3">
        								<span><label style="font-weight: bold;" ng-class="setRplnColor(rplnBigWUatFinePercent)">{{rplnBigWUatFinePercent}}%</label></span>
    								</div>
    								</div>
            					</div>
          					</div>
          					<!-- <div class="chart-notes">
            					Notes about this chart
          					</div> -->
        				</div>
      				</div>
      				</div>
      				<div class="col-sm-12 col-md-12 col-lg-12">
      				<div class="col-sm-4 col-md-4 col-lg-4 chartBox clickGoToRCAReport" ng-controller="rootCauseController" ng-init="init()">
        				<div class="chart-wrapper" style = "margin-right: -3%; padding-right: 0%;">
          					<div class="chart-title">
            					<label> ROOT CAUSE ANALYSIS </label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage">
            					<div id="grid-1-1">
              						<canvas id="pie" class="chart chart-pie" chart-colours = "colours" width="375" height="175"
  										chart-data="data" chart-labels="labels" chart-options="options" chart-legend="true" chart-indexLabel = "seriesRCA" >
									</canvas>
            					</div>
          					</div>
          					<!-- <div class="chart-notes">
            					Notes about this chart
          					</div> -->
        				</div>
      				</div>
<!-- end of three -->
      				<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="mcalmCtrl" ng-init="init()">
        				<div class="chart-wrapper" style = "margin-right: -3%;">
          					<div class="chart-title">
            					<label> MC ALM </label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage" style="margin-top: 4% !important;">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
            					<label class="chart-outerText" style="left: -48%;"><font color="#6b7782">License Allocation</font></label>
            					<div class="col-sm-6 col-md-6 col-lg-6"  style="margin-top: 12%;">
            						<label class="chart-innerTextWithoutTargetText" style="left: -1%; font-size: large ! important; top: 31% ! important;"><font color="#6b7782">Total</font></label>
            						<label class="chart-innerTextWithoutTargetText">{{totalMCALM}}</label>
            						<!-- <img ng-show = "showGreenOffshoreLeverage" class = "chartArrowImageWithTargetText" src="images/icons/greenArrow.png">
            						<img ng-show = "!showGreenOffshoreLeverage" class = "chartArrowImageWithTargetText" src="images/icons/redArrow.png"> -->
              						<canvas id="doughnut" class="chart chart-doughnut" width="175" height="175" click="mcalmDetailedReport"
  										chart-colours = "licenseColors" chart-options= options chart-data="totalMCALMSplit" chart-labels="labelsMcalmDomains" chart-legend="true">
									</canvas>
									</div>
									<label class="chart-outerText" style="left: 21%;"><font color="#6b7782">License Utilisation</font></label>
									<div class="col-sm-6 col-md-6 col-lg-6" style="margin-top: 10%;">
									<!-- <label class="chart-innerTextWithoutTargetText">{{totalActiveUsers}}</label> -->
            						<!-- <img ng-show = "showGreenWomenRatio" class = "chartArrowImageWithoutTargetText" src="images/icons/greenArrow.png">
            						<img ng-show = "!showGreenWomenRatio" class = "chartArrowImageWithoutTargetText" src="images/icons/redArrow.png"> -->
									<!-- <canvas id="doughnut" class="chart chart-doughnut" width="175" height="175" click="getResource"
  										chart-colours = ["#3f9f3f","#c0c5ca"] chart-options="{ percentageInnerCutout: 70 }" chart-data="dataWomenRatio" chart-labels="labelsWomenRatio">
									</canvas> -->
									<canvas id="bar" class="chart chart-bar" width="175" height="175"
  										chart-colours = "fillColors" chart-data="totalActiveUsersSplit" chart-labels="labelsMcalmActiveUsers">
									</canvas>
									
									</div>
            					</div>
            					
          					</div>
          					
        				</div>
      				</div>
      				<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="vmUtilisationController" ng-init="init()">
        				<div class="chart-wrapper">
          					<div class="chart-title">
            					<label> VM UTILIZATION </label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage1">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
              						
            					<div class="col-sm-12 col-md-12 col-lg-12"  style="margin-top: 8%;">
            						
            						
            						<!-- <label class="chart-innerTextWithoutTargetText" style="left: -1%; font-size: large ! important; top: 41% ! important;"><font color="#6b7782">Utilisation</font></label> -->
            						<label class="chart-innerTextWithTargetText" style="left: -1%; width: 40%; font-size: xx-large;">{{totalVM}}%</label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="70" height="40" click="getDetailedVM"
  										chart-colours = ["#02B7FF","#F2F2F2"] chart-options="{ percentageInnerCutout: 70 }" chart-data="totalVMSplit" chart-labels="vmLabels">
									</canvas>
									<!-- <span style = "margin-left: 30%; font-weight: bold; font-size: initial;"> <font color="#6b7782">  </font></span> -->
									<span><label style="color: rgb(107, 119, 130) ! important; margin-left: 39%; margin-top: 3%; font-weight: bold;">Total VM : {{totalVMCount}}</label></span>
									</div>
            					</div>
          					</div>
          					<!-- <div class="chart-notes">
            					Notes about this chart
          					</div> -->
        				</div>
      				</div>
      				</div>
      				<div class="col-sm-12 col-md-12 col-lg-12">
      				
      				<!-- <div class="col-sm-4 col-md-4 col-lg-4" ng-controller="labUtilisationController" ng-init="init()">
        				<div class="chart-wrapper" style="margin-right: -3%;">
          					<div class="chart-title">
            					<label> LAB UTILIZATION </label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage1">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
              						
            					<div class="col-sm-12 col-md-12 col-lg-12"  style="margin-top: 2%;">
            						
            						
            						<label class="chart-innerTextWithoutTargetText" style="left: -1%; font-size: large ! important; top: 41% ! important;"><font color="#6b7782">Total Stores</font></label>
            						<label class="chart-innerTextWithoutTargetText" style="left: -1%;top: 57% ! important;">{{totalLAB}}</label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="70" height="40" click="getDetailedLAB"
  										chart-colours = ["#B07AD8","#F2F2F2"] chart-options="{ percentageInnerCutout: 70 }" chart-data="totalLABSplit" chart-labels="labLabels">
									</canvas>
									<span style = "margin-left: 30%; font-weight: bold; font-size: initial;"> <font color="#6b7782">  </font></span>
									</div>
            					</div>
          					</div>
          					<div class="chart-notes">
            					Notes about this chart
          					</div>
        				</div>
      				</div> -->
      				
<!-- end of three -->
      			<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="performanceController" ng-init="init()">
        				<div class="chart-wrapper" style = "margin-right: -3%;">
          					<div class="chart-title">
            					<label> PERFORMANCE </label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<!-- <div class="chart-stage" id="chart-stage1">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
            					<div class="col-sm-12 col-md-12 col-lg-12"  style="margin-top: 6%;">
            						<label class="chart-innerTextWithoutTargetText" style="left: -1%; font-size: large ! important; top: 41% ! important;"><font color="#6b7782">Projects</font></label>
            						<label class="chart-innerTextWithoutTargetText" style="left: -1%;top: 57% ! important;">{{totalPERFORMANCE}}</label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="70" height="40" click="getDetailedPERFORMANCE"
  										chart-colours = ["#C9C529","#F2F2F2"] chart-options="{ percentageInnerCutout: 70 }" chart-data="totalPERFORMANCESplit" chart-labels="performanceLabels">
									</canvas>
									<span style = "margin-left: 30%; font-weight: bold; font-size: initial;"> <font color="#6b7782">  </font></span>
									</div>
            					</div>
          					</div> -->
          					<div class="chart-stage">
            					<div id="grid-1-1" class="comingSoon">
              						<!-- <img class = "chartImage" src="images/icons/soon.gif"> -->
              						COMING SOON
            					</div>
          					</div>
          					<!-- <div class="chart-notes">
            					Notes about this chart
          					</div> -->
        				</div>
      				</div>
      				<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="automationController" ng-init="init()">
        				<div class="chart-wrapper" style="margin-right: -3%;">
          					<div class="chart-title">
            					<label> AUTOMATION </label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<!-- <div class="chart-stage" id="chart-stage">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12" style="margin-top:7%;">
            					<label class="chart-outerText" style="left: -48%; top:1%"><font color="#6b7782">Applications</font></label>
            					<div class="col-sm-6 col-md-6 col-lg-6"  style="margin-top: 10%;">
            						
            						<label class="chart-innerTextWithoutTargetText" style="left: -1%; font-size: large ! important; top: 41% ! important;"><font color="#6b7782">Total Apps</font></label>
            						<label class="chart-innerTextWithoutTargetText" style="top: 55%;">{{totalApps}}</label>
            						<img ng-show = "showGreenOffshoreLeverage" class = "chartArrowImageWithTargetText" src="images/icons/greenArrow.png">
            						<img ng-show = "!showGreenOffshoreLeverage" class = "chartArrowImageWithTargetText" src="images/icons/redArrow.png">
              						<canvas id="doughnut" class="chart chart-doughnut" width="175" height="175"
  										chart-colours = ["#f78f39","#c0c5ca"] chart-options= options chart-data="automationArray" chart-labels="labelsAutomatedApps">
									</canvas>
									</div>
									<label class="chart-outerText" style="left: 21%; top:1%;"><font color="#6b7782">Regression Scripts</font></label>
									<div class="col-sm-6 col-md-6 col-lg-6" style="margin-top: 10%;">
									<label class="chart-innerTextWithTargetText">{{regressionPercent}}%</label>
            						<img ng-show = "showGreenWomenRatio" class = "chartArrowImageWithoutTargetText" src="images/icons/greenArrow.png">
            						<img ng-show = "!showGreenWomenRatio" class = "chartArrowImageWithoutTargetText" src="images/icons/redArrow.png">
									<canvas id="doughnut" class="chart chart-doughnut" width="175" height="175"
  										chart-colours = ["#3f9f3f","#c0c5ca"] chart-options="{ percentageInnerCutout: 70 }" chart-data="regressionArray" chart-labels="labelsRegressionScripts">
									</canvas>
									<span style = "margin-left: 30%; font-weight: bold; font-size: initial;"> <font color="#6b7782"> Target: >70% </font></span>
									
									</div>
            					</div>
            					
          					</div> -->
          					<div class="chart-stage">
            					<div id="grid-1-1" class="comingSoon">
              						<!-- <img class = "chartImage" src="images/icons/soon.gif"> -->
              						COMING SOON
            					</div>
          					</div>
          					
        				</div>
      				</div>
      				<div class="col-sm-4 col-md-4 col-lg-4 chartBox">
        				<div class="chart-wrapper">
          					<div class="chart-title">
            					<label> LAB UTILIZATION </label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage">
            					<div id="grid-1-1" class="comingSoon">
              						<!-- <img class = "chartImage" src="images/icons/soon.gif"> -->
              						COMING SOON
            					</div>
          					</div>
          					<!-- <div class="chart-notes">
            					Notes about this chart
          					</div> -->
        				</div>
      				</div>
      				</div>
    		</div>
		</div>
	</div>
	</div>
	</div>
	
	<section class="footerSection" id="footer">
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
	</section>
</body>
<script src='js/css3-animate-it.js'></script>
</html>
