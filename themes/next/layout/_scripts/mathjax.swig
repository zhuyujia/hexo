{% if theme.mathjax %}
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
	tex2jax: {
		inlineMath: [ ['$','$'], ["\\(","\\)"]  ],
		processEscapes: true,
		skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
	}
});
</script>
<script type="text/x-mathjax-config">
MathJax.Hub.Queue(function() {
	var all = MathJax.Hub.getAllJax(), i;
	for (i=0; i < all.length; i += 1) {
		all[i].SourceElement().parentNode.className += ' has-jax';
	}
});
</script>
<script src="//cdn.bootcss.com/mathjax/2.5.3/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
{% endif %}