title: 前端编码规范——一般规范
date: 2015-10-10 17:56:56
categories: 规范
keywords: 前端,规范,前端规范,html,css,javascript,jquery,注释
tags: [前端规范,规范]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript，jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。本文为一般规范。
---

## 文件/资源命名 ##

在 web 项目中，中划线（-）是用来分隔文件名的不二之选。同时它也是常见的 url 分隔符（比如：本文的 url）。所以理所当然的，中划线应该也是用来分隔资源名称的好选择。

尽量保证文件命名总是以字母开头而不是数字。而以特殊字符开头命名的文件，一般都有特殊的含义与用处。

文件的字母名称必须全为小写，这是因为在某些对大小写字母敏感的操作系统中，当文件通过工具压缩混淆后，或者人为修改过后，大小写不同而导致引用文件不同的错误，很难被发现。

还有一些情况下，需要对文件增加后缀或特定的扩展名时（比如 .min.js, .min.css），这种情况下，建议使用点分隔符来区分。

**不推荐：**

```
MyScript.js
myCamelCaseName.css
i_love_underscores.html
1001-scripts.js
my-file-min.css
```

**推荐：**

```
my-script.js
my-camel-case-name.css
i-love-underscores.html
thousand-and-one-scripts.js
my-file.min.css
```

## 结构目录 ##

- css
	- style.css（单页面就 style.css）
	- index.css（多页面进行分类，如：首页 index.css 内页 style.css）
- images
	- index（多页面，首页的图片放在 index 文件夹下）
		- body_bg.jpg
		- header_bg.jpg
		- main_bg.jpg
	- body_bg.jpg
	- header_bg.jpg
	- main_bg.jpg
- js
- index.html

## 编码格式 ##

文件必须用 UTF-8 编码，使用 UTF-8（无 BOM），请保持 css 文件编码与页面编码一致。

## 协议 ##

不要指定引入资源所带的具体协议。

当引入图片或其他媒体文件，还有样式和脚本时，url 所指向的具体路径，不要指定协议部分（http 和 https），除非这两者协议都不可用。

不指定协议使得 url 从绝对的获取路径转变为相对的，在请求资源协议无法确定时非常好用，而且还能为文件大小节省几个字节。

**不推荐：**

``` html
<script src="http://cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
```

``` css
.demo {
    background:url(http://xxx.com/images/bg.jpg);
}
```

**推荐：**

``` html
<script src="//cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
```

``` css
.demo {
    background:url(//xxx.com/images/bg.jpg);
}
```

## 文本缩进 ##

无论是 html 还是 css 又或者是 js，都使用**空格**缩进，一次缩进 4 个**空格**。

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>Document</title>
</head>
<body>
    <ul>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</body>
</html>
```

``` css
.demo {
    width:100px;
    height:100px;
    background:url(//xxx.com/images/bg.jpg);
}
```

``` javascript
;(function(w, d, $){
    var x = 10, y = 20;
    console.log(x + y);
}(window, document, jQuery));
```

## 检查代码 ##

每次写完 html 或者 css 或者 js，都应该检查一遍代码，看看是否有问题，比如 html 标签是否闭合，css 多余的类没有删除，js 的结束符，代码的缩进是否整齐等等。

对于 js，可以使用 [JSLint](http://www.jslint.com/) 或 [JSHint](http://jshint.com/)。

## 系列文章 ##

- [前端编码规范——一般规范](/specification/front-end-code-specification-general.html)
- [前端编码规范——html 规范](/specification/front-end-code-specification-html.html)
- [前端编码规范——css 规范](/specification/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](/specification/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](/specification/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](/specification/front-end-code-specification-comment.html)

## 参考文献 ##

> [Web Styleguide - Style guide to harmonize HTML, Javascript and CSS / Sass coding style](https://github.com/gionkunz/chartist-js/blob/develop/CODINGSTYLE.md)
> [http://www.css88.com/archives/5361](http://www.css88.com/archives/5361)