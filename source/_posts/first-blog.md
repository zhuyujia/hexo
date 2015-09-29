title: first blog
date: 2015-09-22 10:03:37
categories: 其他
keywords: blog,测试
description: 这是第一篇 blog，用于测试一些东西
---

Welcome to [Hexo](http://hexo.io/)! This is your very first post. Check [documentation](http://hexo.io/docs/) for more info. If you get any problems when using Hexo, you can find the answer in [troubleshooting](http://hexo.io/docs/troubleshooting.html) or you can ask me on [GitHub](https://github.com/hexojs/hexo/issues).

## Quick Start

### Create a new post

``` bash
$ hexo new "My New Post"
```

More info: [Writing](http://hexo.io/docs/writing.html)

### Run server

``` bash
$ hexo server
```

More info: [Server](http://hexo.io/docs/server.html)

### Generate static files

``` bash
$ hexo generate
```

More info: [Generating](http://hexo.io/docs/generating.html)

### Deploy to remote sites

``` bash
$ hexo deploy
```

More info: [Deployment](http://hexo.io/docs/deployment.html)

## 测试代码片段

### 普通代码

`code` `html` `css`&nbsp;&nbsp;&nbsp;&nbsp;`javascript`

### 普通代码块

#### html

``` html
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="renderer" content="webkit"/>
	<title>朱羽佳的博客</title>
</head>
<body>
</body>
</html>
```

#### css

```
.nav{height:60px;overflow:hidden;}
.nav li{border:1px solid #012a4f;height:58px;width:131px;}
.nav .last{width:133px;}
.nav a{background:#3e5368;border:1px solid #3e5368;color:#f6f5f3;display:block;height:56px;font-size:16px;text-align:center;}
.nav a:hover{text-decoration:none;}
.nav a em{font-size:22px;}
.nav .cur{border:1px solid #8c3900;}
.nav .cur a{background:#ff6800;border:1px solid #ff9400;cursor:default;}
.nav .disabled{border:1px solid #585858;}
.nav .disabled a{background:#8b8b8b;border:1px solid #b0b0b0;cursor:default;}
```

#### js

``` javascript
MPT.addAction('index', function(){
	var pageResult = $('.e_page_result').val();
	var $btnShow = $('.e_btn_show');
	var d = new Date();
	var day = d.getMonth() + 1 + '月' + d.getDate() + '日';
	var curIndex = actIndex = MPT.Config['award'].length;
	if(pageResult){
		alert(pageResult.split('&')[1].split('=')[1]);
		return false;
	}
	$btnShow.click(function(){
		popup(MPT.getTmpl('popup_rule'), {'width': 484});
	});
	$.each(MPT.Config['award'], function(i){
		if(MPT.Config['award'][i]['date'] == day){
			curIndex = actIndex = i;
			return false;
		}
	});
	awardLoad(curIndex, actIndex);
});
function awardLoad(curIndex){
	var $nav = $('.e_nav');
	var $award = $('.e_award');
	$nav.html(MPT.getTmpl('nav', {'curIndex': curIndex, 'actIndex': actIndex, 'content': MPT.Config['award']}));
	if(curIndex < MPT.Config['award'].length){
		$award.html(MPT.getTmpl('award', {'curIndex': curIndex, 'content': MPT.Config['award']}));
	}
}
function popup(content, opts, callback){
	var _width = opts.width;
	var _height = opts.height;
	var _top = opts.top || '10%';
	if(_height){
		_top = ($(window).height() - _height) / 2;
	}
	$.blockUI({
		message: content,
		css: {
			left: ($(window).width() - _width) / 2,
			top: _top
		},
		focusInput: false,
		onBlock: function(){
			if(callback) callback();
		}
	});
}
function popupAlert(msg, callback){
	popup(MPT.getTmpl('popup_alert', {'msg': msg}), {'width': 340}, callback);
}
```

### 测试图片

{% qnimg 20150929/1.png %}