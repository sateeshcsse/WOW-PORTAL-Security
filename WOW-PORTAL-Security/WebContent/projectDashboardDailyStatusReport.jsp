<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Status Report</title> 
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
 <link rel="stylesheet" href="styles/angular-material.min.css">
  <link rel="stylesheet" href="js/toastr.css">

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.scrollify.js"></script>
<script src="js/metisMenu.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script src="js/custom.js"></script>
<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/angular-1.4.7/angular-animate.js" ></script>
<script src="js/angular-1.4.7/angular-aria.js" ></script>
<script src="js/angular-material.min.js"></script>
<script src="js/toastr.min.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>

<script src="js/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>
<script src="http://canvg.googlecode.com/svn/trunk/canvg.js"></script>
<script type="text/javascript" src="http://gabelerner.github.io/canvg/rgbcolor.js"></script> 
<script type="text/javascript" src="http://gabelerner.github.io/canvg/canvg.js"></script> 
<script>
angular.module('materialApp', ['ngMaterial'])

.controller('AppCtrl', function($scope) {
  $scope.title1 = 'Update Table';
  $scope.title4 = 'Warn';
  $scope.isDisabled = true;

  $scope.googleUrl = 'http://google.com';

});


</script>
<script>
var percentageCompletion='';
$(document).ready(function(){
	if($(window).width()<=1200) {
		$("#searchProjectID").removeClass();
		$("#searchProjectID").addClass("col-sm-9 col-md-9 col-lg-9");
		$("#sideMenuID").removeClass();
		$("#sideMenuID").addClass("col-sm-3 col-md-3 col-lg-3");
		$(".pageNameMenu").css("margin-left", "-6%");
		$(".sideBar").css({"width": "112%", "display" : "inline-block"});
	} else {
		$("#searchProjectID").removeClass();
		$("#searchProjectID").addClass("col-sm-10 col-md-10 col-lg-10");
		$("#sideMenuID").removeClass();
		$("#sideMenuID").addClass("col-sm-2 col-md-2 col-lg-2");
		$(".pageNameMenu").css("margin-left", "0%");
		$(".sideBar").css({"width": "111%", "display" : "inline-block"});
	}
	$( window ).resize(function() {
		if($(window).width()<=1200) {
			$("#searchProjectID").removeClass();
			$("#searchProjectID").addClass("col-sm-9 col-md-9 col-lg-9");
			$("#sideMenuID").removeClass();
			$("#sideMenuID").addClass("col-sm-3 col-md-3 col-lg-3");
			$(".pageNameMenu").css("margin-left", "-6%");
			$(".sideBar").css({"width": "112%", "display" : "inline-block"});
		} else {
			$("#searchProjectID").removeClass();
			$("#searchProjectID").addClass("col-sm-10 col-md-10 col-lg-10");
			$("#sideMenuID").removeClass();
			$("#sideMenuID").addClass("col-sm-2 col-md-2 col-lg-2");
			$(".pageNameMenu").css("margin-left", "0%");
			$(".sideBar").css({"width": "111%", "display" : "inline-block"});
		}
	});
/* $.scrollify({
		section : "section",
		sectionName: "section-name",
		easing: "easeOutExpo",
		scrollSpeed: 100,
		offset : 0,
		scrollbars: true,
		axis:"y",
		target:"html,body",
		before:function() {},
		after:function() {}
		});  */
		
		function textcolors(size){
			
			for (var i =1; i <= size; i++) {
				var port=	$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').text();
				if(port==='DIGITAL'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#8000FF");
			}
			else if(port==='STORES'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#C00038");
			}
			else if(port==='ENTERPRISE APPLICATION'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#37c0f6");
			}
			else if(port==='GFS'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#12327e");
			}
			else if(port==='SAP'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#7e1232");
			} else if(port==='SUPPLY CHAIN'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#328332");
			}
				}
		}
		Highcharts.setOptions({
			 colors: ['#337ab7', '#cb4b4b', '#4da74d', '#edc240', '#31b0d5', '#ffa015', '#afd8f8','#C00038']
			});
		$('.generationArea').show();
		$('.detailedViewStatusTable').hide();
		$('.testPhase').hide();
		var portfolioSelect=$('.portfolioSelect');
		//var busUnitSelect=$('.busUnitSelect');
		var busUnitSelect="";
		var testPhaseSelect=$('.testPhaseSelect');
		var projectPhaseSelect=$('.projectPhaseSelect');
		var projectSelect=$('.projectSelect');
		var goLiveDate=$('#goLiveDate');
		$('.testPhase').hide();
		$("#goLiveDate").datepicker({
			showOn : "button",
			buttonImage : "images/icons/calender.png",
			buttonImageOnly : true,
			dateFormat:'dd/mm/yy',
			//minDate: new Date()
		});
		
		
		$.ajax({
			type:'post',
			url:'getTestPhaseToDailyStatusReport.do',
			data:'portfolio=all',
			success:function(jsonStr)
			{	
				projectSelect.append($("<option>").text('ALL').val('ALL'));
				$.each($.parseJSON(jsonStr),function(key,value){
					if(key=="testPhase")
						{
						$.each(value,function(key,value){
							projectSelect.append($("<option>").text(value).val(value));
						});
						}
				});
			}
			
		});
		
		
		var overViewStatusTable=$('.overViewStatusTable table').dataTable();
		overViewStatusTable.on( 'search.dt', function () {
		       var size=$('.overViewStatusTable table tbody tr td:nth-child(1)').length;
			   textcolors(size);
		   } );
		var executionStatusTable=$('.executionStatus table').dataTable();
		/*   for loading report table and loading portfolio menu   start   */
			$('.busUnitSelect').prop('disabled',true);
 		$('.overViewStatusTable table tbody').empty();
		overViewStatusTable.fnDestroy();
		  $('.portfolioSelect').on('change',function(){
			if($(this).val()=="MOR")
				$('.busUnitSelect').prop('disabled',false);
			else
				$('.busUnitSelect').prop('disabled',true);
		});  
		$.each($.parseJSON('${listWowmain}'),function(key,value){
			if(key=="listWowmain")
				{
				overViewStatusTable.fnDestroy();
				overViewStatusTable=$('.overViewStatusTable table').dataTable( {
				    "aLengthMenu": [[10, 20, 30, 40, 50, -1], [10, 20, 30, 40, 50, "All"]],
				    "pageLength": 20,
				    "data":value
				    } );
				}
			else if(key=="portfolio")
				{
				portfolioSelect.empty().append($("<option selected>").text("ALL").val("all"));
				$.each(value,function(key,value)
						{
					portfolioSelect.append($("<option>").text(value).val(value));
						});
				}
		});
		var size=$('.overViewStatusTable table tbody tr td:nth-child(1)').length;
		var decider=$('.overViewStatusTable table tbody tr td:nth-child(1)').text();
		console.log(size,decider);
		
		if(decider==='No data available in table'){
		return false;
		}else{
			if(size===1){
				
				$('.detailedViewStatusTable').css("display", "block");
				var portfolio=$('.overViewStatusTable table tbody tr td:nth-child(1)').text();
				var busunit="";
				var projname=$('.overViewStatusTable table tbody tr td:nth-child(2)').text();
				var projPhase=$('.overViewStatusTable table tbody tr td:nth-child(3)').text();
				var testPhase="";
				var goLiveDate=$('.overViewStatusTable table tbody tr td:nth-child(4)').text();
				var percentageOfComp='';
//	 			var percentageOfComp="percentage";
				var status=$('.overViewStatusTable table tbody tr td:nth-child(6)').text();
				
				// function to load detailed view
				loadDetailedProjectDetails(portfolio, busunit, projname, projPhase, testPhase, goLiveDate, percentageOfComp, status);
				$('.generationArea').show();
				$('.overViewStatusTable').hide();
				$('.generationArea .detailedViewStatusTable').show();
				$('.testPhase').hide();
			}
		}
		if(size>=1){
			textcolors(size);
		}
		var rows=$('.overViewStatusTable table').dataTable().fnGetNodes();
		var classname;
		for(var i=0;i<rows.length;i++)
			{
			classname=$(rows[i]).find("td:last-child").text().toLowerCase();
			$(rows[i]).find("td:last-child").removeClass().addClass(classname);
			}
			$(document).on('click','ul li.paginate_button a',function(){
			setTimeout(
					  function() 
					  {
						  var size3=$('.overViewStatusTable table tbody tr td:nth-child(1)').length;
							console.log('paginate_button'+size3);
							textcolors(size);
					  }, 0);
			
		});
		$(portfolioSelect).on('change',function(){
			//busUnitSelect.empty().append($("<option>").text("ALL").val("all"));
			testPhaseSelect.empty().append($("<option>").text("ALL").val("all"));
			projectPhaseSelect.empty().append($("<option>").text("ALL").val("all"));
			projectSelect.empty().append($("<option>").text("ALL").val("all"));
			if(portfolioSelect==="MOR"){
				console.log(portfolioSelect+'is MORRRRRRRRR');
			$.ajax({
				type:'post',
				url:'getBusUnitToDailyStatusReport.do',
				
				data:'portfolio='+portfolioSelect.val(),
				success:function(jsonStr)
				{
					$.each($.parseJSON(jsonStr),function(key,value){
						if(key=="busUnit")
							{
							$.each(value,function(key,value){
								busUnitSelect.append($("<option>").text(value).val(value));
							});
							}
					});
				}
				
			});
			}
			else{
				console.log(portfolioSelect+'is nottttttttttttttttttt MORRRRRRRRR');
				$.ajax({
					type:'post',
					url:'getTestPhaseToDailyStatusReport.do',
					data:'portfolio='+portfolioSelect.val()/* +'&busUnit='+busUnitSelect.val() */,
					success:function(jsonStr)
					{
						$.each($.parseJSON(jsonStr),function(key,value){
							if(key=="testPhase")
								{
								$.each(value,function(key,value){
									projectSelect.append($("<option>").text(value).val(value));
								});
								}
						});
					}
					
				});
			}
		});
		$(busUnitSelect).on('change',function(){
			testPhaseSelect.empty().append($("<option>").text("ALL").val("all"));
			projectPhaseSelect.empty().append($("<option>").text("ALL").val("all"));
			projectSelect.empty().append($("<option>").text("ALL").val("all"));
			$.ajax({
				type:'post',
				url:'getTestPhaseToDailyStatusReport.do',
				data:'portfolio='+portfolioSelect.val()+'&busUnit='+busUnitSelect.val(),
				success:function(jsonStr)
				{
					$.each($.parseJSON(jsonStr),function(key,value){
						if(key=="testPhase")
							{
							$.each(value,function(key,value){
								testPhaseSelect.append($("<option>").text(value).val(value));
							});
							}
					});
				}
				
			});
		});
		$(testPhaseSelect).on('change',function(){
			projectPhaseSelect.empty().append($("<option>").text("ALL").val("all"));
			projectSelect.empty().append($("<option>").text("ALL").val("all"));
			$.ajax({
				type:'post',
				url:'getProjectPhaseToDailyStatusReport.do',
				data:'portfolio='+portfolioSelect.val()+'&busUnit='+busUnitSelect.val()+'&testPhase='+testPhaseSelect.val(),
				success:function(jsonStr)
				{
					$.each($.parseJSON(jsonStr),function(key,value){
						if(key=="projectPhase")
							{
							$.each(value,function(key,value){
								projectPhaseSelect.append($("<option>").text(value).val(value));
							});
							}
					});
				}
				
			});
		});
		$(projectPhaseSelect).on('change',function(){
			projectSelect.empty().append($("<option>").text("ALL").val("all"));
			$.ajax({
				type:'post',
				url:'getProjectToDailyStatusReport.do',
				data:'portfolio='+portfolioSelect.val()+'&busUnit='+null+'&testPhase='+null+'&projectPhase='+projectPhaseSelect.val(),
				success:function(jsonStr)
				{
					$.each($.parseJSON(jsonStr),function(key,value){
						if(key=="project")
							{
							$.each(value,function(key,value){
								projectSelect.append($("<option>").text(value).val(value));
							});
							}
					});
				}
				
			});
		});
		$('.submitBtn').on('click',function(){
			if((projectSelect.val()=="ALL") || (projectSelect.val()=="all")) {
				getProjects();
				$('.generationArea').show();
				$('.overViewStatusTable').show();
				$('.generationArea .detailedViewStatusTable').hide();
				$('.testPhase').hide();
			}
			else {
				loadDetailedProjectDetails(portfolioSelect.val(), '', projectSelect.val(), '', '', '', '', '');
				$('.generationArea').show();
				$('.overViewStatusTable').hide();
				$('.generationArea .detailedViewStatusTable').show();
				$('.testPhase').hide();
			}
			
		});
		function getProjects() {
			$.ajax({
				type:'post',
				url:'dailyStatusReportSelected.do',
				data:'portfolio='+portfolioSelect.val()+'&testPhase='+testPhaseSelect.val()+
				'&projectPhase='+projectPhaseSelect.val()+'&project='+projectSelect.val(),
				success:function(jsonStr)
				{
					
					$.each($.parseJSON(jsonStr),function(key,value){
						if(key=="reportData")
							{
							overViewStatusTable.fnDestroy();
							overViewStatusTable=$('.overViewStatusTable table').dataTable( {
							    "aLengthMenu": [[10, 20, 30, 40, 50, -1], [10, 20, 30, 40, 50, "All"]],
							    "pageLength": 20,
							    "data":value
							    } );
							}
					});
				var rows=$('.overViewStatusTable table').dataTable().fnGetNodes();
					var classname;
					for(var i=0;i<rows.length;i++)
						{
						classname=$(rows[i]).find("td:last-child").text().toLowerCase();
						$(rows[i]).find("td:last-child").removeClass().addClass(classname);
						}
					
				}
			});
		}
		$('.reset').on('click',function(){
			console.log('$$$$$$$$');
			$('.projectPhaseSelect').find('option').remove().end()
		    .append('<option value="ALL">ALL</option>')
		    .val('ALL');
			$('.projectSelect').find('option').remove().end()
		    .append('<option value="ALL">ALL</option>')
		    .val('ALL');
			
				$('.portfolioSelect').prop('selectedIndex',0);
				$('.projectPhaseSelect').prop('selectedIndex',0);
				$('.projectSelect').prop('selectedIndex',0);
				window.location.href='dailyStatusReportOverall.do';
		});
		/*   for loading report table and loading portfolio menu   end    */
		 $("#menu").metisMenu({
// 			    activeClass: 'active'
			  });
		 
		$('.homeMenu .container .col-md-8 .centeredMenu li:nth-child(1)').removeClass("active");
		$('.homeMenu .container .col-md-8 .centeredMenu li:nth-child(3)').addClass("active");
		
		$('.sideBar .dashBoardMenu .metismenu li:nth-child(2)').addClass("active");
		$('.sideBar .dashBoardMenu .metismenu li:nth-child(2) ul').addClass("in");
		$('.sideBar .dashBoardMenu .metismenu li:nth-child(2) ul li:nth-child(1) a').css('color','#484848');
		
		
		
		$('.selectionArea .row2 .col-md-1:nth-of-type(2) .btn-primary').click(function(){
			$('.generationArea').show();
			$('.generationArea .overViewStatusTable').show();
			$('.detailedViewStatusTable').hide();
			$('.testPhase').hide();
		});
		$(document).on('click','.overViewStatusTable table tbody tr td:nth-child(1), .overViewStatusTable table tbody tr td:nth-child(2)',function(){
			$('.detailedViewStatusTable').css("display", "block");
			$('.reportJpg').css("display", "block");
			$('.batchRunDate').css("display", "block");
			var portfolio=$(this).parent().find('td:nth-child(1)').text();
			var busunit="";
			var projname=$(this).parent().find('td:nth-child(2)').text();
			var projPhase=$(this).parent().find('td:nth-child(3)').text();
			var testPhase="";
			var goLiveDate=$(this).parent().find('td:nth-child(4)').text();
			var percentageOfComp=$(this).parent().find('td:nth-child(5)').text();
// 			var percentageOfComp="percentage";
			var status=$(this).parent().find('td:nth-child(6)').text();
			
			// function to load detailed view
			loadDetailedProjectDetails(portfolio, busunit, projname, projPhase, testPhase, goLiveDate, percentageOfComp, status);
			
			
			$('.generationArea').show();
			$('.overViewStatusTable').hide();
			$('.generationArea .detailedViewStatusTable').show();
			$('.testPhase').hide();
		});
		
		function loadDetailedProjectDetails(portfolio, busunit, projname, projPhase, testPhase, goLiveDate, percentageOfComp, status) {
			$.ajax({
				type:'post',
				url:'dailyStatusDetailedReportSelected.do',
				data:'portfolio='+portfolio+'&busUnit='+busunit+'&projName='+projname+'&projPhase='+projPhase
				+'&testPhase='+testPhase+'&goLiveDate='+goLiveDate+'&poc='+percentageOfComp+'&status='+status,
				success:function(jsonStr)
				{
					$.each($.parseJSON(jsonStr),function(key,value){
						if(key=="reportData")
							{
							executionStatusTable.fnDestroy();
							executionStatusTable=$('.executionStatus table').dataTable( {
							    "aLengthMenu": [[10, 20, 30, 40, 50, -1], [10, 20, 30, 40, 50, "All"]],
							    //"pageLength": 10,
							    "bPaginate": false,
							    "bFilter": false,
							    "bInfo": false,
							    "data":value
							    } );
							}
						else if(key=="detailsTable")
							{
							$('.statusView table tbody').empty();
							$.each(value,function(key,value){
							
								$('.statusView table tbody').append($("<tr>"));
								$.each(value,function(key,value){
									console.log("keyssss$$$$"+key+"value###"+value);
									if(key==5){
										$('#batchRunDate').text(value);
									} else if(key==0){
										$('.statusView table tbody tr:last-child').append($("<td  class='verticalAlign'>").text(value));
									}
									else if(key==1){
										$('.statusView table tbody tr:last-child').append($("<td  class='verticalAlign'>").text(value));
									} else {
										$('.statusView table tbody tr:last-child').append($("<td  class='verticalAlign'>"));
									}
									
								});
								/* var className=$('.statusView table tbody tr:last-child td:last-child').text().toLowerCase();
								$('.statusView table tbody tr:last-child td:last-child').removeClass().addClass(className); */
							});
							$('.statusView table tbody tr td:last-child').text(percentageCompletion);
							}
						else if(key=="defectStatus")
						{
							console.log('inside defect status'+value);
							var column=1,row=1,total=0;
						$.each(value,function(key,value){
							column++;
							
							if(column==6)
								{
								console.log('totoal is'+total);
								$('.defectStatus table tbody tr:nth-child('+row+') td:nth-child('+column+')').text(total);
								total=0;
								column=2;
								row++;
								}
							total+=value;
							$('.defectStatus table tbody tr:nth-child('+row+') td:nth-child('+column+')').text(value);
						});
						$('.defectStatus table tbody tr:nth-child('+row+') td:nth-child('+(++column)+')').text(total);
						$('.defectStatus table tbody tr').each(function(){
							
						});
						} 
						
						
						else if(key=="peformanceKeys")
						{
							console.log("!!!!!!!!!!!!!!!!!!!!"+Object.keys(value).length);
							var noOfKeys = Object.keys(value).length;
							$.each(value,function(key,value){
								$(".performanceKeys").addClass("table-bordered");
								console.log("keyyyyyyy*********"+key+"value********"+value);
								if(key==4){
									return true;
								}
								if(key==7){
									return true;
								}
								if(key==10)
									{
									/* d = new Date(value);
									utc = d.getTime() + (d.getTimezoneOffset() * 60000);
								    nd = new Date(utc + (3600000*(+10)));
									$('#lastUpdatedDate').text(nd.toLocaleString());
									console.log("date value@@@@@@@@@@@@@@@@@@@"+nd.toLocaleString()); */
									$('#lastUpdatedDate').text(value);
									}
								if(key==9){
									$('.summary tr').eq(key+1).find('td').text('');
									$.each(value.split("%%%"),function(key,value){
										$('.summary tr').eq(key+1).find('td').text(value);										
									});
								}
								if(value==='Amber'){
									value='#FFA829';
								}
								$('.performanceKeys table thead tr:nth-child(2) th:nth-child('+(key+1)+') .colorPallet').css('background-color',value);
								//$('.performanceKeys table thead tr:last-child').append($("<th>").text(value));
								/* var className=$('.statusView table tbody tr:last-child td:last-child').text().toLowerCase();
								$('.statusView table tbody tr:last-child td:last-child').removeClass().addClass(className); */
								if(value==='#FFA829'){
									value='Amber';
								}
								if(key==8){
								$('.performanceKeys table thead tr:last-child th:last-child').empty();
								$('.performanceKeys table thead tr:last-child th:last-child').removeClass();
								$('.performanceKeys table thead tr:last-child th:last-child').text(value);
								$('.performanceKeys table thead tr:last-child th:last-child').addClass(value.toLowerCase());
								}
								if(key==11){
									$('.riskAndIssues .table tbody tr td' ).text(value);
								}
								
								if(key==12){
									percentageCompletion=value;
									$('.statusView .table tbody tr td:last-child').text(value);
								}
								if(key==14){
									var startDate = $('.statusView table tbody tr td:nth-child(4)').text();
									if(startDate== null || startDate== undefined || startDate=='')
										$('.statusView table tbody tr td:nth-child(4)').text(value);
									
								}
								if(key==13){
									$('.statusView .table tbody tr td:nth-child(3)').text(value);
								}
								if(key==15){
									var endDate = $('.statusView table tbody tr td:nth-child(5)').text();
									if(endDate== null || endDate== undefined || endDate=='')
										$('.statusView table tbody tr td:nth-child(5)').text(value);
								}
								
								
							});
							if(noOfKeys>15) {
								noOfRows = (noOfKeys-8)/8;
								var seen = {};
									for(var i=1; i<noOfRows;i++) {
										var portfolioName = $('.statusView table tbody tr:eq(0) td:eq(0)').text();
										var projName = $('.statusView table tbody tr:eq(0) td:eq(1)').text();
										
										$('.statusView table tbody').append('<tr> <td> '+portfolioName+' </td> <td> '+projName+' </td> <td> </td> <td> </td> <td> </td> <td> </td> </tr>');
										//$('.statusView table tbody').append('<tr> <td rowspan="' + noOfRows + '"> </td> <td rowspan="' + noOfRows + '"> </td> <td> </td> <td> </td> <td> </td> <td> </td> </tr>');
										$.each(value,function(key,value){
											
											if(key==(12+(i*8))){
												$('.statusView .table tbody tr:eq('+i+') td:nth-child(6)').text(value);
											}
											if(key==(13+(i*8))){
												$('.statusView .table tbody tr:eq('+i+') td:nth-child(3)').text(value);
											}
											if(key==(14+(i*8))){
												var startDate = $('.statusView table tbody tr:eq('+i+') td:nth-child(4)').text(value);
												if(startDate== null || startDate== undefined || startDate=='')
													$('.statusView table tbody tr:eq('+i+') td:nth-child(4)').text(value);
											}
											if(key==(15+(i*8))){
												var endDate = $('.statusView table tbody tr:eq('+i+') td:nth-child(5)').text(value);
												if(endDate== null || endDate== undefined || endDate=='')
													$('.statusView table tbody tr:eq('+i+') td:nth-child(5)').text(value);
											}
										
										});
									}
									
									$('.statusView .table tbody td:nth-child(1)').each(function() 
									{
									    var $this = $(this);
									    var index = $this.index();
									    var txt =  $this.text().trim();
									    if (seen[index] === txt) 
									    {
									        $($this.parent().prev().children()[index]).attr('rowspan', noOfRows);
									        $this.hide();
									    }
									    else 
									    {
									        seen[index] = txt;
									    }
									});
									$('.statusView .table tbody td:nth-child(2)').each(function() 
											{
											    var $this = $(this);
											    var index = $this.index();
											    var txt =  $this.text().trim();
											    if (seen[index] === txt) 
											    {
											        $($this.parent().prev().children()[index]).attr('rowspan', noOfRows);
											        $this.hide();
											    }
											    else 
											    {
											        seen[index] = txt;
											    }
											});
								}
							
						}
						
						else if(key="pieStatus"){
							roocauseDraw(value);
						}
						
					});
					toastr.success('Successfully completed Loading', 'ALM Data', {timeOut: 3000});	
				}
			});
			//captureTablesAsImage();
			setTimeout(captureTablesAsImage, 2000);
		};
		
		$('.selectionArea .row2 .col-md-1:nth-of-type(3) .btn-primary').click(function(){
			$('.generationArea').hide();
		});

// 		 $('.overViewStatusTable table').dataTable();
		 $('#updateAll').on('click',function(){
	  
	var portfolio=$('.statusView .table-striped tbody tr td:nth-child(1)').text();
	var projName=$('.statusView .table-striped tbody tr td:nth-child(2)').text();
	var projPhase=$('.statusView .table-striped tbody tr td:nth-child(3)').text();
	var testPhase=$('.statusView .table-striped tbody tr td:nth-child(4)').text();
	var goLiveDate=$('.statusView .table-striped tbody tr td:nth-child(5)').text() || '' ;
	$.ajax({
		type:'get',
		url:'updateCompleteTable.do',
		data:'portfolio='+portfolio+'&projName='+projName+'&projPhase='+projPhase
		+'&testPhase='+testPhase+'&goLiveDate='+goLiveDate,
		success:function(jsonStr){
			$.each($.parseJSON(jsonStr),function(key,value){
				if(key=="reportData")
					{
					executionStatusTable.fnDestroy();
					executionStatusTable=$('.executionStatus table').dataTable( {
					    "aLengthMenu": [[10, 20, 30, 40, 50, -1], [10, 20, 30, 40, 50, "All"]],
					    //"pageLength": 10,
					    "bPaginate": false,
					    "bFilter": false,
					    "bInfo": false,
					    "data":value
					    } );
					}
				else if(key=="detailsTable")
					{
					$('.statusView table tbody').empty();
					$.each(value,function(key,value){
						console.log("keyssss$$$$"+key+"value###"+value);
						$('.statusView table tbody').append($("<tr>"));
						$.each(value,function(key,value){
							if(value){
							$('.statusView table tbody tr:last-child').append($("<td>").text(value));
							}else{
								$('.statusView table tbody tr:last-child').append($("<td>"));
							}
						});
						/* var className=$('.statusView table tbody tr:last-child td:last-child').text().toLowerCase();
						$('.statusView table tbody tr:last-child td:last-child').removeClass().addClass(className); */
					});
					}
				else if(key=="defectStatus")
				{
					console.log('inside defect status'+value);
					var column=1,row=1,total=0;
				$.each(value,function(key,value){
					column++;
					
					if(column==6)
						{
						console.log('totoal is'+total);
						$('.defectStatus table tbody tr:nth-child('+row+') td:nth-child('+column+')').text(total);
						total=0;
						column=2;
						row++;
						}
					total+=value;
					$('.defectStatus table tbody tr:nth-child('+row+') td:nth-child('+column+')').text(value);
				});
				$('.defectStatus table tbody tr:nth-child('+row+') td:nth-child('+(++column)+')').text(total);
				$('.defectStatus table tbody tr').each(function(){
					
				});
				} 
				
				
				else if(key=="peformanceKeys")
				{
					$.each(value,function(key,value){
						console.log("keyyyyyyy*********"+key+"value********"+value);
						if(key==4){
							return true;
						}
						if(key==7){
							return true;
						}
						if(key==9)
							{
							/* d = new Date(value);
							utc = d.getTime() + (d.getTimezoneOffset() * 60000);
						    nd = new Date(utc + (3600000*(+10)));
							$('#lastUpdatedDate').text(nd.toLocaleString());
							console.log("date value@@@@@@@@@@@@@@@@@@@1111"+nd.toLocaleString()); */
							$('#lastUpdatedDate').text(value);
							}
						if(key==10){
							$.each(value.split(";"),function(key,value){
								$('.summary tr').eq(key+1).find('td').text(value);										
							});
						}
						if(value==='Amber'){
							value='#FFA829';
						}
						$('.performanceKeys table thead tr:nth-child(2) th:nth-child('+(key+1)+') .colorPallet').css('background-color',value);
						//$('.performanceKeys table thead tr:last-child').append($("<th>").text(value));
						/* var className=$('.statusView table tbody tr:last-child td:last-child').text().toLowerCase();
						$('.statusView table tbody tr:last-child td:last-child').removeClass().addClass(className); */
						if(value==='#FFA829'){
							value='Amber';
						}
						if(key==8){
						$('.performanceKeys table thead tr:last-child th:last-child').empty();
						$('.performanceKeys table thead tr:last-child th:last-child').removeClass();
						$('.performanceKeys table thead tr:last-child th:last-child').text(value);
						$('.performanceKeys table thead tr:last-child th:last-child').addClass(value.toLowerCase());
						}
						if(key==11){
							$('.riskAndIssues .table tbody tr td' ).text(value);
						}
						if(key==12){
							percentageCompletion=value;
							$('.statusView .table tbody tr td:last-child').text(value);
						}
					});
					}
				
				else if(key="pieStatus"){
					roocauseDraw(value);
				}
				
			});
			toastr.success('Successfully completed Loading', 'ALM Data', {timeOut: 3000});	
			
		},
		error:function(jsonStr){
			toastr.error('Server returned with message >>', jsonStr, {timeOut: 3000});	
		}
	});
	

});
		 
		 
			var roocauseDraw= function(value){ 
			var defect_Total=0;
			$('.defectStatus table tbody tr td:last-child').each(function(){
				defect_Total+=parseInt($(this).text());
			});
			var sum = value.reduce(function (a, b) {
			    return a + b;
			});
			console.log(sum+' :sum   '+defect_Total+'  :defect_Total');
			var finalVal=Math.abs(defect_Total-sum);
			console.log('finalVal   '+finalVal);
		 $('#container1').highcharts({
	            chart: {
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            legend:{
	            	layout:'vertical',
	            	align:'left',
	            	verticalAlign:'middle',
 	       			x:300,
					y:-80,
	       			itemMarginBottom:10,
	       			floating:true,	
	       			itemStyle:{
	       				fontSize:'9px',
	                    font: '9pt Trebuchet MS, Verdana, sans-serif',
	                    fontWeight:'bold',
	       			}
	            },
	            title: {
					text: "",
	                align:'center',
	                style:{
	                	fontSize:'14',
		                fontFamily:'calibri',
		                color:'blue'
	                }
	            },
	            tooltip: {
	                pointFormat: '<b>{point.y}</b>'
	            },
	            plotOptions: {
	                pie: {
	                	  size:'55%',
	                	center: [100, 100],
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: false,
	                    },
	                    showInLegend: true,
	                    align:'left'
	                },
	                series: {
	                    dataLabels: {
	                        enabled: true,
	                        formatter: function() {
	                        	if(this.y!=0)
	                            return this.y;
	                        },
	                        distance: -20,
	                        color:'black',
	                        fontSize:14
	                    }
	                }
	            },
	            series: [{
	                type: 'pie',
	                name: 'Browser share',
	                data: [{name:"Code",
	                	        y: parseInt(value[0]),
	                	        },
	                	        {name:"Requirements",
		                	        y:parseInt(value[3]),
		                	        },
		                	        {name:"Design",
			                	        y:parseInt(value[4]),
			                	        },
			                	        {name:"Environment",
				                	        y:parseInt(value[6]),
				                	        },
				                	        {name:"Data",
					                	        y:parseInt(value[2]),
					                	        },
					                	        {name:"Exist In Prod",
						                	        y:parseInt(value[1]),
						                	        },
						                	        {name:"Test Scripts",
							                	        y:parseInt(value[5]),
							                	        },
							                	         {name:"Others",
								                	        y:finalVal+parseInt(value[7]),
								                	        }, 
							                	      
						                	      
	                	        
	                	        
	                	        ]
	            }]
	        });
};

var totalTable=$('.detailedViewStatusTable');
$(document).on({
	ajaxStart: function() { console.log('ajaxxxxxxxxxxxxxxx starteddddddddddddd');
	
	totalTable.addClass("loading");    
	},
    ajaxStop: function() { 
    	console.log('ajaxxxxxxxxxxxxxxx stopped');
    	var size=$('.overViewStatusTable table tbody tr td:nth-child(1)').length;
		if(size>=1){
			for (var i =1; i <= size; i++) {
			var port=	$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').text();
			console.log(port);
			if(port==='DIGITAL'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#8000FF");
			}
			else if(port==='STORES'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#C00038");
			}
			else if(port==='ENTERPRISE APPLICATION'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#37c0f6");
			}
			else if(port==='GFS'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#12327e");
			}
			else if(port==='SAP'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#7e1232");
			} else if(port==='SUPPLY CHAIN'){
				$('.overViewStatusTable table tbody tr:nth-child('+i+') td:nth-child(1)').css("color", "#328332");
			} 
			}
		}
    	totalTable.removeClass("loading"); 
    	$(".executionStatus tr td:nth-child(1)").css("text-align", "left");
    	
    }   
});

$('.reportJpg').click(function(){
	$('#container1').highcharts().createCanvas();
});

});
function captureTablesAsImage() {
var performanceKeys='';
		var statusView;
		var summary;
		var riskAndIssues;
		var executionStatus;
		var defectStatus;
		var rootCauseStatus;
		var portalUpdatedOn;
		html2canvas($("#portalUpdatedOn"), {
			onrendered: function(canvas) {
				portalUpdatedOn = canvas.toDataURL("image/png");  
	        }
		});
		html2canvas($("#performanceKeys"), {
			onrendered: function(canvas) {
				performanceKeys = canvas.toDataURL("image/png");  
	        }
		});
		html2canvas($("#statusView"), {
			onrendered: function(canvas) {
				statusView = canvas.toDataURL("image/png"); 
			}
		});
		html2canvas($("#summary"), {
			onrendered: function(canvas) {
				summary = canvas.toDataURL("image/png"); 
			}
		});
		html2canvas($("#riskAndIssues"), {
			onrendered: function(canvas) {
				riskAndIssues = canvas.toDataURL("image/png"); 
			}
		});
		html2canvas($("#executionStatus"), {
			onrendered: function(canvas) {
				executionStatus = canvas.toDataURL("image/png"); 
			}
		});
		html2canvas($("#defectStatus"), {
			onrendered: function(canvas) {
				defectStatus = canvas.toDataURL("image/png"); 
			}
		});
		html2canvas($("#rootCauseStatus"), {
			onrendered: function(canvas) {
				rootCauseStatus = canvas.toDataURL("image/png"); 
			}
		});

	Highcharts.Chart.prototype.createCanvas = function (divId) {
    	 $('.hiddenDiv .images').remove();
        var svg = this.getSVG(), 
	canvas = document.createElement('canvas');
     if (canvas.getContext && canvas.getContext('2d')) {
         canvg(canvas, svg);
         var image = canvas.toDataURL("image/png");
         $('.hiddenDiv').append('<img class="images" src='+portalUpdatedOn+'>');
         $('.hiddenDiv').append('<img class="images" src='+performanceKeys+'>');
		$('.hiddenDiv').append('<img class="images" src='+'"'+statusView+'">');
		$('.hiddenDiv').append('<img class="images" src='+'"'+summary+'">');
		$('.hiddenDiv').append('<img class="images" src='+'"'+riskAndIssues+'">');
		$('.hiddenDiv').append('<img class="images" src='+'"'+executionStatus+'">');
		$('.hiddenDiv').append('<img class="images" src='+'"'+defectStatus+'">');
		/* $('.hiddenDiv').append('<img class="images" src='+'"'+rootCauseStatus+'">'); */
		
		$('.hiddenDiv').append('<div class="col-md-7 rootCauseStatus images" id="rootCauseStatus" style="float:right; height:70% ! important;">	<table class="table table-striped table-bordered">'+
		    '<thead> <tr> <th colSpan="6"> ROOT CAUSE ANALYSIS </th> </tr> </thead> <tbody> <tr> <td> <img class="images" src='+'"'+image+'"></td>'+
		    '</tr> </tbody> </table> </div>');
		/* $('.hiddenDiv').append('<img class="images" src='+'"'+image+'">'); */
		
		html2canvas($(".hiddenDiv"), {
	        onrendered: function(canvas1) {
	         var table9 = canvas1.toDataURL("image/png"); 
	         $('.hiddenDiv .images').remove();
	         window.open(table9);
	        }
	    });
     }else {
         alert ("Your browser doesn't support this feature, please use a modern browser");
     }
 }
};
</script>
<style>
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
</style>
<style>
/* div.dataTables_paginate ul.pagination {
     display: flex ! important;
         float: right ! important;
}
#footer {
   position:fixed;
   left:0px;
   bottom:48px;
   height:30px;
   width:100%;
   background:#999;
} */
/* Start by setting display:none to make this hidden.
   Then we position it in relation to the viewport window
   with position:fixed. Width, height, top and left speak
   speak for themselves. Background we set to 80% white with
   our animation centered, and no-repeating */
