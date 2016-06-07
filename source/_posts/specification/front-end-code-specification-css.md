title: 前端编码规范——css 规范
date: 2015-10-12 10:48:02
categories: 规范
keywords: 前端, 规范, 前端规范, html, css, javascript, jquery, 注释
tags: [前端规范, 规范, css]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript，jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。本文为 css 规范。
---

## 编码 ##

在 css 首行设置文件编码为 utf-8。

``` css
@charset "utf-8";
```

## class 命名 ##

class 名称应当尽可能短，并且意义明确。使用有意义的名称，使用有组织的或目的明确的名称，不要使用表现形式的名称。

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

使用中划线（-）分隔 class 中的单词。虽然它很不方便的让你双击选择，但是它可以增强理解性。另外属性选择器 `[attribute|=value]` 也能识别中划线（-），所以最好坚持使用中划线作为分隔符。

**不推荐**

``` css
.slide_hd {}
.slide_bd {}
```

**推荐**

``` css
.slide-hd {}
.slide-bd {}
```

基于最近的父 class 或基本 class 作为新 class 的前缀。

**不推荐**

``` css
.header .logo {}
.header .banner {}
```

**推荐**

``` css
.header-logo {}
.header-banner {}
```

使用 `.js-*` 的 class 来标识行为（与样式相对），并且不要将这些 class 写有任何的样式。

## 减少选择器的嵌套 ##

在写选择器时，要尽可能的减少嵌套层级，一般 2~3 层，不要超过 4 层。

**不推荐**

``` css
.main ul li a span {}
```

**推荐**

``` css
.main span {}
```

## 优化选择器 ##

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

## 属性简写 ##

css 提供了各种简写属性（`font`、`background` 等等），使用简写属性对于代码效率和可读性是有很有用的。

**不推荐**

``` css
border-top-style: none;
font-family: palatino, georgia, serif;
font-size: 100%;
line-height: 1.6;
padding-bottom: 2px;
padding-left: 1px;
padding-right: 1px;
padding-top: 0;
```

**推荐**

``` css
border-top: none;
font: 100%/1.6 palatino, georgia, serif;
padding: 0 1px 2px;
```

但是不能滥用简写形式，过度使用简写形式的属性声明会导致代码混乱，并且会对属性值带来不必要的覆盖从而引起意外的副作用。

**不推荐**

``` css
width:100px;
margin:0 auto;
```

**推荐**

``` css
width:100px;
margin-right:auto;
margin-left:auto;
```

## 省略 0 后面的单位 ##

不要在 0 值后面使用单位。

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

## 使用 16 进制表示颜色值 ##

css 中的颜色值可以使用 16 进制来表示，在可能的情况下，可以进行缩写，比如：`#fff`、`#000`。

## hack 的使用 ##

虽然 hacks 能够很方便的解决浏览器之间的兼容问题，但是我们还是不要使用 hacks，尽量从根本上解决问题，比如改变结构等等。

## 声明顺序 ##

为了保证更好的可读性，我们应该遵循以下顺序：

1. 定位：`position` | `z-index` | `top` | `right` | `bottom` | `left` | `clip`
1. 布局：`display` | `float` | `clear` | `visibility` | `overflow` | `overflow-x` | `overflow-y`
1. 尺寸：`width` | `min-width` | `max-width` | `height` | `min-height` | `max-height`
1. 外边距：`margin` | `margin-top` | `margin-right` | `margin-bottom` | `margin-left`
1. 内边距：`padding` | `padding-top` | `padding-right` | `padding-bottom` | `padding-left`
1. 边框：`border` | `border-top` | `border-right` | `border-bottom` | `border-left` | `border-radius` | `box-shadow` | `border-image`
1. 背景：`background` | `background-color` | `background-image` | `background-repeat` | `background-attachment` | `background-position` | `background-origin` | `background-clip` | `background-size`
1. 颜色：`color` | `opacity`
1. 字体：`font` | `font-style` | `font-variant` | `font-weight` | `font-size` | `font-family`
1. 文本：`text-transform` | `white-space` | `word-break` | `word-wrap` | `overflow-wrap` | `text-align` | `word-spacing` | `letter-spacing` | `text-indent` | `vertical-align` | `line-height`
1. 文本修饰：`text-decoration` | `text-shadow`
1. 书写模式：`direction` | `unicode-bidi` | `writing-mode`
1. 列表：`list-style` | `list-style-image` | `list-style-position` | `list-style-type`
1. 表格：`table-layout` | `border-collapse` | `border-spacing` | `caption-side` | `empty-cells`
1. 内容：`content` | `counter-increment` | `counter-reset` | `quotes`
1. 用户界面：`appearance` | `text-overflow` | `outline` | `outline-width` | `outline-color` | `outline-style` | `outline-offset` | `cursor` | `zoom` | `box-sizing` | `resize` | `user-select`
1. 多列：`columns` | `column-width` | `column-count` | `column-gap` | `column-rule` | `column-rule-width` | `column-rule-style` | `column-rule-color` | `column-span` | `column-fill` | `column-break-before` | `column-break-after` | `column-break-inside`
1. 伸缩盒：`flex`
1. 变换，过渡，动画：`transform` | `transition` | `animation`

