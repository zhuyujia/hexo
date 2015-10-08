var duoshuoQuery = {short_name: 'zhuyujia'};
var duoshuo_user_ID = 8593083;
var duoshuo_admin_nickname = '';
function hasMobileUA(){
	var nav = window.navigator;
	var ua = nav.userAgent;
	var pa = /iPad|iPhone|Android|Opera Mini|BlackBerry|webOS|UCWEB|Blazer|PSP|IEMobile|Symbian/g;
	return pa.test(ua);
}

function isDesktop(){
	return screen.width > 991 && !hasMobileUA();
}

function isTablet(){
	return screen.width < 992 && screen.width > 767 && hasMobileUA();
}

function isMobile(){
	return screen.width < 767 && hasMobileUA();
}

function escapeSelector(selector){
	return selector.replace(/[!"$%&'()*+,.\/:;<=>?@[\\\]^`{|}~]/g, "\\$&")
}

function displaySidebar(){
	setTimeout(function(){
		$('.sidebar-toggle').trigger('click');
	}, 800);
}

function isMist(){
	return CONFIG.scheme === 'Mist';
}

$(function(){
	$('#posts').find('img').lazyload({
		placeholder: '//7xn4vv.com1.z0.glb.clouddn.com/static/images/loading.gif',
		effect: 'fadeIn'
	});

	$('.site-nav-toggle button').on('click', function () {
		var $siteNav = $('.site-nav');
		var ON_CLASS_NAME = 'site-nav-on';
		var isSiteNavOn = $siteNav.hasClass(ON_CLASS_NAME);
		var animateAction = isSiteNavOn ? 'slideUp' : 'slideDown';
		var animateCallback = isSiteNavOn ? 'removeClass' : 'addClass';

		$siteNav.stop()[animateAction]('fast', function () {
			$siteNav[animateCallback](ON_CLASS_NAME);
		});
	});

	$('.content img').each(function(){
		var $image = $(this);
		var $imageWrapLink = $image.parent('a');

		if($imageWrapLink.size() < 1){
		  $imageWrapLink = $image.wrap('<a href="' + this.getAttribute('src') + '"></a>').parent('a');
		}
		$imageWrapLink.addClass('fancybox');
		if($image.attr('alt')){
			$imageWrapLink.append('<div class="pic-title"><span>' + $image.attr('alt') + '</span></div>');
			$imageWrapLink.attr('title', $image.attr('alt'));
		};
	});
	$('.fancybox').fancybox({
		helpers: {
			overlay: {
				locked: false
			}
		}
	});

	if (CONFIG.sidebar === 'always') {
		displaySidebar();
	}
	if (isMobile()) {
		FastClick.attach(document.body);
	}
});