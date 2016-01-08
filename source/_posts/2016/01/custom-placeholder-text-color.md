title: 自定义 placeholder 文本颜色
date: 2016-01-08 21:43:33
categories: css
keywords: placeholder, -webkit-input-placeholder, -moz-placeholder
description:
tags: [placeholder, -webkit-input-placeholder, -moz-placeholder]
---

本文主要介绍如何利用 css 修改 `placeholder` 文本颜色。

对于 ie 浏览器我们可以通过设置 `.placeholder-tip` 或者自定义 `className`，直接修改 `label` 的样式。对于标准浏览器如谷歌和火狐就需要特殊处理了，不多说直接上代码：
<!--more-->

Css：

``` css
::-webkit-input-placeholder{color:#f00;}
::-moz-placeholder{color:#f00;}
:-moz-placeholder{color:#f00;}
```

Scss：

``` scss
$placeholder: true #ccc !default;
@if nth($placeholder, 1) {
    // Safari and Chrome
    input::-webkit-input-placeholder,
    textarea::-webkit-input-placeholder {
        color: nth($placeholder, 2);
    }
    // Firefox 19+
    input::-moz-placeholder,
    textarea::-moz-placeholder {
        color: nth($placeholder, 2);
    }
    // Firefox 4-18
    input:-moz-placeholder,
    textarea:-moz-placeholder {
        color: nth($placeholder, 2);
    }
    // Internet Explorer 10+
    input:-ms-input-placeholder,
    textarea:-ms-input-placeholder {
        color: nth($placeholder, 2);
    }
}
```

根据前缀我们知道第一行代码是作用在谷歌浏览器，后两行代码作用在火狐浏览器，其中 `::-moz-placeholder` 用于 Mozilla Firefox 19+ 版本，而 `:-moz-placeholder` 用于 Mozilla Firefox 4-18 版本。效果图如下：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/01/1.png)