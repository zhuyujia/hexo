<!doctype html>
<html class="theme-next {% if theme.use_motion %}use-motion{% endif %} {% if theme.scheme %}theme-next-{{ theme.scheme | lower }}{% endif %}">
<head>
	{% include '_partials/head.swig' %}
	<title>{% block title %}{% endblock %}</title>
</head>
<body itemscope itemtype="http://schema.org/WebPage" lang="{{ config.language }}">
	{% include '_partials/old-browsers.swig' %}
	<div class="container one-column {% block page_class %}{% endblock %}">
		<div class="headband"></div>
		<header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
			<div class="header-inner"> {%- include '_partials/header.swig' %} </div>
		</header>
		<main id="main" class="main">
			<div class="main-inner">
				<div id="content" class="content"> {% block content %}{% endblock %} </div>
				{% if (theme.duoshuo_hotartical and page.title) %}
				<!-- 多说热评文章-->
				<p>热评文章</p>
				<div class="ds-top-threads" data-range="weekly" data-num-items="4"></div>
				{% endif %}

				{% if page.comments %}
				<div class="comments" id="comments">
					{% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}
					<div class="ds-thread" data-thread-key="{{ page.path }}" data-title="{{ page.title }}" data-url="{{ page.permalink }}"></div>
					{% elseif theme.disqus_shortname %}
					<div id="disqus_thread">
						<noscript>Please enable JavaScript to view the <a href="//disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
					</div>
					{% endif %}
				</div>
				{% endif %}
			</div>
			{% block sidebar %}{% endblock %}
		</main>
		<footer id="footer" class="footer">
			<div class="footer-inner">
				{% include '_partials/footer.swig' %}
			</div>
		</footer>
		<div class="back-to-top"></div>
	</div>
</body>
</html>
<script src="//7xn4vv.com1.z0.glb.clouddn.com/static/lib/jquery.min.js"></script>
<script src="//7xn4vv.com1.z0.glb.clouddn.com/static/lib/fastclick.min.js"></script>
<script src="//7xn4vv.com1.z0.glb.clouddn.com/static/lib/lazyload.min.js"></script>
<script src="//7xn4vv.com1.z0.glb.clouddn.com/static/lib/fancybox/jquery.fancybox.pack.js"></script>
{% block script_extra_before %}{% endblock %}
{% if theme.use_motion %}
<script src="//7xn4vv.com1.z0.glb.clouddn.com/static/lib/velocity/velocity.min.js"></script>
<script src="//7xn4vv.com1.z0.glb.clouddn.com/static/lib/velocity/velocity.ui.min.js"></script>
<script src="//7xn4vv.com1.z0.glb.clouddn.com/static/js/motion_global.js"></script>
{% else %}
<script src="//7xn4vv.com1.z0.glb.clouddn.com/static/js/motion_fallback.js"></script>
{% endif %}
{% if theme.baidushare and page.title %}
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"3","bdPos":"left","bdTop":"250"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
{% endif %}
{% include '_scripts/mathjax.swig' %}
{% block script_extra %}{% endblock %}
<script src="//7xn4vv.com1.z0.glb.clouddn.com/static/js/main.js"></script>
{% block comment_system %}{% endblock %}
<script src="//hm.baidu.com/hm.js?da64726cc9800fc0cd27a0284cd4c1cb"></script>