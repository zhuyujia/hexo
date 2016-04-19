title: 前端编码规范——注释规范
date: 2015-10-13 11:15:16
categories: 规范
keywords: 前端,规范,前端规范,html,css,javascript,jquery,注释
tags: [前端规范,规范,注释]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。本文为注释规范。
---

## 前言 ##

这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。

## 注释规范 ##

### 顶部注释 ###

文件顶部必须加上文件申明信息，包括文件描述、作者、最后更新(更新人和时间)

```
/*
* @description: 中文说明
* @author: name
* @update: name (2013-04-13 18:32)
*/
```

### 模块注释 ###

模块注释必须单独写在一行

```
/* module: module1 by 张三 */
…
/* module: module2 by 张三 */
```

### 单行注释与多行注释 ###

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

### 特殊注释 ###

用于标注修改、待办等信息

```
/* TODO: xxxx by name 2013-04-13 18:32 */

/* BUGFIX: xxxx by name 2012-04-13 18:32 */
```

### 区块注释 ###

对一个代码区块注释（可选），将样式语句分区块并在新行中对其注释。

```
/* Header */
/* Footer */
/* Gallery */
```

## 系列文章 ##

- [前端编码规范——一般规范](/2015/10/front-end-code-specification-general.html)
- [前端编码规范——html 规范](/2015/10/front-end-code-specification-html.html)
- [前端编码规范——css 规范](/2015/10/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](/2015/10/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](/2015/10/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](/2015/10/front-end-code-specification-comment.html)