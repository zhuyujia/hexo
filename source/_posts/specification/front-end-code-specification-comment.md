title: 前端编码规范——注释规范
date: 2015-10-13 11:15:16
categories: 规范
keywords: 前端, 规范, 前端规范, html, css, javascript, jquery, 注释
tags: [前端规范, 规范, 注释]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript，jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。本文为注释规范。
---

## 文件申明 ##

顶部添加文件申明信息，包括文件描述、原始作者，如果有更新，则需要添加更新内容、更新作者和更新时间

```
/**
 * @description: 说明文字
 * @author: 张三
 */

/**
 * @description: 说明文字
 * @author: 张三
 * @update: 更新内容 by 李四 2013-04-13 18:32
 */
```

## 单行注释与多行注释 ##

无论是单行注释还是多行注释，注释中的每一行长度都不能超过 **40** 个汉字，或者 **80** 个英文字符。

**单行注释**

```
/* this is a short comment */
```

**多行注释**

```
/*
* this is comment line 1.
* this is comment line 2.
*/
```

## 函数或方法注释 ##

``` javascript
/**
 * 这是一个求和函数
 * @param  {Number} a 第一个数字
 * @param  {Number} b 第二个数字
 * @return {Number}   返回两个数字之和
 */
var sum = function(a, b) {
    return a + b;
}
```

## 模块注释 ##

模块注释必须单独写在一行

```
/* 模块：xxxxxx by 张三 */
...
/* 模块：xxxxxx by 张三 */
```

## 样式区块注释 ##

```
/* header */
...
/* footer */
...
/* banner */
...
```

## 系列文章 ##

- [前端编码规范——一般规范](/specification/front-end-code-specification-general.html)
- [前端编码规范——html 规范](/specification/front-end-code-specification-html.html)
- [前端编码规范——css 规范](/specification/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](/specification/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](/specification/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](/specification/front-end-code-specification-comment.html)