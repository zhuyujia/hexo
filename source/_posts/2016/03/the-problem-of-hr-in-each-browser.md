title: 关于 hr 在各浏览器中的问题
date: 2016-03-04 17:39:04
categories: css
keywords: html, css, hr, 分割线
tags: [html, css, hr, 分割线]
---

在做页面是有时候会用到分割线 `hr`，但是在 ie6 和 ie7 下显示很蛋疼，本文将教你如何写出兼容各浏览器的 `hr`。
<!--more-->

首页我们先了解下 `hr` 在各浏览器下的差异，如下表格：

|  | 正常浏览器 | ie6、ie7 | firefox |
| --- | --- | --- | --- |
| 实际高度 |	height + border | height | height |
| 背景色 | background-color | background-color（当高度 <= 2px 时，显示高度背景色为灰色，需要 color 来设置颜色） | background-color |

比如想创建一个实际高度为 3px，边框为 1px，边框颜色为 #07f，背景色为 #f60 的分割线：

``` scss
hr { 
    height: 1px;
    background-color: #f60;
    border: 1px solid #000;
    *height: 3px;
    color: #f60;
}
@-moz-document url-prefix(){
	hr {
		height: 3px;
	}
}
```