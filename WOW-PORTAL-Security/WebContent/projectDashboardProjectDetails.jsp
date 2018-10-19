<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Project Details</title> 
<!-- <link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon" /> -->
<link rel="stylesheet" href="styles/animations.css">
<link href="styles/jqueryUI.css" rel="stylesheet" type="text/css" />
<link href="styles/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="styles/skeleton.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="styles/Home.css">
<link rel="stylesheet" href="styles/metisMenu.min.css">
<link rel="stylesheet" href="styles/sideBar.css">
<link rel="stylesheet" href="styles/reportArea.css">


<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.scrollify.js"></script>
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<script>
$(document).ready(function(){
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
		var portfolioSelect=$('.portfolioSelect');
		var busUnitSelect=$('.busUnitSelect');
		var testPhaseSelect=$('.testPhaseSelect');
		var projectPhaseSelect=$('.projectPhaseSelect');
		var projectSelect=$('.projectSelect');
		var goLiveDate=$('#goLiveDate');

		   $('.details table tbody tr:nth-child(1) td').css('background-color','#00B050');
		
		$('select').on('change',function(){
			$('#successLabel').hide();
		});
		$('.busUnitSelect').prop('disabled',true);
		$.each($.parseJSON('${projectsList}'),function(key,value){
			if(key=="projectsList")
				{
				$('.projectSelect').empty().append($("<option>").val("").text("-select-"));
				$.each(value,function(key,value){
					$('.projectSelect').append($("<option>").val(value).text(value));
				});
				}
		});
		$('.portfolioSelect').on('change',function(){
			if($(this).val()=="MOR")
				$('.busUnitSelect').prop('disabled',false);
			else
				$('.busUnitSelect').prop('disabled',true);
		});
		projectSelect.on('change',function(){
// 			$('select:not(.projectSelect),input[type=text]').val("");
			$('.selectionArea select:not(.projectSelect),input[type=text]').val("");
			$('.details select').val('green').parent().css('background-color','#00B050 ! important');
			if($(this).val()!="")
			{
			$.ajax({
				type:'post',
				url:'getProjectDetails.do',
				data:'project='+projectSelect.val(),
				success:function(jsonStr)
				{
					$.each($.parseJSON(jsonStr),function(key,value){
						if(key=="projMap")
							{
							$.each(value,function(key,value){
								if(key=="portfolio")
									portfolioSelect.val(value);
								else if(key=="busUnit")
									busUnitSelect.val(value);
								else if(key=="projPhase")
									projectPhaseSelect.val(value);
								else if(key=="testPhase")
									testPhaseSelect.val(value);
								else if(key=="goLiveDate")
									$('#goLiveDate').val(value);
								else if(key=="summary")
									{
									$.each(value.split(";"),function(key,value){
										$('.summary tbody tr:nth-child('+(key+1)+')').find('input').val(value);
									});
									}
								else if(key=="performanceKeys")
									{
									$.each(value.split(";"),function(key,value){
										$('.details select').eq(key).val(value);
									});
									}
							});
							$('.details select').each(function(){
								if($(this).val()=="green"){
									$(this).parent().css('background-color','#00B050 ! important');
								}
								else if($(this).val()=="red"){
									$(this).parent().css('background-color','#FF0000 ! important');
								}
								else if($(this).val()=="amber"){
									$(this).parent().css('background-color','#FFA829 ! important');
								}
							});
							}
					});
				}
			});
		}
		});
		$('.reset').on('click',function(){
			$('.selectionArea select,input[type=text]').val("");
			$('.details select').val('green').parent().css('background-color','#00B050 ! important');
			
			
			
		});
		$('.submit').on('click',function(){
			var resultColor="",red=0,green=0,amber=0,colors="";
			
			$('.performanceTable select').each(function(){
				
				if($(this).val()=="red")
					red++;
				else if($(this).val()=="green")
					green++;
				else if($(this).val()=="amber")
					amber++;
				 console.log("summary***********");
				if(colors.length==0)
					colors=$(this).val();
				else
					colors=colors+";"+$(this).val();
			});
			
			 if(red>=2)
				resultColor="Red";
			 else if(red==1)
				 resultColor="amber";
			 else if(green==8 || green==7)
				resultColor="Green";
			
			else if((amber>=2 && amber<4) && green<=6)
				resultColor="amber";
			else if(amber>=4  && green<=4)
				resultColor="Red";
		    var summary="";	
		    
	                        $('.summary table tbody tr').each(function(){			
		                                 if(summary=="")			
		                                           summary=$(this).find('input').val();			
		                                  else			
		                                           summary=summary+";"+$(this).find('input').val();			
		                          });
	                       
		                           
			$.ajax({
				type:'post',
				url:'saveProjectDetails.do',
				data:'portfolio='+portfolioSelect.val()+'&busUnit='+busUnitSelect.val()+'&testPhase='+testPhaseSelect.val()+'&projectPhase='+projectPhaseSelect.val()
				+'&project='+projectSelect.val()+'&goLiveDate='+goLiveDate.val()+'&resultColor='+resultColor+'&colors='+colors+'&summary='+summary,
				success:function(jsonStr)
				{
					$.each($.parseJSON(jsonStr),function(key,value){
						if(key=="successState")
							{
							if(value=="success")
								$('#successLabel').text('Project details updated Successfully !!!').show();
							}
						
					});
				}
			
			});
		});
		$("#menu").metisMenu();

		$("#goLiveDate").datepicker({
			showOn : "button",
			buttonImage : "images/icons/calender.png",
			buttonImageOnly : true,
			dateFormat:'dd/mm/yy',
			minDate: new Date()
		});
		
		$('.homeMenu .container .col-md-8 .centeredMenu li:nth-child(1)').removeClass("active");
		$('.homeMenu .container .col-md-8 .centeredMenu li:nth-child(3)').addClass("active");
		
		$('.sideBar .dashBoardMenu .metismenu li:nth-child(3)').addClass("active");
		$('.sideBar .dashBoardMenu .metismenu li:nth-child(3) ul').addClass("in");
		$('.sideBar .dashBoardMenu .metismenu li:nth-child(3) ul li:nth-child(1) a').css('color','#484848');
		
		$('.details table tbody tr:nth-child(1) td').css('background-color','#00B050');
		$('.details table tbody tr:nth-child(1) td select').change(function(){
			var selectedValue=$(this).val();
// 			alert("selectedValue"+selectedValue);
			if(selectedValue=="green"){
				$(this).parent().css('background-color','#00B050 ! important');
			}
			else if(selectedValue=="red"){
				$(this).parent().css('background-color','#FF0000 ! important');
			}
			else if(selectedValue=="amber"){
				$(this).parent().css('background-color','#FFA829 ! important');
			}
		});
		
});
</script>
<style>
.selectionArea {
     background-color: transparent; 
}
body{
/* overflow:hidden; */
}
</style>
</head>
<body>
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
	<div class="workArea container-fluid">
	<div class="col-md-2 sideBarArea">
		<div class="sideBar"> 
			<nav class="dashBoardMenu">
				<%@include file="dashBoardMenu.jsp" %>
			</nav>
		</div>
	</div>
	<div class="col-md-10">
		<div class="reportArea">
			<div class="pageName">
				<label>PROJECT DASHBOARD</label>
			</div>
			<div class="breadCrums">
				<ul class="breadcrumb">
   					 <li><a href="#">HOME</a></li>
   					 <li><a href="#">DASHBOARD</a></li>
   					 	 <li><a href="dailyStatusReportOverall.do">PROJECT DASHBOARD</a></li>
   					  <li><a href="#">DATA</a></li>
    				<li class="active"><a href="projectDashboardProjectDetails.jsp">PROJECT DETAILS</a></li>
				</ul>
			</div>
			<div class="projectDetailsArea">
				<div class="selectionArea">
					<div class="row1">
						<div class="col-md-9">
							<div class="col-md-1">
								<label for="sel1">Project</label>
							</div>
							<div class="col-md-11">
								      <select class="form-control projectSelect" id="sel4">
								      	<option value="">-select-</option>
								        <option>PROJECT 1</option>
								        <option>PROJECT 2</option>
								        <option>PROJECT 3</option>
								        <option>PROJECT 4</option>
								        <option>PROJECT 5</option>
								        <option>PROJECT 6</option>
								      </select>
							</div>
						</div>
						<div class="col-md-3">
							<div class="col-md-3">
								<label for="sel1" class="control-label">Portfolio</label>
							</div>
							<div class="col-md-9">
								      <select class="form-control portfolioSelect" id="sel1">
								      	<option value="">-select-</option>
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
						</div>
						
					</div>
					<div class="row2">
						<div class="col-md-4">
							<div class="col-md-5">
									<label for="sel1">Business Unit</label>
							</div>
							<div class="col-md-7">
								      <select class="form-control busUnitSelect" id="sel2">
								        <option value="">-select-</option>
								        <option>DAN MURRPHYS ONLINE</option>
								        <option>WOOLWORTHS ONLINE</option>
								        <option>MASTERS ONLINE</option>
								      </select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="col-md-5">
									<label for="sel1">Project Phase</label>
							</div>
							<div class="col-md-7">
								      <select class="form-control projectPhaseSelect" id="sel3">
									        <option value="">-select-</option>
									        <option>Identify</option>
									        <option>Validate</option>
									        <option>Plan</option>
									        <option>Execute</option>
									        <option>Close</option>
									        <option>Realize</option>
								      </select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="col-md-5">
									<label for="sel1">Test Phase</label>
							</div>
							<div class="col-md-7">
								      <select class="form-control testPhaseSelect" id="sel3">
								        <option value="">-select-</option>
								        <option>SIT</option>
								        <option>UAT</option>
								        <option>PROD</option>
								      </select>
							</div>
						</div>
						
						 
					</div>
					<div class="row3">
						<div class="col-md-4">
						 	 <div class="col-md-5">
								   <label for="usr">Go Live Date</label>
							</div>
							<div class="col-md-7">
      								<input type="text" class="form-control" id="goLiveDate">
      						</div>
						</div>
					</div>
				</div>
				<div class="details col-md-12">
					<label>PERFORMANCE KEYS</label> 
					<table class="table table-striped table-bordered performanceTable">
								    <thead>
								    <!-- <tr>
								    	<th colSpan="8">
								    		PERFORMANCE KEYS
								    	</th>
								    </tr> -->
								      <tr>
								        <th>Scope</th>
								        <th>Cost</th>
								        <th>Schedule</th>
								        <th>Resources</th>
								        <th>Benefits Realization</th>
								        <th>Risks</th>
								        <th>Issues</th>
								        <th>Stakeholders</th>
								        <th>Status</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								       <td>
								       		 <select class="form-control" id="sel1">
											       	 <option class="green" value="green">GREEN</option>
											         <option class="red" value="red">RED</option>
											       	 <option class="amber" value="amber">AMBER</option>
							  				</select>
										</td>
								        <td>
								       		 <select class="form-control" id="sel2">
											       	 <option class="green" value="green">GREEN</option>
											         <option class="red" value="red">RED</option>
											       	 <option class="amber" value="amber">AMBER</option>
							  				</select>
										</td>
								       <td>
								       		 <select class="form-control" id="sel3">
											       	<option class="green" value="green">GREEN</option>
											         <option class="red" value="red">RED</option>
											       	 <option class="amber" value="amber">AMBER</option>
							  				</select>
										</td>
								       <td>
								       		 <select class="form-control" id="sel4">
											       	  <option class="green" value="green">GREEN</option>
											         <option class="red" value="red">RED</option>
											       	 <option class="amber" value="amber">AMBER</option>
							  				</select>
										</td>
								      <td>
								       		 <select class="form-control" id="sel5">
											       	<option class="green" value="green">GREEN</option>
											         <option class="red" value="red">RED</option>
											       	 <option class="amber" value="amber">AMBER</option>
							  				</select>
										</td>
								       <td>
								       		 <select class="form-control" id="sel6">
											       	 <option class="green" value="green">GREEN</option>
											         <option class="red" value="red">RED</option>
											       	 <option class="amber" value="amber">AMBER</option>
							  				</select>
										</td>
								       <td>
								       		 <select class="form-control" id="sel7">
											       	<option class="green" value="green">GREEN</option>
											         <option class="red" value="red">RED</option>
											       	 <option class="amber" value="amber">AMBER</option>
							  				</select>
										</td>
								        <td>
								       		 <select class="form-control" id="sel8">
											       	 <option class="green" value="green">GREEN</option>
											         <option class="red" value="red">RED</option>
											       	 <option class="amber" value="amber">AMBER</option>
							  				</select>
										</td>
								      </tr>
								      </tbody>
								     
								   </table>
				</div>
				<div class="col-md-12 summary">
				<label>SUMMARY</label>
								<table class="table table-striped table-bordered">
								    <!-- <thead>
								    <tr>
								    	<th colSpan="8">
								    		<p>SUMMARY</p>
								    	</th>
								    </tr>
								    </thead> -->
								    <tbody>
								      <tr>
								       	<td colSpan="8"><input type="text"> </td>
								         <!-- <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								      	 <td></td>
								      	 <td></td>
								         <td></td> -->
								      </tr>
								      <tr>
								       	 		<td colSpan="8"><input type="text"> </td>
								         <!-- <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								      	 <td></td>
								      	 <td></td>
								         <td></td> -->
								      </tr>
								      <tr>
								        		<td colSpan="8"><input type="text"> </td>
								         <!-- <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								      	 <td></td>
								      	 <td></td>
								         <td></td> -->
								      </tr>
								      <tr>
								       	 		<td colSpan="8"><input type="text"> </td>
								         <!-- <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								      	 <td></td>
								      	 <td></td>
								         <td></td> -->
								      </tr>
								      <tr>
								       	 		<td colSpan="8"><input type="text"> </td>
								         <!-- <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								      	 <td></td>
								      	 <td></td>
								         <td></td> -->
								      </tr>
								      <tr>
								       	 		<td colSpan="8"><input type="text"> </td>
								         <!-- <td></td>
								      	<td></td>
								     	 <td></td>
								        <td></td>
								      	 <td></td>
								      	 <td></td>
								         <td></td> -->
								      </tr>
								      </tbody>
								   </table>
							</div>
							<div class="col-md-12 buttonPannel">
								<button type="button" class="btn btn-primary submit">SUBMIT</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-primary">RESET</button>
								<label id="successLabel"></label>
							</div>
				</div>
			</div>
		</div>
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
