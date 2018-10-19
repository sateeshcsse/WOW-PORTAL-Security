$('document').ready(function(){
	/***** for content height fix ******/
	if($('.headerSection').length!=0)
	{
		var header=$('.headerSection').height();
		var menu=$('.homeMenu').height();
		var footer=$('.footerSection').height();
		var windowHeight=$(window).height();
		var reportArea=windowHeight-header-menu-footer-1;
		$('.reportArea').css('height',reportArea);
		
	$(window).resize(function(){
		if($('.headerSection').length!=0){
		var header=$('.headerSection').height();
		var menu=$('.homeMenu').height();
		var footer=$('.footerSection').height();
		var windowHeight=$(window).height();
		var reportArea=windowHeight-header-menu-footer-1;
		$('.reportArea').css('height',reportArea);
		}
	});
	}
	/***** end *****/
});