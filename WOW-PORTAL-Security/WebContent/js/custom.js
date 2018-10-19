$('document').ready(function(){
		var count=0;
	/****** for header animation *******/
	$(function(){
		 var shrinkHeader = 100;
		  $(window).scroll(function() {
		    var scroll = getCurrentScroll();
		    if(scroll==0)
		    	count=0;
		      if ( scroll >= shrinkHeader ) {
//		    	  count++;
//		    	  if(count==1)
//		    	   $('.header').slideUp('slow');
		           $('.header').addClass('shrink');
//		           if(count==1)
//		           $('.header').slideDown('slow');
		        }
		        else {
//		        	$('.header').slideUp('slow');
		            $('.header').removeClass('shrink');
//		            $('.header').slideDown('slow');
		        }
		  });
		function getCurrentScroll() {
		    return window.pageYOffset || document.documentElement.scrollTop;
		    }
		});
	/******* end ******/
	
	
	/***** for content height fix ******/
	if($('.headerSection').length!=0)
	{
		var header=$('.headerSection').height();
		var menu=$('.homeMenu').height();
		var footer=$('.footerSection').height();
		var windowHeight=$(window).height();
//		var workAreaHeight=$('.workArea').height();
		var reportArea=windowHeight-header-menu-footer-1;
		$('.reportArea').css('min-height',reportArea);
		
	$(window).resize(function(){
		if($('.headerSection').length!=0){
		var header=$('.headerSection').height();
		var menu=$('.homeMenu').height();
		var footer=$('.footerSection').height();
		var windowHeight=$(window).height();
//		var workAreaHeight=$('.workArea').height();
		var reportArea=windowHeight-header-menu-footer-1;
		$('.reportArea').css('min-height',reportArea);
		}
	});
	}
	/***** end *****/
});