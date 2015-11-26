$(function(){
	$('.carousel').carousel();
	$(".box-slide-image a:first-child").show("fast");
		setInterval(function(){
			$(".box-slide-image a:first-child").fadeOut('slow').next().fadeIn('slow').end().appendTo(".box-slide-image");
		},3000);
});