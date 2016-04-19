title: 前端编码规范——html 规范
date: 2015-10-12 09:54:21
categories: 规范
keywords: 前端,规范,前端规范,html,css,javascript,jquery,注释
tags: [前端规范,规范,html]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript，jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。本文为 html 规范。
---

## 文档类型 ##

推荐使用 HTML5 的文档类型申明：

``` html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <title>Document</title>
</head>
<body>
</body>
</html>
```

## html 验证 ##

一般情况下，建议使用能通过标准规范验证的 html 代码，除非在性能优化和控制文件大小上不得不做出让步。

使用诸如 W3C HTML validator 这样的工具来进行检测。

规范化的 html 是显现技术要求与局限的显著质量基线，它促进了 html 被更好地运用。

**不推荐**

``` html
<title>Test</title>
<article>This is only a test.
```

**推荐**

``` html
<title>Test</title>
<article>This is only a test.</article>
```

## 省略可选标签 ##

html5 规范中规定了 html 标签是可以省略的，比如 `<br>`、`<input type="text">` 等等。

## 脚本加载 ##

脚本应该放在 `html` 标签后面加载。一段脚本放置在 `head` 内，比如 `<script src="main.js"></script>`，其加载会一直阻塞 DOM 解析，直至它完全地加载和执行完毕。这会造成页面显示的延迟。特别是一些重量级的脚本，对用户体验来说那真是一个巨大的影响。

**不推荐**

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>Document</title>
    <script src="main.js"></script>
</head>
<body>
    
</body>
</html>
```

**推荐**

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>Document</title>
</head>
<body>
    
</body>
</html>
<script src="main.js"></script>
```

## 语义化 ##

使用具有语义的标签，比如 `h1`、`p` 等等。

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <title>Document</title>
</head>
<body>
    <h1>标题</h1>
    <h2>子标题</h2>
    <p>文本段落</p>
    <p><strong>加粗文本</strong></p>
</body>
</html>
<script src="main.js"></script>
```

## 结构，表现与行为分离 ##

一个完整的页面分为三个部分：结构（html）、表现（css）和行为（javascript）。为了使它们成为可维护的干净整洁的代码，我们要尽可能的将它们分离开来。

严格地保证结构、表现、行为三者分离，并尽量使三者之间没有太多的交互和联系。就是说，尽量在文档和模板中只包含结构性的 html；而将所有表现代码，移入样式表中；将所有动作行为，移入脚本之中。在此之外，为使得它们之间的联系尽可能的小，在文档和模板中也尽量少地引入样式和脚本文件。

清晰的分层意味着：

- 不使用超过一到两张样式表
- 尽量合并脚本
- 不使用内嵌样式（`<style>.no-good {}</style>`）
- 不使用行内样式（`<hr style="border-top: 5px solid black">`）
- 不使用内嵌脚本（`<script>alert('no good')</script>`）
- 不使用表现元素（`<b>`，`<u>`，`<center>`，`<font>`）

## 省略 type 属性 ##

省略样式表与脚本上的 `type` 属性。鉴于 html5 中以上两者默认的 `type` 值就是 `text/css` 和 `text/javascript`，所以 `type` 属性一般是可以忽略掉的。甚至在老旧版本的浏览器中这么做也是安全可靠的。

## 小写 ##

html 标签及属性（包括自定义属性）都是小写字母，不要使用大写字母。

## 绑定数据 ##

如果需要为标签绑定一些数据的话，请使用 html5 的自定义属性 `data-*` 来绑定相关数据。

``` html
<h1 data-age="20">张三</h1>
```

## html 引号 ##

html 属性的引号请使用双引号而不是单引号。

## 系列文章 ##

- [前端编码规范——一般规范](/specification/front-end-code-specification-general.html)
- [前端编码规范——html 规范](/specification/front-end-code-specification-html.html)
- [前端编码规范——css 规范](/specification/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](/specification/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](/specification/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](/specification/front-end-code-specification-comment.html)

## 参考文献 ##

> [Web Styleguide - Style guide to harmonize HTML, Javascript and CSS / Sass coding style](https://github.com/gionkunz/chartist-js/blob/develop/CODINGSTYLE.md)
> [http://www.css88.com/archives/5364](http://www.css88.com/archives/5364)