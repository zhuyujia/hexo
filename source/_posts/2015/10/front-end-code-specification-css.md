title: 前端编码规范——css 规范
date: 2015-10-12 10:48:02
categories: 规范
keywords: 前端,规范,前端规范,html,css,javascript,jquery,注释
tags: [前端规范,规范,css]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。本文为 css 规范。
---

## 前言 ##

这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。只要开发者们能够保证源代码源文件都严格遵循规范，那接下去所使用的混淆、压缩和编译工具则可投其所好不尽相同。

## css 规范 ##

### 编码 ###

在 css 首行设置文件编码为 utf-8。

``` css
@charset "utf-8";
```

### id and class ###

id 和 class 尽量使用语义化命名，比如 header，main，footer，logo，nav，menu 等等。

**不推荐**

``` css
.fw-800 {font-weight:800;}
.red {color:red;}
```

**推荐**

``` css
.heavy {font-weight:800;}
.important {color:red;}
```

### 合理的避免使用 id ###

id 只有在两种情况下才会用到。1、锚点；2、用于 js

不要给 id 设置任何的 css。

### 优化你的 css 选择器 ###

当构建选择器时应该使用清晰，准确和有语义的 class 名。尽量减少使用标签选择器。如果你只关心你的 class 名，而不是你的代码元素，这样会更容易维护。

**不推荐**

``` css
div.content > header.content-header > h2.title {
	font-size: 2em;
}
```

**推荐**

``` css
.content > .content-header > .title {
	font-size: 2em;
}
```

### 尽可能的减少选择器的层级 ###

在写选择器时，要尽可能的减少层级，一般 2~3 层，最多 4 层。

### 缩写属性 ###

css 提供了各种缩写属性（如 `font` 字体）应该尽可能使用，即使在只设置一个值的情况下。使用缩写属性对于代码效率和可读性是有很有用的。

**不推荐**

``` css
border-top-style: none;
font-family: palatino, georgia, serif;
font-size: 100%;
line-height: 1.6;
padding-bottom: 2em;
padding-left: 1em;
padding-right: 1em;
padding-top: 0;
```

**推荐**

``` css
border-top: 0;
font: 100%/1.6 palatino, georgia, serif;
padding: 0 1em 2em;
```

### 0 和 单位 ###

省略 0 值后面的单位。不要在 0 值后面使用单位，除非有值。

**不推荐**

``` css
padding-bottom: 0px;
margin: 0em;
```

**推荐**

``` css
padding-bottom: 0;
margin: 0;
```

### 十六进制表示法 ###

在可能的情况下，使用 3 个字符的十六进制表示法。颜色值允许这样表示，3 个字符的十六进制表示法更简短。另外始终使用小写的十六进制数字。

### id 和 class 的分隔符 ###

使用中划线（-）分隔 id 和 class 中的单词。虽然它很不方便的让你双击选择，但是它可以增强理解性。另外属性选择器也能识别中划线（-）`[attribute|=value]`，所以最好坚持使用中划线作为分隔符。

**不推荐**

``` css
.demoimage {}
.error_status {}
```

**推荐**

``` css
#video-id {}
.ads-sample {}
```

### hacks ###

虽然 hacks 能够很方便的解决浏览器之间的兼容问题，但是我们还是不要使用 hacks，尽量从根本上解决问题，比如改变结构等等。

### 声明顺序 ###

这是一个选择器内书写 css 属性顺序的大致轮廓，为了保证更好的可读性。作为最佳实践，我们应该遵循以下顺序：

1. 结构性：
	1. 定位：`position` | `z-index` | `top` | `right` | `bottom` | `left` | `clip`
	2. 布局：`display` | `float` | `clear` | `visibility` | `overflow` | `overflow-x` | `overflow-y`
	3. 尺寸：`width` | `min-width` | `max-width` | `height` | `min-height` | `max-height`
	4. 外边距：`margin` | `margin-top` | `margin-right` | `margin-bottom` | `margin-left`
	5. 内边距：`padding` | `padding-top` | `padding-right` | `padding-bottom` | `padding-left`
1. 表现性：
	1. 边框：`border` | `border-radius` | `box-shadow` | `border-image`
	2. 背景：`background` | `background-color` | `background-image` | `background-repeat` | `background-attachment` | `background-position` | `background-origin` | `background-clip` | `background-size`
	3. 颜色：`color` | `opacity`
	4. 字体：`font` | `font-style` | `font-variant` | `font-weight` | `font-size` | `font-family`
	5. 文本：`white-space` | `text-align` | `text-indent` | `vertical-align` | `line-height`
	6. 文本修饰：`text-decoration` | `text-shadow`
	7. 列表：`list-style` | `list-style-image` | `list-style-position` | `list-style-type`
	8. 内容：`content`
	9. 用户界面：`text-overflow` | `outline` | `cursor` | `zoom` | `box-sizing` | `resize`
	10. 多列：`columns`
	11. 伸缩盒：`flex`
	12. 变换，过渡，动画：`transform` | `transition` | `animation`

### 声明结束 ###

为了保证一致性和可扩展性，每个声明应该用分号结束。

### css 引号 ###

属性选择器或属性值用双引号（""），而不是单引号（''）括起来。url 的值不要使用引号。

**不推荐**

``` css
@import url('//cdn.com/foundation.css');
html {
  font-family: 'open sans', arial, sans-serif;
}
body:after {
  content: 'pause';
}
```

**推荐**

``` css
@import url(//cdn.com/foundation.css);
html {
  font-family: "open sans", arial, sans-serif;
}
body:after {
  content: "pause";
}
```

### css 中文字体 ###

css 中文字体可以用 unicode 格式来表示，比如“宋体”可以用 `\5B8B\4F53` 来表示。具体参考下表：

| 中文名 | 英文名 | unicode |
| --- | --- | --- |
| 宋体 | SimSun | \5B8B\4F53 |
| 黑体 | SimHei | \9ED1\4F53 |
| 新宋体 | NSimSun | \65B0\5B8B\4F53 |
| 楷体 | KaiTi | \6977\4F53 |
| 微软正黑体 | Microsoft JhengHei | \5FAE\x8F6F\6B63\9ED1\4F53 |
| 微软雅黑 | Microsoft YaHei | \5FAE\8F6F\96C5\9ED1 |

## 系列文章 ##

- [前端编码规范——一般规范](/2015/10/front-end-code-specification-general.html)
- [前端编码规范——html 规范](/2015/10/front-end-code-specification-html.html)
- [前端编码规范——css 规范](/2015/10/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](/2015/10/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](/2015/10/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](/2015/10/front-end-code-specification-comment.html)

> 原文：[Web Styleguide - Style guide to harmonize HTML, Javascript and CSS / Sass coding style](https://github.com/gionkunz/chartist-js/blob/develop/CODINGSTYLE.md)  
> 本文转载自：[http://www.css88.com/archives/5505](http://www.css88.com/archives/5505)，略有修改。