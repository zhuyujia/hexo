title: 前端编码规范——html 规范
date: 2015-10-12 09:54:21
categories: 规范
keywords: 前端, 规范, 前端规范, html, css, javascript, jquery, 注释
tags: [前端规范, 规范, html]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript，jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。本文为 html 规范。
---

## 文档类型 ##

推荐使用 html5 的文档类型申明：

``` html
<!DOCTYPE html>
```

## 语言属性 ##

根据 html5 规范：

> 强烈建议为 `html` 根元素指定 `lang` 属性，从而为文档设置正确的语言。这将有助于语音合成工具确定其所应该采用的发音，有助于翻译工具确定其翻译时所应遵守的规则等等。

这里列出了[语言代码表](https://www.sitepoint.com/web-foundations/iso-2-letter-language-codes/)。

``` html
<html lang="en"></html>
```

## IE 兼容模式 ##

IE 支持通过特定的 `meta` 标签来确定绘制当前页面所应该采用的 IE 版本。除非有强烈的特殊需求，否则最好是设置为 **edge mode**，从而通知 IE 采用其所支持的最新的模式。

``` html
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
```

## 省略自闭合元素的斜线 ##

不要在自闭合（self-closing）元素的尾部添加斜线 -- [html5 规范](https://dev.w3.org/html5/spec-author-view/syntax.html#syntax-start-tag)中明确说明这是可选的。

**不推荐**

``` html
<input type="text"/>
```

**推荐**

``` html
<input type="text">
```

## 不要省略结束标签 ##

不要省略可选的结束标签（closing tag）。

**不推荐**

``` html
<ul>
    <li>
</ul>
```

**推荐**

``` html
<ul>
    <li></li>
</ul>
```

## 省略 type 属性 ##

省略 css 与 js 的 `type` 属性。鉴于 html5 中以上两者默认的 `type` 值就是 `text/css` 和 `text/javascript`，所以 `type` 属性一般是可以忽略掉的，甚至在老旧版本的浏览器中这么做也是安全可靠的。

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

## 实用为王 ##

尽量遵循 html 标准和语义，但是不要以牺牲实用性为代价。任何时候都要尽量使用最少的标签并保持最小的复杂度。

**不推荐**

``` html
<span class="avatar">
    <img src="avatar.jpg">
</span>
```

**推荐**

``` html
<img class="avatar" src="avatar.jpg">
```

## 结构，表现与行为分离 ##

一个完整的页面分为三个部分：结构（html）、表现（css）和行为（js）。为了使它们成为可维护的干净整洁的代码，我们要尽可能的将它们分离开来。

严格地保证结构、表现、行为三者分离，并尽量使三者之间没有太多的交互和联系。就是说，尽量在文档和模板中只包含结构性的 html；而将所有表现代码，移入样式表中；将所有动作行为，移入脚本之中。在此之外，为使得它们之间的联系尽可能的小，在文档和模板中也尽量少地引入样式和脚本文件。

清晰的分层意味着：

- 不使用超过一到两张样式表
- 尽量合并脚本
- 不使用内嵌样式（`<style>.no-good {}</style>`）
- 不使用行内样式（`<hr style="border-top: 5px solid black">`）
- 不使用内嵌脚本（`<script>alert('no good')</script>`）
- 不使用表现元素（`<b>`，`<u>`，`<center>`，`<font>`）

## 小写 ##

html 标签及属性（包括自定义属性）都是小写字母，不要使用大写字母。

## 绑定数据 ##

如果需要为标签绑定一些数据的话，请使用 html5 的自定义属性 `data-*` 来绑定相关数据。

``` html
<h1 data-age="20">张三</h1>
```

## 布尔型属性 ##

布尔型属性可以在声明时不赋值。xhtml 规范要求为其赋值，但是 html5 规范不需要。

``` html
<input type="text" disabled>
<input type="checkbox" value="1" checked>
<select>
    <option value="1" selected>1</option>
    <option value="2"></option>
</select>
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