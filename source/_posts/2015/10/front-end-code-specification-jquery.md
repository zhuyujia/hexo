title: 前端编码规范——jquery 规范
date: 2015-10-12 16:02:06
categories: 规范
keywords: 前端,规范,前端规范,html,css,javascript,jquery,注释
tags: [前端规范,规范,jquery]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。本文为 jquery 规范。
---

## 前言 ##

这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。只要开发者们能够保证源代码源文件都严格遵循规范，那接下去所使用的混淆、压缩和编译工具则可投其所好不尽相同。

## jquery 规范 ##

### 缓存变量 ###

DOM 遍历是昂贵的，所以尽量将会重用的元素缓存。

``` javascript
// 糟糕
h = $('#element').height();
$('#element').css('height',h - 20);

// 建议
$element = $('#element');
h = $element.height();
$element.css('height',h - 20);
```

### 避免全局变量 ###

jquery 与 javascript 一样，一般来说，最好确保你的变量在函数作用域内。

``` javascript
// 糟糕
$element = $('#element');
h = $element.height();
$element.css('height',h - 20);

// 建议
var $element = $('#element');
var h = $element.height();
$element.css('height',h - 20);
```

### 使用匈牙利命名法 ###

使用[匈牙利命名法](http://www.wangyingran.com/archives/550.html)，添加 `$` 前缀，便于识别出 jquery 对象。

``` javascript
// 糟糕
var first = $('#first');
var second = $('#second');
var value = $first.val();

// 建议 - 在 jQuery 对象前加 $ 前缀
var $first = $('#first');
var $second = $('#second');
var value = $first.val();
```

### 使用 var 链（单 var 模式） ###

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

### 使用 on 来处理事件 ###

在新版 jquery 中，更短的 `on("click")` 用来取代类似 `click()` 这样的函数。在之前的版本中 `on()` 就是 `bind()`。自从 jquery 1.7 版本后，`on()` 是附加事件处理程序的首选方法。出于一致性考虑，你可以简单的全部使用 `on()` 方法。

``` javascript
// 糟糕
$first.click(function(){
    $first.css('border','1px solid red');
    $first.css('color','blue');
});
$first.hover(function(){
    $first.css('border','1px solid red');
});

// 建议
$first.on('click',function(){
    $first.css('border','1px solid red');
    $first.css('color','blue');
});
$first.on('hover',function(){
    $first.css('border','1px solid red');
});
```

### 精简 javascript ###

一般来说，最好尽可能合并函数。

``` javascript
// 糟糕
$first.click(function(){
    $first.css('border','1px solid red');
    $first.css('color','blue');
});

// 建议
$first.on('click',function(){
    $first.css({
        'border':'1px solid red',
        'color':'blue'
    });
});
```

### 链式操作 ###

jquery 实现方法的链式操作是非常容易的。

``` javascript
// 糟糕
$second.html(value);
$second.on('click', function(){
	alert('hello everybody');
});
$second.fadeIn('slow');
$second.animate({height: '120px'}, 500);

// 建议
$second.html(value);
$second.on('click', function(){
	alert('hello everybody');
}).fadeIn('slow').animate({height: '120px'}, 500);
```

### 维持代码的可读性 ###

伴随着精简代码和使用链式的同时，可能带来代码的难以阅读。添加缩紧和换行能起到很好的效果。

``` javascript
// 糟糕
$second.html(value);
$second.on('click',function(){
	alert('hello everybody');
}).fadeIn('slow').animate({height:'120px'},500);

// 建议
$second.html(value);
$second.on('click',function(){ alert('hello everybody');})
	   .fadeIn('slow')
	   .animate({height:'120px'},500);
```

### 选择短路求值 ###

短路求值是一个从左到右求值的表达式，用 `&&`（逻辑与）或 `||`（逻辑或）操作符。

``` javascript
// 糟糕
function initVar($myVar) {
	if(!$myVar) {
		$myVar = $('#selector');
	}
}

// 建议
function initVar($myVar) {
	$myVar = $myVar || $('#selector');
}
```

### 编码捷径 ###

精简代码的其中一种方式是利用编码捷径。

``` javascript
// 糟糕
if(collection.length > 0){..}

// 建议
if(collection.length){..}
```

### 繁重的操作中分离元素 ###

如果你打算对 DOM 元素做大量操作（连续设置多个属性或 css 样式），建议首先分离元素然后在添加。

``` javascript
// 糟糕
var $container = $("#container"),
    $containerLi = $("#container li"),
    $element = null;

$element = $containerLi.first();
//... 许多复杂的操作

// better
var $container = $("#container"),
    $containerLi = $container.find("li"),
    $element = null;

$element = $containerLi.first().detach();
//... 许多复杂的操作

$container.append($element);
```

### 熟记技巧 ###

你可能对使用 jquery 中的方法缺少经验，一定要多查看文档，可能会有一个更好或更快的方法来使用它。

``` javascript
// 糟糕
$('#id').data(key,value);

// 建议 (高效)
$.data('#id',key,value);
```

### 使用子查询缓存父元素 ###

正如前面所提到的，DOM 遍历是一项昂贵的操作。典型做法是缓存父元素并在选择子元素时重用这些缓存元素。

``` javascript
// 糟糕
var $container = $('#container'),
    $containerLi = $('#container li'),
    $containerLiSpan = $('#container li span');
 
// 建议 (高效)
var $container = $('#container '),
    $containerLi = $container.find('li'),
    $containerLiSpan= $containerLi.find('span');
```

### 避免通用选择符 ###

将通用选择符放到后代选择符中，性能非常糟糕。

``` javascript
// 糟糕
$('.container > *');

// 建议
$('.container').children();
```

### 避免隐式通用选择符 ###

通用选择符有时是隐式的，不容易发现。

``` javascript
// 糟糕
$('.someclass :radio');

// 建议
$('.someclass input:radio');
```

### 优化选择符 ###

例如，id 选择符应该是唯一的，所以没有必要添加额外的选择符。

``` javascript
// 糟糕
$('div#myid');
$('div#footer a.myLink');

// 建议
$('#myid');
$('#footer .myLink');
```

### 避免多个 id 选择符 ###

在此强调，id 选择符应该是唯一的，不需要添加额外的选择符，更不需要多个后代 id 选择符。

``` javascript
// 糟糕
$('#outer #inner');

// 建议
$('#inner');
```

### 坚持最新版本 ###

新版本通常更好：更轻量级，更高效。当然你需要考虑你要支持的代码的兼容性。例如，2.0 版本不支持 ie 6/7/8。

### 摒弃弃用方法 ###

关注每个新版本的废弃方法是非常重要的并尽量避免使用这些方法。

``` javascript
// 糟糕 - live 已经废弃
$('#stuff').live('click', function() {
	console.log('hooray');
});
// 建议
$('#stuff').on('click', function() {
	console.log('hooray');
});
// 注：此处可能不当，因为 live 能实现实时绑定，delegate 或许更合适
```

### 利用 CDN ###

CDN 能保证选择离用户最近的缓存并迅速响应。（推荐 jquery 官网提供的 CDN）。

### 必要时组合 jquery 和 javascript 原生代码 ###

如上所述，jquery 就是 javascript，这意味着用 jquery 能做的事情，同样可以用原生代码来做。原生代码的可读性和可维护性可能不如 jquery，而且代码更长。但也意味着更高效（通常更接近底层代码可读性越差，性能越高）。牢记没有任何框架能比原生代码更小，更轻，更高效。

## 系列文章 ##

- [前端编码规范——一般规范](http://zhuyujia.github.io/2015/10/front-end-code-specification-general.html)
- [前端编码规范——html 规范](http://zhuyujia.github.io/2015/10/front-end-code-specification-html.html)
- [前端编码规范——css 规范](http://zhuyujia.github.io/2015/10/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](http://zhuyujia.github.io/2015/10/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](http://zhuyujia.github.io/2015/10/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](http://zhuyujia.github.io/2015/10/front-end-code-specification-comment.html)

## 注 ##

本文转载自：[http://www.css88.com/archives/5240](http://www.css88.com/archives/5240)，略有修改。