<script>
$(document).ready(function(){
	$('#loginItem').click(function() {
		window.location.href="login.do";
	});
});


</script>
<style>

#loginItem {
cursor:pointer;
}

</style>

<nav class="navbar-fixed-bottom">
    <div class=" container">
      <ul class="nav nav-pills" role="tablist" style="margin:0 auto;">
        <li><img src="images/footerImages/Wow Pic.png" style="margin-top : -1px;"></li>
        &nbsp;&nbsp;
        <li><img src="images/footerImages/BIGW Pic.png" style="margin-top : 1px;"></li>
        &nbsp;&nbsp;
        <li><img src="images/footerImages/EZIBUY Pic.png" style="margin-top : 2px;"></li>
        &nbsp;&nbsp;
        <li><img src="images/footerImages/Masters Pic.png" style="margin-top : 2px; margin-left : -4px"></li>
        &nbsp;&nbsp;
        <li><img src="images/footerImages/BWS Pic.png" style="margin-top : 4px;"></li>
        &nbsp;&nbsp;
        <li><img src="images/footerImages/Dan Pic.png" style="margin-top : 7px;"></li>
        &nbsp;&nbsp;
        <li><img src="images/footerImages/WMoney Pic.png" style="margin-top : -3px;"></li>
        &nbsp;&nbsp;
        <li><img src="images/footerImages/Thg Pic.png" style="margin-top : 6px;"></li>
        &nbsp;&nbsp;
        <li><img src="images/footerImages/Cm Pic.png" style="margin-top : -7px;"></li>
        &nbsp;&nbsp;
        <li><img src="images/footerImages/Dark Pic.png" style="margin-top : 4px;"></li>
        &nbsp;&nbsp;
<!--         <li><img src="images/footerImages/WMobile Pic.png"></li> -->
        <li><img src="images/footerImages/Double Pic.png" style="margin-top : -2px;"></li>
        &nbsp;&nbsp;
        <li><img id="allign" src="images/footerImages/WL Pic.png" style="margin-top : -26px;"></li>
         </ul>
         
        <c:choose>
					<c:when test="${authenticated}">
						
					</c:when>
					<c:otherwise>
					<ul>
						<li id="loginItem" style="float: right; margin-top: -71px; border-radius: 5px; position: relative; display: block; padding: 27px 0px 0px 60px;"><img src="images/icons/userName.png" align="middle" height="20" width="20" style="margin-right: -9px;"></li>
					</ul>	
					</c:otherwise>
				</c:choose>
    </div>
    <div class="copyRight">
    	<div class="container-fluid">
    		<div class="col-md-11">Powered by <b>TATA CONSULTANCY SERVICES LTD</b></div>
    		<!-- <div class="col-md-6">
    			<label>Feedback</label>
    			<label> / </label>
    			<label>Contact Us</label>
    		</div> -->
 		</div>
    </div>
</nav>

