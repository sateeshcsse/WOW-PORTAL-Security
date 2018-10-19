<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SLA Metrics Report</title> 
<!-- <link rel="shortcut icon" href="images/logo/favicon.ico" type="image/x-icon" /> -->
<link rel="stylesheet" href="styles/animations.css">
<link href="styles/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="styles/skeleton.css" rel="stylesheet" type="text/css" />
<link href="styles/jqueryUI.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="styles/Home.css">
<link rel="stylesheet" href="styles/metisMenu.min.css">
<link rel="stylesheet" href="styles/sideBar.css">
<link rel="stylesheet" href="styles/reportArea.css">
<link rel="stylesheet" href="styles/dataTables.bootstrap.css">
<link rel="stylesheet" href="styles/ngDialog.css">
<link rel="stylesheet" href="styles/ngDialog-theme-default.css">
<link rel="stylesheet" href="styles/xeditable.css">

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.scrollify.js"></script>

<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.js"></script>


<script src="js/angular-1.4.7/angular.js" ></script>
<script src="js/angular-1.4.7/angular-animate.js" ></script>
<script type="text/javascript" src="js/xeditable.js"></script>

<script> 
$(document).ready(function(){

});
</script>
<script>
var app = angular.module("app", ["xeditable", "ngMockE2E"]);

app.run(function(editableOptions) {
  editableOptions.theme = 'bs3';
});

app.controller('Ctrl', function($scope, $filter, $http) {
 $scope.users = [
    {id: 1, name: 'awesome user1', status: 2, group: 4, groupName: 'admin'},
    {id: 2, name: 'awesome user2', status: undefined, group: 3, groupName: 'vip'},
    {id: 3, name: 'awesome user3', status: 2, group: null}
  ]; 

  $scope.statuses = [
    {value: 1, text: 'status1'},
    {value: 2, text: 'status2'},
    {value: 3, text: 'status3'},
    {value: 4, text: 'status4'}
  ]; 

  $scope.groups = [];
  $scope.loadGroups = function() {
    return $scope.groups.length ? null : $http.get('/groups').success(function(data) {
      $scope.groups = data;
    });
  };

  $scope.showGroup = function(user) {
    if(user.group && $scope.groups.length) {
      var selected = $filter('filter')($scope.groups, {id: user.group});
      return selected.length ? selected[0].text : 'Not set';
    } else {
      return user.groupName || 'Not set';
    }
  };

  $scope.showStatus = function(user) {
    var selected = [];
    if(user.status) {
      selected = $filter('filter')($scope.statuses, {value: user.status});
    }
    return selected.length ? selected[0].text : 'Not set';
  };

  $scope.checkName = function(data, id) {
    if (id === 2 && data !== 'awesome') {
      return "Username 2 should be `awesome`";
    }
  };

  $scope.saveUser = function(data, id) {
    //$scope.user not updated yet
    angular.extend(data, {id: id});
    return $http.post('/saveUser', data);
  };

  // remove user
  $scope.removeUser = function(index) {
    $scope.users.splice(index, 1);
  };

  // add user
  $scope.addUser = function() {
    $scope.inserted = {
      id: $scope.users.length+1,
      name: '',
      status: null,
      group: null 
    };
    $scope.users.push($scope.inserted);
  };
});

// --------------- mock $http requests ----------------------
app.run(function($httpBackend) {
  $httpBackend.whenGET('/groups').respond([
    {id: 1, text: 'user'},
    {id: 2, text: 'customer'},
    {id: 3, text: 'vip'},
    {id: 4, text: 'admin'}
  ]);
    
  $httpBackend.whenPOST(/\/saveUser/).respond(function(method, url, data) {
    data = angular.fromJson(data);
    return [200, {status: 'ok'}];
  });
});


</script>

<style>
.reportJpg {
	    position: absolute;
    width: 27px;
    left: 5px;
}
#testingInput2 {
	text-align: center ! important;
	background-color: rgb(242,242,242);
    height: 100%;
    width:10%;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}
.leftAlign {
	text-align : left;
	margin: 0 0 0px;
}
.line-legend-text {
	font-size: larger;
    font-weight: bold;
}
.applyGreen {
	background-color: green;
}
.applyRed {
	background-color: rgb(255,79,79);
}

</style>

</head>

<body>
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
                        <div class="col-sm-10 col-md-10 col-lg-10"> <label style="margin-left: 25%;"> VM UTILISATION DETAILS </label> </div>
                        <div style="float:right;">
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-primary submitBtn" style="margin-top: 4px;" ng-click="addRow()">Add</button>
                                </div>
                                </div>
                        </div>
				<div class="generationArea" id="generationArea">
						<div class="col-sm-12 col-md-12 col-lg-12 overViewStatusTable">
							<div ng-app="app" ng-controller="Ctrl">
   <table class="table table-bordered table-hover table-condensed">
    <tr style="font-weight: bold">
      <td style="width:35%">Name</td>
      <td style="width:20%">Status</td>
      <td style="width:20%">Group</td>
      <td style="width:25%">Edit</td>
    </tr>
    <tr ng-repeat="user in users">
      <td>
        <!-- editable username (text with validation) -->
        <span editable-text="user.name" e-name="name" e-form="rowform" onbeforesave="checkName($data, user.id)" e-required>
          {{ user.name || 'empty' }}
        </span>
      </td>
      <td>
        <!-- editable status (select-local) -->
        <span editable-select="user.status" e-name="status" e-form="rowform" e-ng-options="s.value as s.text for s in statuses">
          {{ showStatus(user) }}
        </span>
      </td>
      <td>
        <!-- editable group (select-remote) -->
        <span editable-select="user.group" e-name="group" onshow="loadGroups()" e-form="rowform" e-ng-options="g.id as g.text for g in groups">
          {{ showGroup(user) }}
        </span>
      </td>
      <td style="white-space: nowrap">
        <!-- form -->
        <form editable-form name="rowform" onbeforesave="saveUser($data, user.id)" ng-show="rowform.$visible" class="form-buttons form-inline" shown="inserted == user">
          <button type="submit" ng-disabled="rowform.$waiting" class="btn btn-primary">
            save
          </button>
          <button type="button" ng-disabled="rowform.$waiting" ng-click="rowform.$cancel()" class="btn btn-default">
            cancel
          </button>
        </form>
        <div class="buttons" ng-show="!rowform.$visible">
          <button class="btn btn-primary" ng-click="rowform.$show()">edit</button>
          <button class="btn btn-danger" ng-click="removeUser($index)">del</button>
        </div>  
      </td>
    </tr>
  </table>

  <button class="btn btn-default" ng-click="addUser()">Add row</button>
</div>
						</div>					
				</div>
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
