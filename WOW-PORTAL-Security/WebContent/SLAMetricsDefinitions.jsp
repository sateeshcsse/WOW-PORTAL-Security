<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SLA Metrics Definitions</title> 
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
<script src="<c:url value="/js/angular-toastr.js"/>"></script>
<script src="<c:url value="/js/angular-toastr.tpls.min.js"/>"></script>

<script>
$(document).ready(function(){
	
});

</script>
<script>

</script>
<style>

</style>
</head>
<body ng-app="materialApp" ng-controller="AppCtrl" >
<div class="container-fluid" style="background-color: white">
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
   <div class="col-sm-12 col-md-12 col-lg-12 overViewStatusTable1" style="margin-top: 12%;">
        <table class="table table-bordered" id = "overViewStatusTableId" style = "width: 70%; margin-left: 20%; background-color: rgb(242,242,242);">
				<thead>
					<tr>
						<th style="font-weight: bold;">METRICS</th>
						<th style="font-weight: bold;">FORMULA</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="vertical-align: middle; text-align: center ! important;">DEFECT SLIPPAGE</td>
						<td style="text-align: left ! important;">[1-(No. of defects in SIT (Excluding Cancelled Defects) / Total no. of defects (SIT+UAT+PROD) (Excluding Cancelled Defects))] * 100</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center ! important;">DEFECT REJECTION</td>
						<td style="text-align: left ! important;">[Invalid defects]/Total no. of defects)*100</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center ! important;">FAILURE RATE</td>
						<td style="text-align: left ! important;">((Total no. of defects - (invalid + cancelled defects))/Total no. of test cases)*100</td>
						
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center ! important;">EFFORT SLIPPAGE</td>
						<td style="text-align: left ! important;">((Actual effort - Planned effort)/Planned effort)*100</td>
					</tr>
					<tr>
						<td style="vertical-align: middle; text-align: center ! important;">SCHEDULE SLIPPAGE</td>
						<td style="text-align: left ! important;">((Actual duration - Planned duration)/Planned duration)*100<br>
						
						</td>
					</tr>
					
					<tr>
					<td colspan="2">
					<p style="text-align: center ! important;">Invalid or Rejected defects = No. of Defects caused due to Test Script + Data Problem</p>
					<p style="text-align: center ! important;">Planned Duration=Network days between planned start date & end date</p>
					<p style="text-align: center ! important;">Actual Duration=Planned duration + slippage in start date + slippage in end date</p>
					<p style="text-align: center ! important;">Start date and End dates should be a week day.</p>
					</td>
					</tr>
					
					
				</tbody>
				
			</table>
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
