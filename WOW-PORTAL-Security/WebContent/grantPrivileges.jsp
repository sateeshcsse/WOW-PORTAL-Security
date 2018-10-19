<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
 <link rel="stylesheet" type="text/css" href="<c:url value="/styles/angular-toastr.css"/>" />
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="<c:url value="/js/angular-1.4.7/angular.js"/>"></script>
<script src="<c:url value="/js/angular-toastr.js"/>"></script>
<script src="<c:url value="/js/angular-toastr.tpls.min.js"/>"></script>
<script type="text/javascript">

$(document).ready(function(){
	
});
</script>
<script type="text/javascript">
	var reportsApp= angular.module('addStatusReport',['toastr']);
	reportsApp.controller('reportsController',function($scope,$http,toastr){
		$scope.defaultEmailValue = {title: '@woolworths.com.au'}
		$scope.resourceAdmin = [];
		$scope.resource = function(role) {
			if($scope.resourceAdmin.indexOf(role)>-1){
				$scope.resourceAdmin.splice($scope.resourceAdmin.indexOf(role), 1);
			} else {
				$scope.resourceAdmin.push(role);				
			}
		}
		$scope.grantPrivileges= function(userEmail) {
			
		/* 	if($scope.resourceAdmin.length===0) {
				toastr.error('Select atleast one privilege', 'User Privilege', {
	        		  closeButton: true
	        		});
				return;
			} */
	        $http({
	            method: 'POST',
	            url: 'updateroles.do',
	            headers: {
	                'Content-Type': 'application/json; charset=UTF-8'
	            },
	            data: userEmail+'#'+$scope.resourceAdmin.toString()
	      
	        }).then(function(response) {
               
	        	toastr.success('Successfully granted privileges', 'User Privilege', {
	        		  closeButton: true
	        		});

            }).catch(function() {
            	toastr.error('Username does not exist', 'User Privilege', {
	        		  closeButton: true
        		});
            });
	     
		}
		
		
	});
</script>
<style>
.reportJpg {
	    position: absolute;
    width: 27px;
    left: 5px;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 40%;
  margin: 0 auto 0px;
  padding: 45px;
  text-align: center;
  
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: white;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 8px;
  box-sizing: border-box;
  font-size: 14px;
  border: 2px solid #f2f2f2
}
#userNameImage {
	background: url(images/icons/userName.png) no-repeat scroll 1px 1px;
   background-size: 20px;
    background-position-y: 8px;
    background-position-x: 8px;
    padding-left: 51px;
}
#pwdImage {
	background: url(images/icons/pwd.png) no-repeat scroll 1px 1px;
	background-size: 20px;
    background-position-y: 8px;
    background-position-x: 8px;
    padding-left: 51px;
}
.submitBtn {
    margin-left: 0px !important;
}
.pageName label {
	margin-top: 2%;
}
</style>
</head>

<body ng-app="addStatusReport" ng-controller="reportsController">
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
				<div class="generationArea" id="generationArea">
				<div class="pageName">
                        <div class="col-sm-12" style="letter-spacing: 2px;"> <label> USER PRIVILEGES </label> </div>
                        </div>
						<div class="login-page" style="margin-top: 5%;">
  <div class="form" style="background-color: white;">
    <form class="login-form">
    <div>
    
      <input style="width: 90%;" type="text" placeholder="WoW e-mail id" ng-value="defaultEmailValue.title" id="userNameImage" ng-model="userEmail" autofocus />
      </div>
       </form>
  </div>
   	<div style="margin-left: 33.5%;">
       <!-- <div class="col-sm-12" > <label style="font-size: large; font-weight: bold; text-align: center; margin-left: 14%; margin-top: -50px;"> Funtionality wise access</label> </div> -->
			 <ul style="display: inline-flex; list-style: none;">
            <li><span style="font-weight: bold; color: #484848;">RESOURCES</span>
            <ul style="list-style: none;">
                    <li style="margin: 0px 54px 3px 0px; padding-top: 3%;"><input type="checkbox" name="view" ng-click="resource('ROLE_RESOURCEADMIN')" ng-value="RESOURCE_ADMIN" ng-model="RES_ADMIN"><label style="margin-left: 5px; color: #484848;">Resource Admin</label></li>
                </ul>
            </li>
            <li><span style="font-weight: bold; color: #484848;">COQ</span>
                <ul style="list-style: none;">
                    <li style="margin: 0px 54px 3px 0px; padding-top: 3%;"><input type="checkbox" name="view" ng-click="resource('ROLE_COQADMIN')" ng-value="COQ_ADMIN" ng-model="COQ_ADMIN"><label style="margin-left: 5px; color: #484848;">COQ Admin</label></li>
                </ul>
            </li>
            <li><span style="font-weight: bold; color: #484848;">SLA LETRICS</span>
                <ul style="list-style: none;">
                    <li style="margin: 0px 54px 3px 0px; padding-top: 3%;"><input type="checkbox" name="view" ng-click="resource('ROLE_SLAADMIN')" ng-value="ROLE_SLAADMIN" ng-model="ROLE_SLAADMIN"><label style="margin-left: 5px; color: #484848;">SLA Admin</label></li>
                </ul>
            </li>
        </ul>
        
        </div>
        
        <div style="float:right; margin-right:35%">
			<input type="button" value="SUBMIT" style="background-color: #8AC759;" class="btn btn-primary submitBtn" ng-click="grantPrivileges(userEmail)"/>
		</div>
						
				</div></div>
			
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
