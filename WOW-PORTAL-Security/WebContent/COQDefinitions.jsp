<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COQ Definitions</title> 
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
   <div style="background-color: white">
        <img src="images/CoQImages/coqDefinitionTopImage.png" style="display: block; margin-left: auto; margin-right: auto; margin-top: 9%;" class="coqDefinitionTopImage">
		<img src="images/CoQImages/coqDefinitionBottomImage.png" style="display: block; margin-left: auto; margin-right: auto;margin-top: 2%; margin-bottom: 2%" class="coqDefinitionBottomImage">
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