## 媒体查询的位置 ##

将媒体查询放在尽可能相关规则的附近。不要将他们打包放在一个单一样式文件中或者放在文档底部。如果你把他们分开了，将来只会被大家遗忘。

**推荐**

``` css
.element {}
.element-avatar {}
.element-selected {}

@media (min-width: 480px) {
    .element {}
    .element-avatar {}
    .element-selected {}
}
```

## 带前缀的属性 ##

当使用特定厂商的带有前缀的属性时，通过缩进的方式，让每个属性的值在垂直方向对齐，这样便于多行编辑。

``` css
.selector {
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
            box-shadow: 0 1px 2px rgba(0,0,0,.15);
}
```

## 引号 ##

属性选择器或属性值用双引号（`""`），而不是单引号（`''`）括起来。url 的值不要使用引号。

**不推荐**

``` css
@import url('//cdn.com/foundation.css');
input[type='submit'] {
    font-family: 'open sans', arial, sans-serif;
}
body:after {
    content: 'pause';
}
```

**推荐**

``` css
@import url(//cdn.com/foundation.css);
input[type="submit"] {
    font-family: "open sans", arial, sans-serif;
}
body:after {
    content: "pause";
}
```

## 声明结束 ##

为了保证一致性和可扩展性，每个声明应该用分号结束。

**不推荐**

``` css
.demo {
    width:100px;
    height:100px
}
```

**推荐**

``` css
.demo {
    width:100px;
    height:100px;
}
```

## 多行规则声明 ##

为了易读性和便于快速编辑，统一将语句分为多行，即使该样式只包含一条声明。

**不推荐**

``` css
.demo {width:100px;height:100px;}
```

**推荐**

``` css
.demo {
    width:100px;
    height:100px;
}
```

## 中文字体引用 ##

css 中文字体可以用 unicode 格式来表示，比如“宋体”可以用 `\5B8B\4F53` 来表示。具体参考下表：

| 中文名 | 英文名 | unicode |
| --- | --- | --- |
| 宋体 | SimSun | \5B8B\4F53 |
| 微软雅黑 | Microsoft YaHei | \5FAE\8F6F\96C5\9ED1 |

[更多字体点击查看](/css/css-font-unicode-table.html)。

## 对于 sass 的嵌套 ##

在 sass 中你可以嵌套选择器，这可以使代码变得更清洁和可读。嵌套所有的选择器，但尽量避免嵌套没有任何内容的选择器。

如果你需要指定一些子元素的样式属性，而父元素将不什么样式属性，可以使用常规的 css 选择器链，这将防止您的脚本看起来过于复杂。

**不推荐**

``` scss
.content {
    display: block;
}
 
.content > .news-article > .title {
    font-size: 1.2em;
}
```

**推荐**

``` scss
.content {
    display: block;
    > .news-article > .title {
      font-size: 1.2em;
    }
}
```

当使用 sass 的嵌套功能的时候，重要的是有一个明确的嵌套顺序。

1. 当前选择器的 `@extend` 和 `@include`
1. 当前选择器的样式属性
1. 父级选择器的伪类选择器（`:first-letter`，`:hover`，`:active` 等等）
1. 伪类元素（`:before` 和 `:after`）
1. 父级选择器的声明样式（`.selected`，`.active` 等等）
1. 用 sass 的上下文媒体查询
1. 子选择器作为最后的部分

``` scss
.test {
    @extend %clearfix;
    color:#ccc;
    &:hover {
        color:#000;
    }
    &:before {
        border:1px solid #eee;
        content:"";
    }
    &.active {
        color:#f00;
        &:hover {
            color:#ff0;
        }
    }
    @media screen and (max-width: 640px) {
        display:block;
        font-size:2em;
    }
    > .title {
        font-size:1.2em;
    }
}
```

## 系列文章 ##

- [前端编码规范——一般规范](/specification/front-end-code-specification-general.html)
- [前端编码规范——html 规范](/specification/front-end-code-specification-html.html)
- [前端编码规范——css 规范](/specification/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](/specification/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](/specification/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](/specification/front-end-code-specification-comment.html)

## 参考文献 ##

> [Web Styleguide - Style guide to harmonize HTML, Javascript and CSS / Sass coding style](https://github.com/gionkunz/chartist-js/blob/develop/CODINGSTYLE.md)  
> [http://www.css88.com/archives/5505](http://www.css88.com/archives/5505)