title: 前端编码规范——jquery 规范
date: 2015-10-12 16:02:06
categories: 规范
keywords: 前端, 规范, 前端规范, html, css, javascript, jquery, 注释
tags: [前端规范, 规范, jquery]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript，jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。本文为 jquery 规范。
---

## 使用单引号 ##

**不推荐**

``` javascript
$("div").html("<img src='1.jpg'/>");
```

**推荐**

``` javascript
$('div').html('<img src="1.jpg"/>');
```

## 缓存变量 ##

DOM 遍历是昂贵的，所以尽量将会重用的元素缓存。

**不推荐**

``` javascript
var h = $('#element').height();
$('#element').css('height', h - 20);
```

**推荐**

``` javascript
var $element = $('#element'),
    h = $element.height();
$element.css('height', h - 20);
```

## 避免全局变量 ##

jquery 与 javascript 一样，一般来说，最好确保你的变量在函数作用域内。

**不推荐**

``` javascript
$element = $('#element');
h = $element.height();
$element.css('height',h - 20);
```

**推荐**

``` javascript
var $element = $('#element'),
    h = $element.height();
$element.css('height',h - 20);
```

## 使用驼峰式命名 ##

使用[驼峰式](/specification/javascript-variable-naming-rule.html)命名，在前面添加 `$` 作为前缀，以便于标示为 jquery 对象。

**不推荐**

``` javascript
var first = $('#first'),
    second = $('#second'),
    value = $first.val();
```

**推荐**

``` javascript
var $first = $('#first'),
    $second = $('#second'),
    value = $first.val();
```

## 使用单 var 模式 ##

将多条 `var` 语句合并为一条语句，建议将未赋值的变量放到后面。

``` javascript
var $first = $('#first'),
	$second = $('#second'),
	value = $first.val(),
	k = 3,
	cookiestring = 'SOMECOOKIESPLEASE',
	i,
	j,
	myArray = {};
```

## 使用 on 来处理事件 ##

在新版 jquery 中，更短的 `on('click')` 用来取代类似 `click()` 这样的函数。在之前的版本中 `on()` 就是 `bind()`。自从 jquery 1.7 版本后，`on()` 是附加事件处理程序的首选方法。出于一致性考虑，你可以简单的全部使用 `on()` 方法。

**不推荐**

``` javascript
$first.click(function(){
    $first.css('border', '1px solid red');
    $first.css('color', 'blue');
});
$first.hover(function(){
    $first.css('border', '1px solid red');
});
```

**推荐**

``` javascript
$first.on('click', function(){
    $first.css('border', '1px solid red');
    $first.css('color', 'blue');
});
$first.on('hover', function(){
    $first.css('border', '1px solid red');
});
```

## 精简 jquery ##

一般来说，最好尽可能合并属性。

**不推荐**

``` javascript
$first.click(function(){
    $first.css('border', '1px solid red');
    $first.css('color', 'blue');
});
```

**推荐**

``` javascript
$first.on('click', function(){
    $first.css({
        'border':'1px solid red',
        'color':'blue'
    });
});
```

## 链式操作 ##

jquery 能够很轻易的实现链式操作。

**不推荐**

``` javascript
$second.html(value);
$second.on('click', function(){
    alert('hello everybody');
});
$second.fadeIn('slow');
$second.animate({height: '120px'}, 500);
```

**推荐**

``` javascript
$second.html(value).on('click', function(){
    alert('hello everybody');
}).fadeIn('slow').animate({height: '120px'}, 500);
```

## 维持代码的可读性 ##

伴随着精简代码和使用链式的同时，可能带来代码的难以阅读。添加缩进和换行能起到很好的效果。

**不推荐**

``` javascript
$second.html(value).on('click', function(){
    alert('hello everybody');
}).fadeIn('slow').animate({height: '120px'}, 500);
```

**推荐**

``` javascript
$second.html(value)
    .on('click', function() {
        alert('hello everybody');
    })
    .fadeIn('slow')
    .animate({
        height: '120px'
    }, 500);
```

## 选择短路求值 ##

短路求值是一个从左到右求值的表达式，用 `&&` 或 `||` 操作符。

**不推荐**

``` javascript
function initVar($myVar) {
    if (!$myVar) {
        $myVar = $('#selector');
    }
}
```

**推荐**

``` javascript
function initVar($myVar) {
    $myVar = $myVar || $('#selector');
}
```

## 避免通用选择符 ##

**不推荐**

``` javascript
$('.container > *');
```

**推荐**

``` javascript
$('.container').children();
```

## 缓存父元素 ##

正如前面所提到的，DOM 遍历是一项昂贵的操作。典型做法是缓存父元素并在选择子元素时重用这些缓存元素。

**不推荐**

``` javascript
var $container = $('#container'),
    $containerLi = $('#container li'),
    $containerLiSpan = $('#container li span');
```

**推荐**

``` javascript
var $container = $('#container '),
    $containerLi = $container.find('li'),
    $containerLiSpan= $containerLi.find('span');
```

## 避免隐式通用选择符 ##

通用选择符有时是隐式的，不容易发现。

**不推荐**

``` javascript
$(':button');
```

**推荐**

``` javascript
$('input:button');
```

## 优化选择符 ##

例如，id 选择符应该是唯一的，所以没有必要添加额外的选择符。

**不推荐**

``` javascript
$('div#myid');
$('div#footer a.myLink');
```

**推荐**

``` javascript
$('#myid');
$('#footer .myLink');
```

## 避免多个 id 选择符 ##

在此强调，id 选择符应该是唯一的，不需要添加额外的选择符，更不需要多个后代 id 选择符。

**不推荐**

``` javascript
$('#outer #inner');
```

**推荐**

``` javascript
$('#inner');
```

## 熟记技巧 ##

你可能对使用 jquery 中的方法缺少经验，一定要多查看文档，可能会有一个更好或更快的方法来使用它。

**不推荐**

``` javascript
$('#id').data(key, value);
```

**推荐**

``` javascript
$.data('#id', key, value);
```

## 坚持最新版本 ##

新版本通常更好：更轻量级，更高效。当然你需要考虑你要支持的代码的兼容性。例如，2.0 版本不支持 ie 6/7/8。

## 摒弃弃用方法 ##

关注每个新版本的废弃方法是非常重要的并尽量避免使用这些方法。

**不推荐**

``` javascript
$('#stuff').live('click', function() {
	console.log('hooray');
});
```

**推荐**

``` javascript
$('#stuff').on('click', function() {
	console.log('hooray');
});
```

## 利用 CDN ##

CDN 能保证选择离用户最近的缓存并迅速响应。（推荐 jquery 官网提供的 CDN）。

## 必要时组合 jquery 和 javascript 原生代码 ##

如上所述，jquery 就是 javascript，这意味着用 jquery 能做的事情，同样可以用原生代码来做。原生代码的可读性和可维护性可能不如 jquery，而且代码更长。但也意味着更高效（通常更接近底层代码可读性越差，性能越高）。牢记没有任何框架能比原生代码更小，更轻，更高效。

## 系列文章 ##

- [前端编码规范——一般规范](/specification/front-end-code-specification-general.html)
- [前端编码规范——html 规范](/specification/front-end-code-specification-html.html)
- [前端编码规范——css 规范](/specification/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](/specification/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](/specification/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](/specification/front-end-code-specification-comment.html)

## 参考文献 ##

> [http://www.css88.com/archives/5240](http://www.css88.com/archives/5240)