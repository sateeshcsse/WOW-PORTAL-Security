<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Status Defaults Report</title> 
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
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	function backgroundColor(){
		$('.table.dataTable tbody tr td:last-child').each(function(){
			
			var value=parseInt($(this).text());
			
			if(value>2){
				$(this).css("background-color" ,"red");
				
			}
			else if(value<=2 && value >1 ){
				$(this).css("background-color" ,"#FFA829");
			}
			else{
				$(this).css("background-color" ,"green");
			}
			
			
			
			});
	}
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
	
	var overViewStatusTable=$('.overViewStatusTable table').dataTable();
	$.ajax({
		type:'get',
		url:'defaultersReport.do',
		success:function(data){
			$.each(JSON.parse(data),function(key,value){
				if(key=="listWowmain")
				{
				overViewStatusTable.fnDestroy();
				overViewStatusTable=$('.overViewStatusTable table').dataTable( {
				    "aLengthMenu": [[10, 20, 30, 40, 50, -1], [10, 20, 30, 40, 50, "All"]],
				    "pageLength": 30,
				    "data":value
				    } );
				}
			});
			
			backgroundColor();
			colorLables();
		}
	});
	
	$('ul li.paginate_button a').on('click',function(){
		setTimeout(
				  function() 
				  {
					  alert('$$$');
				  }, 0);
	});
	function colorLables(){
		var size=$('.overViewStatusTable table tbody tr td:nth-child(1)').length;
		console.log('sizeeee'+size);
		if(size>2){
			console.log('sizeeee'+size);
			textcolors(size);
		}
	}
	$(overViewStatusTable).on('page.dt',function(){
		setTimeout(
				  function() 
				  {
					  colorLables();
					  backgroundColor();
				  }, 0);
	});
		$('.reportJpg').click(function(){
		html2canvas($("#overViewStatusTableId"), {
			onrendered: function(canvas) {
				var myImage = canvas.toDataURL("image/jpeg");
			    window.open(myImage);
			}
		});
});
});



</script>
<style>
.reportJpg {
	    position: absolute;
    width: 27px;
    left: 5px;
}
</style>
</head>

<body >
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
		<!-- </div>should close div here -->
		<div class="pageName">
                        <div class="col-sm-10"> <label> DSR - DEFAULTER REPORT</label> </div>
                        <div class="col-sm-2" style="margin-bottom: 2% ! important;"><img class="reportJpg" src="images/quizReportJpg.png" style="float: right; display: block; margin-left: 78%; margin-top: 2%; cursor: pointer;"></img></div>
                        </div>
				<div class="generationArea" id="generationArea">
						<div class="col-md-12 overViewStatusTable">
							<table class="table table-striped table-bordered" id = "overViewStatusTableId" style="background-color: rgb(242,242,242);">
								    <thead>
								      <tr>
								        <th style="width: 250px ! important;">PORTFOLIO</th>
								        <!-- <th>BUSINESS UNIT</th> -->
								        <th>PROJECT NAME</th>
								         
								         <th style="width: 187px ! important;">Portal Updated On</th>
								        <!-- <th>TEST PHASE</th> -->
								        <th style="width: 200px ! important;">Master Craft Updated On</th>
								        <!-- <th>% OF COMPLETION</th> -->
								        <th style="width: 156px ! important;">Default for</th>
								      </tr>
								    </thead>
								    <tbody>
								     
								      
								    </tbody>
								  </table>
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
