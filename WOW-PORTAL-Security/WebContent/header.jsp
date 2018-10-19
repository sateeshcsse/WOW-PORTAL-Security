<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.googleimage {
    margin: -15px -16px 1px -3px;
}
.userIcon {
float : right !important
}
#grantPrivileges, #logout {
cursor:pointer;
}
#logoutImage {
	height: 19px;
	margin-top: 5px;
}
</style>
<script>
$(document).ready(function(){
	$('#grantPrivileges').click(function() {
		window.location.href="grantPrivileges.jsp";
	});
	var userName = $("#loggedInUserName").text();
	var n = userName.indexOf("@woolworths.com.au");
	var finalUserName = userName.slice(0,n).trim();
	$("#loggedInUserName").text(finalUserName);
});
</script>
<nav class="navbar-fixed-top">
	<div class="container">
		<ul class="nav nav-pills" role="tablist">
			
			<sec:authorize access="hasAnyRole('ROLE_SUPERADMIN','ROLE_RESOURCEADMIN','ROLE_COQADMIN','ROLE_SLAADMIN')">
				<li class = "pull-right" title="Logout" id="logout" style="background-color:#ececea; margin-right: 10px;" class = "userIcon pull-right" style="background-color: #ececea">
				<form id="logout-form" action="<c:url value="/logout.do"/>" method="post">
								<sec:csrfInput/>
									<input type="image" name="submit" id="logoutImage" src="images/icons/logoutRed.png" border="0" alt="Submit" />
							</form>
							</li>
			</sec:authorize>			
			<sec:authorize access="hasRole('ROLE_SUPERADMIN')">
				<li title="User Privileges" id="grantPrivileges" style="background-color:#ececea; margin-right: 10px;" class = "userIcon pull-right" style="background-color: #ececea"><img src="images/icons/grantPrivileges.png"></li>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_COQADMIN')">
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_RESOURCEADMIN')">
				<li title="User Privileges" id="grantPrivileges" style="background-color:#ececea; margin-right: 10px;" class = "userIcon pull-right" style="background-color: #ececea"><img src="images/icons/grantPrivileges.png"></li>
			</sec:authorize>			
			
			<li style="background-color: #ececea; margin-top: 3px;" class = "userIcon pull-right" style="background-color: #ececea; margin-right: 5px;"><label style="color: #484848 ! important; margin-right: 10px; padding-top: 0px ! important; display: inline-block ! important; max-width: 100% ! important; margin-bottom: 5px ! important;"> <sec:authorize access="authenticated" var="authenticated"/>
				<c:choose>
					<c:when test="${authenticated}">
						
							
								Welcome,
								<span style="color:#50a70b;" id="loggedInUserName">
								<sec:authentication property="name"/>
								</span>
								
							
							
						
					</c:when>
					<c:otherwise>
							
					</c:otherwise>
				</c:choose> </label></li>
		</ul>
	</div>
</nav>