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

.controller('smktUATOverview', function($scope,$http,$location) {
  $scope.smktUATOverviewLabels = ["COMPLETED", "NOT COMPLETED"];
  $scope.getSmktUatDetails=function(event){
	  window.location.href='rplnSmktUatDetails.jsp';	
  };
  
	$scope.init=function(){
		
		$http({
			url:'getSmktUatOverview.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
		//	console.log(results);
			$scope.smktUATFinePercent = (results.data[0].toFixed(2));
			$scope.smktUATValues=[results.data[0].toFixed(2),results.data[1].toFixed(2)];
		});
	};
})

.controller('smktSITOverview', function($scope,$http,$location) {
  $scope.smktSITOverviewLabels = ["COMPLETED", "NOT COMPLETED"];
  $scope.getSmktSitDetails=function(event){
	  window.location.href='rplnSmktSitDetails.jsp';
  };
  
	$scope.init=function(){
		
		$http({
			url:'getSmktSitOverview.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
		//	console.log(results);
			$scope.smktSITFinePercent = (results.data[0].toFixed(2));
			$scope.smktSITValues=[results.data[0].toFixed(2),results.data[1].toFixed(2)];
		});
	};
})

.controller('bigwUATOverview', function($scope,$http,$location) {
  $scope.bigwUATOverviewLabels = ["COMPLETED", "NOT COMPLETED"];
  $scope.getBigwUatDetails=function(event){
	  window.location.href='rplnBigwUatDetails.jsp';
  };
  
	$scope.init=function(){
		
		$http({
			url:'getBigwUatOverview.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
		//	console.log(results);
			$scope.bigwUATFinePercent = (results.data[0].toFixed(2));
			$scope.bigwUATValues=[results.data[0].toFixed(2),results.data[1].toFixed(2)];
		});
	};
})

.controller('bigwSITOverview', function($scope,$http,$location) {
  $scope.bigwSITOverviewLabels = ["COMPLETED", "NOT COMPLETED"];
  $scope.getBigwSitDetails=function(event){
	  window.location.href='rplnBigwSitDetails.jsp';
  };
  
	$scope.init=function(){
		
		$http({
			url:'getBigwSitOverview.do',
			type:'get',
			headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}
			
		}).then(function(results){
		//	console.log(results);
			$scope.bigwSITFinePercent = (results.data[0].toFixed(2));
			$scope.bigwSITValues=[results.data[0].toFixed(2),results.data[1].toFixed(2)];
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
	if(conf.chartName == "testEffectiveness") { // defect slippage
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
				max: 50,
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
				normalColor: "rgb(0,176,80)",
				warningColor: "#FFA829",
				criticalColor: "rgb(255,77,77)",
				endOfNormalDegree: 60,
				endOfWarningDegree: 80,
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
	} else if(conf.chartName == "scheduleSlippage") {
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
				max: 50,
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
				normalColor: "rgb(0,176,80)",
				warningColor: "#FFA829",
				criticalColor: "rgb(255,77,77)",
				endOfNormalDegree: 60,
				endOfWarningDegree: 120,
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
	} else if(conf.chartName == "effortSlippage") {
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
				max: 50,
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
				normalColor: "rgb(0,176,80)",
				warningColor: "#FFA829",
				criticalColor: "rgb(255,77,77)",
				endOfNormalDegree: 60,
				endOfWarningDegree: 120,
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
	} else if(conf.chartName == "defectRejection") {
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
				max: 50,
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
				normalColor: "rgb(0,176,80)",
				warningColor: "#FFA829",
				criticalColor: "rgb(255,77,77)",
				endOfNormalDegree: 90,
				endOfWarningDegree: 120,
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
        	        <label>REPLENISHMENT DASHBOARD</label>
                </div>
				<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12">
      				<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="smktUATOverview" ng-init="init()" style="margin-left: 15%;">
        				<div class="chart-wrapper" style = "margin-left: -3%;">
          					<div class="chart-title">
            					<label>SMKT/PEL/LIQUOR UAT</label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
            					<div class="col-sm-12 col-md-12 col-lg-12"  style="margin-top: 2%;">
            						<label class="chart-innerTextWithTargetText">{{smktUATFinePercent}}%<BR>COMPLETED</label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="70" height="40" click="getSmktUatDetails"
  										chart-colours = ["#3f9f3f","#FF4D4D"] chart-options="{ percentageInnerCutout: 70 }" chart-data="smktUATValues" chart-labels="smktUATOverviewLabels">
									</canvas>
									</div>
            					</div>
            					
          					</div>
          					
        				</div>
      				</div>
					<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="smktSITOverview" ng-init="init()" style="margin-right: 15%;">
        				<div class="chart-wrapper" style = "margin-left: -3%;">
          					<div class="chart-title">
            					<label>SMKT/PEL/LIQUOR TEST</label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage1">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
            					<div class="col-sm-12 col-md-12 col-lg-12"  style="margin-top: 2%;">
            						<label class="chart-innerTextWithTargetText">{{smktSITFinePercent}}%<BR>COMPLETED</label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="70" height="40" click="getSmktSitDetails"
  										chart-colours = ["#3f9f3f","#FF4D4D"] chart-options="{ percentageInnerCutout: 70 }" chart-data="smktSITValues" chart-labels="smktSITOverviewLabels">
									</canvas>
									</div>
            					</div>
          					</div>	
        				</div>
      				</div>
      				</div>
<!-- end of three -->
      				<div class="col-sm-12 col-md-12 col-lg-12">
      			<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="bigwUATOverview" ng-init="init()" style="margin-left: 15%;">
        				<div class="chart-wrapper" style = "margin-left: -3%;">
          					<div class="chart-title">
            					<label>BIGW UAT</label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage1">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
            					<div class="col-sm-12 col-md-12 col-lg-12"  style="margin-top: 2%;">
            						<label class="chart-innerTextWithTargetText">{{bigwUATFinePercent}}%<BR>COMPLETED</label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="70" height="40" click="getBigwUatDetails"
  										chart-colours = ["#3f9f3f","#FF4D4D"] chart-options="{ percentageInnerCutout: 70 }" chart-data="bigwUATValues" chart-labels="bigwUATOverviewLabels">
									</canvas>
									</div>
            					</div>
          					</div>
        				</div>
      				</div>
      				<div class="col-sm-4 col-md-4 col-lg-4" ng-controller="bigwSITOverview" ng-init="init()" style="margin-right: 15%;">
        				<div class="chart-wrapper" style="margin-left: -3%;">
          					<div class="chart-title">
            					<label>BIGW TEST</label><div id="trapezoid" class="trapezoid"></div>
          					</div>
          					<div class="chart-stage" id="chart-stage1">
            					<div id="grid-1-1" class="col-sm-12 col-md-12 col-lg-12">
            					<div class="col-sm-12 col-md-12 col-lg-12"  style="margin-top: 2%;">
            						<label class="chart-innerTextWithTargetText">{{bigwSITFinePercent}}%<BR>COMPLETED</label>
              						<canvas id="doughnut" class="chart chart-doughnut" width="70" height="40" click="getBigwSitDetails"
  										chart-colours = ["#3f9f3f","#FF4D4D"] chart-options="{ percentageInnerCutout: 70 }" chart-data="bigwSITValues" chart-labels="bigwSITOverviewLabels">
									</canvas>
									</div>
            					</div>
          					</div>          					
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
