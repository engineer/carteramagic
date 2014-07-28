$(window).load(function() {
	//Preloader
	$('#status').delay(300).fadeOut();
	$('#preloader').delay(300).fadeOut('slow');
	$('body').delay(450).css({'overflow':'visible'});
})

$(document).ready(function() {

		//animated logo with wow :D
		$(".navbar-brand").hover(function () {
			$(this).toggleClass("animated shake");
		});

		//animated siginbar
		$("#signInFacebook").hover(function () {
			$(this).toggleClass("wow pulse animated");
		});


		//animated scroll_arrow
		$(".img_scroll").hover(function () {
			$(this).toggleClass("animated infinite bounce");
		});

		//Magnific Popup for screen app
		$('.image-link').magnificPopup({type:'image'});


		// OwlCarousel SCREEN APP
		$("#owl-demo").owlCarousel({
			autoPlay: 3000,
			items : 3,
			itemsDesktop : [1199,3],
			itemsDesktopSmall : [979,3]
		});


		//SmothScroll GENERAL FOR LANDINGPAGE
		$('a[href*=#]').click(function() {
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
			&& location.hostname == this.hostname) {
					var $target = $(this.hash);
					$target = $target.length && $target || $('[name=' + this.hash.slice(1) +']');
					if ($target.length) {
							var targetOffset = $target.offset().top;
							$('html,body').animate({scrollTop: targetOffset}, 600);
							return false;
					}
			}
		});

});
