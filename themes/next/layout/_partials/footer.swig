<div class="copyright">
	{% set current = date(Date.now(), "YYYY") %}
	&copy; &nbsp; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
	<span itemprop="copyrightYear">{{ current }}</span>
	<span class="with-love"><i class="icon-next-heart"></i></span>
	<span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>
<div class="powered-by">{{ __('footer.powered', '<a class="theme-link" href="http://hexo.io" target="_blank">Hexo</a>') }}</div>
<div class="theme-info">{{ __('footer.theme') }} - <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next" target="_blank">NexT{% if theme.scheme %}.{{ theme.scheme }}{% endif %}</a></div>
<div class="res-info">感谢<a class="theme-link" href="http://www.qiniu.com/" target="_blank">七牛云存储</a>提供静态资源空间</div>
{% block footer %}{% endblock %}