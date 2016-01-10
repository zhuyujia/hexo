title: 前端编码规范——一般规范
date: 2015-10-10 17:56:56
categories: 规范
keywords: 前端,规范,前端规范,html,css,javascript,jquery,注释
tags: [前端规范,规范]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。本文为一般规范。
---

## 前言 ##

这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。只要开发者们能够保证源代码源文件都严格遵循规范，那接下去所使用的混淆、压缩和编译工具则可投其所好不尽相同。

## 一般规范 ##

### 文件/资源命名 ###

在 web 项目中，中划线（-）是用来分隔文件名的不二之选。同时它也是常见的 url 分隔符（比如：本文的 url）。所有的资源名称可以用下划线（_）来分隔，如背景图 body_bg.jpg。

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

一般结构目录：

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

### 编码 ###

文件必须用 UTF-8 编码，使用 UTF-8（无 BOM），请保持 css 文件编码与页面编码一致。

### 协议 ###

不要指定引入资源所带的具体协议。

当引入图片或其他媒体文件，还有样式和脚本时，url 所指向的具体路径，不要指定协议部分（http 和 https），除非这两者协议都不可用。

不指定协议使得 url 从绝对的获取路径转变为相对的，在请求资源协议无法确定时非常好用，而且还能为文件大小节省几个字节。

**不推荐：**

``` html
<script src="http://cdn.com/foundation.min.js"></script>
```

**推荐：**

``` html
<script src="//cdn.com/foundation.min.js"></script>
```

### 文本缩进 ###

无论是 html 还是 css 又或者是 js，都使用 `tab` 缩进，一次缩进 4 个空格。

### 注释 ###

注释是**你自己**与你的小伙伴们了解代码写法和目的的唯一途径。特别是在写一些看似琐碎的无关紧要的代码时，由于记忆点不深刻，注释就变得尤为重要了。

编写自解释代码只是一个**传说**，没有任何代码是可以完全自解释的。而代码注释，则是永远也不嫌多。

当你写注释时一定要注意：不要写你的代码都干了些什么，而要写你的代码为什么要这么写，背后的考量是什么。当然也可以加入所思考问题或是解决方案的链接地址。

一些注释工具可以帮助你写出更好的注释。[JSDoc](http://usejsdoc.org/) 或 [YUIDoc](http://yui.github.io/yuidoc/) 就是用来写 javascript 注释用的。你甚至可以使用工具来为这些注释生成文档，这也是激励开发者们写注释的一个好方法，因为一旦有了这样方便的生成文档的工具，他们通常会开始花更多时间在注释细节上。

### 代码检查 ###

每次写完 html 或者 css 或者 js，都应该检查一遍代码，看看是否有问题，比如 html 少写了闭合标签，css 多余的空格没有删除，js 的结束符，代码的缩进是否整齐，等等。

对于 javascript，建议使用 [JSLint](http://www.jslint.com/) 或 [JSHint](http://jshint.com/)。

## 系列文章 ##

- [前端编码规范——一般规范](/2015/10/front-end-code-specification-general.html)
- [前端编码规范——html 规范](/2015/10/front-end-code-specification-html.html)
- [前端编码规范——css 规范](/2015/10/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](/2015/10/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](/2015/10/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](/2015/10/front-end-code-specification-comment.html)

> 原文：[Web Styleguide - Style guide to harmonize HTML, Javascript and CSS / Sass coding style](https://github.com/gionkunz/chartist-js/blob/develop/CODINGSTYLE.md)  
> 本文转载自：[http://www.css88.com/archives/5361](http://www.css88.com/archives/5361)，略有修改。