.modal {
    display:    none;
    position:   fixed;
    z-index:    1000;
    top:        0;
    left:       0;
    height:     100%;
    width:      100%;
    background: rgba( 255, 255, 255, .8 ) 
                url('http://sampsonresume.com/labs/pIkfp.gif') 
                50% 50% 
                no-repeat;
}

/* When the body has the loading class, we turn
   the scrollbar off with overflow:hidden */
.detailedViewStatusTable.loading {
    overflow: hidden;   
}

/* Anytime the body has the loading class, our
   modal element will be visible */
.detailedViewStatusTable.loading .modal {
    display: block;
}
/** **/

</style>
</head>
<body ng-app="materialApp" ng-controller="AppCtrl">
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
	<div class="col-sm-2 col-md-2 col-lg-2" id="sideMenuID">
	 <div class="sideBar">
    <ul class="metismenu" id="menu">
    <li class="pageNameMenu sideMenu">
		<a href="dailyStatusReportOverall.do">
			<img src="images/icons/Reports Menu Icon Black.png" class="img2">
			Daily Status Report
		</a>
	</li>
    </ul>
    </div> 
		</div>
		</div>
		<!-- </div>should close div here -->
    <div class="col-sm-10 col-md-10 col-lg-10" id="searchProjectID">
				<div class="selectionArea">
					<div class="row1">
					<div class="col-sm-2 col-md-2 col-lg-2">
						<label for="sel1" class="control-label">Portfolio</label>
					</div>
						<div class="col-sm-3 col-md-3 col-lg-3">
							<label for="sel1">Project</label>
						</div>
					</div>
					<div class="row2">
					<div class="col-sm-2 col-md-2 col-lg-2">
					    <select class="form-control portfolioSelect" id="sel1" style="margin-top: -3px;">
					    	<option value="">-select-</option>
					   		<option>ALL</option>
					    	<option>DIGITAL</option>
							<option>ENTERPRISE APPLICATION</option>
							<option>GFS</option>
							<option>HCM</option>
							<option>MASTERS</option>
							<option>MOR</option>
							<option>SAP</option>
							<option>SUPPLY CHAIN</option>
							<option>INFRASTRUCTURE</option>
						</select>
						</div>
						<div class="col-sm-3 col-md-3 col-lg-3">
							      <select class="form-control projectSelect" id="sel4" style="margin-top: -3px;">
							      </select>
						</div>
      					<div class="col-sm-4 col-md-4 col-lg-4">
						<div class="col-sm-5 col-md-5 col-lg-5" style="margin-right:10%;">
							<button type="button" class="btn btn-primary submitBtn" style="margin-top: -17px;">SUBMIT</button>
						</div>
						<div class="col-sm-5 col-md-5 col-lg-5" style="margin-left:-10%;">
							<button type="button" class="btn btn-primary reset" style="margin-top: -17px;">RESET</button>
						</div>
						</div>
						<div class="col-sm-3 col-md-3 col-lg-3" style="margin-bottom: 2% ! important;"><img class="reportJpg" src="images/quizReportJpg.png" style="float: right; display:none; margin-left : 50%; margin-top: -12px;"></img>
							</div>
						</div>
				</div>
				</div>
				</div>
				<!-- </div> closed div here -->
				<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="col-sm-12 col-md-12 col-lg-12 generationArea" id="generationArea" style="padding-bottom: 50px;">
						<!-- <h3>PROJECT DAILY STATUS REPORT</h3> -->	
						<div class="col-sm-4 col-md-4 col-lg-4 batchRunDate"  id="portalUpdatedOn" style="margin-left:2%; display:none;">
							<span style="font-weight: bold; font-size: 15px;">  Portal Updated On: <label id="batchRunDate"></label></span>  	
						</div>
						<div class="col-sm-12 col-md-12 col-lg-12 overViewStatusTable">
						
						
							<table class="table table-striped table-bordered" style="background-color: rgb(242,242,242);">
								    <thead>
								      <tr>
								        <th style="width: 250px ! important;">PORTFOLIO</th>
								        <!-- <th>BUSINESS UNIT</th> -->
								        <th>PROJECT NAME</th>
								         
								         <th style="width: 187px ! important;">PROJECT START DATE</th>
								        <!-- <th>TEST PHASE</th> -->
								        <th style="width: 150px ! important;">PROJECT END DATE</th>
								        <!-- <th>% OF COMPLETION</th> -->
								        <th style="width: 156px ! important;">TEST STATUS</th>
								      </tr>
								    </thead>
								    <tbody>
								     
								      
								    </tbody>
								  </table>
						</div>
						<div class="detailedViewStatusTable" id="detailedViewStatusTable">
						<!-- <md-button class="md-raised md-primary" id="updateAll" style = "margin-left:15px;">{{title1}}</md-button> -->
						
						<div class="col-sm-12 col-md-12 col-lg-12 performanceKeys" id="performanceKeys">
								<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th colspan="12">
								    		PERFORMANCE KEYS
								    	</th>
								    	<th colspan="2">
								    		TEST STATUS
								    	</th>
								    </tr>
								      <tr>
										<th colspan="2" style="width:11%">Scope<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%">Cost<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%">Schedule<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%">QA Resources<div class="colorPallet"></div></th>
	                                	<th style="display:none;">Benefits Realization<div class="colorPallet"></div></th>
		                                <th colspan="2" style="width:11%">Risks<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%">Issues<div class="colorPallet"></div></th>
	                                    <th style="display:none;">Stakeholders<div class="colorPallet"></div></th>
	                                    <th colspan="2" style="width:11%; text-align: center;">Status<div class="colorPallet"></div></th>
                                     
								      </tr>
								    </thead>
								   </table>
							</div>
						
							<div class="col-sm-12 col-md-12 col-lg-12 statusView" id="statusView">
								<table class="table table-striped table-bordered">
								    <thead>
								      <tr>
								        <th>PORTFOLIO</th>
								        <!-- <th>BUSINESS UNIT</th> -->
								        <th>PROJECT NAME</th>
								        <th>TEST PHASE/RELEASES</th>
								        <th>START DATE</th>
								        <th>END DATE</th>
								        <th>PASS %</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								        <td class="verticalAlign">Enterprise Application</td>
								        <!-- <td></td> -->
								        <td>Project 1</td>
								        <td>Plan</td>
								        <td>SIT</td>
								        <td>OCT'15</td>
								        <td></td>
								         <!-- <td class="green">Green</td> -->
								      </tr>
								      </tbody>
								   </table>
							</div>
							
							<div class="col-sm-12 col-md-12 col-lg-12 summary" id="summary">
								<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th class ="bottom-aligned-text" colSpan="10" style="padding: 1px;">
								    	SUMMARY
							    		<span style="float:right;">  MasterCraft Updated On: <label id="lastUpdatedDate"></label></span>  	
								    	</th>
								    </tr>
								    </thead>
								    <tbody>
								      <tr>
								       	<td></td>
								       
								      </tr>
								      <tr>
								       	<td></td>
								      
								      </tr>
								      
								      
								      </tbody>
								   </table>
							</div>
							<div class="col-sm-12 col-md-12 col-lg-12 riskAndIssues" id="riskAndIssues">
								<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th colSpan="8">
								    		RISK & ISSUES
								    	</th>
								    </tr>
								    </thead>
								    <tbody>
								      <tr>
								       	<td></td>
								       
								      </tr>
								 
								      </tbody>
								   </table>
							</div>
							
							<div class="col-sm-12 col-md-12 col-lg-12 executionStatus" id="executionStatus">
								<table class="table table-striped table-bordered" style="width:100% ! important;">
								    <thead>
								    <tr>
								    	<th colSpan="12">
								    		EXECUTION STATUS
								    	</th>
								    </tr>
								    <tr>
								        <th align="left">Test Phase/Test Cycle</th>
								        <th>Pass</th>
								        <th>Fail</th>
								        <th>Blocked</th>
								         <th>In Progress</th>
								        <th>No Run</th>
								        <th>NA</th>
								        <th>Total</th>
								        <th>Excepted Scenarios Count</th>
								        <th>Actual Scenarios Count</th>
										<th>PASS %</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								       	<td align="left">Suite1</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								      	 <td></td>
								      	 <td></td>
								         <td></td>
								         <td></td>
								         <td></td>
										  <td></td>
								      </tr>
								      <tr>
								       	<td align="left">Suite2</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								      	 <td></td>
								      	 <td></td>
								         <td></td>
								          <td></td>
								           <td></td>
										    <td></td>
								      </tr>
								       <tr>
								       	<td align="left">Suite3</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								      	 <td></td>
								      	 <td></td>
								         <td></td>
								          <td></td>
								           <td></td>
										    <td></td>
								      </tr>
								      </tbody>
								   </table>
							</div>
							<div>
							<div class="col-sm-5 col-md-5 col-lg-5 defectStatus" id="defectStatus">
									<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th colSpan="6">
								    		PROJECT DEFECT STATUS
								    	</th>
								    </tr>
								    <tr>
								        <th>Status</th>
								        <th>Sev1</th>
								        <th>Sev2</th>
								        <th>Sev3</th>
								         <th>Sev4</th>
								       <th>Total</th>
								      </tr>
								    </thead>
								    <tbody>
								    <!-- <tr>
								       	<td>New</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								        <td></td>
								      </tr> -->
								      <tr>
								       	<td>Open</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								        <td></td>
								      </tr>
								      <tr>
								       	<td>In Progress</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								        <td></td>
								      </tr>
								       <tr>
								       	<td>Fixed</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								        <td></td>
								      </tr>
								      <tr>
								       	<td>Retest</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								        <td></td>
								      </tr>
								      <tr>
								       	<td>Reopen</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								        <td></td>
								      </tr>
								      <tr>
								       	<td>Closed</td>
								         <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								        <td></td>
								      </tr>
								      </tbody>
								   </table>
							</div>
							<div class="col-sm-7 col-md-7 col-lg-7 rootCauseStatus" id="rootCauseStatus">
								<table class="table table-striped table-bordered">
								    <thead>
								    <tr>
								    	<th colSpan="6">
								    		PROJECT ROOT CAUSE ANALYSIS [Defects from all Phases]
								    	</th>
								    </tr>
								    </thead>
								    <tbody>
								    <tr>
								    <td>
								    	<div id="container1"></div>
								    </td>
								    </tr>
								    </tbody>
								  </table>
								  
							</div>
							</div>
							<div class="modal"></div>
						</div>									
				</div>
			<!-- </div> -->
		</div>
	
	
	</form>
	</div>
<div id="DSRfooter">
	<section class="footerSection" id="footer">
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
	</section>
	<div class="hiddenDiv"></div>
	</div>
</div>
</body>
<script src='js/css3-animate-it.js'></script>
</html>
