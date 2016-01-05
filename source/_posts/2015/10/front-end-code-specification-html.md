title: 前端编码规范——html 规范
date: 2015-10-12 09:54:21
categories: 规范
keywords: 前端,规范,前端规范,html,css,javascript,jquery,注释
tags: [前端规范,规范,html]
description: 这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。本文为 html 规范。
---

## 前言 ##

这是一份旨在增强团队的开发协作，提高代码质量和打造开发基石的编码风格规范，其中包含了 html，css，javascript 和 jquery 这几个部分。我们知道，当一个团队开始指定并实行编码规范的话，错误就会变得更加显而易见。如果一段特定的代码不符合规范的话，它有可能只是代码风格错误，而也有可能会是 bug。早期指定规范就使得代码审核得以更好的开展，并且可以更精确的地定位到错误。只要开发者们能够保证源代码源文件都严格遵循规范，那接下去所使用的混淆、压缩和编译工具则可投其所好不尽相同。

## html 规范 ##

### 文档类型 ###

推荐使用 HTML5 的文档类型申明：

``` html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>Document</title>
</head>
<body>
</body>
</html>
```

### html 验证 ##

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

### 省略可选标签 ###

html5 规范中规定了 html 标签是可以省略的。但从可读性来说，在开发的源文件中最好不要这样做，因为省略标签可能会导致一些问题。

省略一些可选的标签确实使得页面大小减少，这很有用，尤其是对于一些大型网站来说。为了达到这一目的，我们可以在开发后期对页面进行压缩处理，在这个环节中这些可选的标签完全就可以省略掉了。

### 脚本加载 ###

出于性能考虑，脚本异步加载很关键。一段脚本放置在 `head` 内，比如 `<script src="main.js"></script>`，其加载会一直阻塞 DOM 解析，直至它完全地加载和执行完毕。这会造成页面显示的延迟。特别是一些重量级的脚本，对用户体验来说那真是一个巨大的影响。

异步加载脚本可缓解这种性能影响。如果只需兼容 ie10+，可将 html5 的 `async` 属性加至脚本中，它可防止阻塞 DOM 的解析，甚至你可以将脚本引用写在 `head` 里也没有影响。

如需兼容老旧的浏览器，实践表明可使用用来动态注入脚本的脚本加载器。你可以考虑 [yepnope](http://yepnopejs.com/) 或 [labjs](http://labjs.com/)。注入脚本的一个问题是：[一直要等到 css 对象文档已就绪，它们才开始加载](https://www.igvita.com/2014/05/20/script-injected-async-scripts-considered-harmful/)（短暂地在 css 加载完毕之后），这就对需要及时触发的 js 造成了一定的延迟，这多多少少也影响了用户体验吧。

终上所述，兼容老旧浏览器（ie9-）时，应该遵循以下最佳实践：

脚本引用写在 `body` 结束标签之前，并带上 `async` 属性。这虽然在老旧浏览器中不会异步加载脚本，但它只阻塞了 `body` 结束标签之后的 DOM 解析，这就大大降低了其阻塞影响。而在现代浏览器中，脚本将在 DOM 解析器发现 `body` 尾部的 `script` 标签才进行加载，此时加载属于异步加载，不会阻塞 CSSOM（但其执行仍发生在 CSSOM 之后）。

**所有浏览器中，推荐**

``` html
<html>
	<head>
		<link rel="stylesheet" href="main.css">
	</head>
	<body>
    	<!-- body goes here -->
		<script src="main.js" async></script>
	</body>
</html>
```

**只在现代浏览器中，推荐**

``` html
<html>
	<head>
		<link rel="stylesheet" href="main.css">
		<script src="main.js" async></script>
	</head>
	<body>
		<!-- body goes here -->
	</body>
</html>
```

### 语义化 ###

根据元素（有时被错误地称作“标签”）其被创造出来时的初始意义来使用它。打个比方，用 `h1-6` 元素来定义头部标题，`p` 元素来定义文字段落，用 `a` 元素来定义链接锚点等等。

有根据有目的地使用 html 元素，对于可访问性、代码重用、代码效率来说意义重大。

### 多媒体 ###

对页面上的媒体而言，像图片、视频、canvas 动画等，要确保其有可替代的接入接口。图片文件我们可采用有意义的备选文本（alt），视频和音频文件我们可以为其加上说明文字或字幕。

提供可替代内容对可用性来说十分重要。（图片的 alt 属性是可不填写内容的，纯装饰性的图片就可用这么做：`alt=""`）。

**不推荐**

``` html
<img src="luke-skywalker.jpg">
```

**推荐**

``` html
<img src="luke-skywalker.jpg" alt="Luke skywalker riding an alien horse">
```

尽量用 alt 标签去描述图片，设想你需要对于那些只能通过语音或者看不见图片的用户表达图片到底是什么。

### 结构，表现与行为分离 ###

一个完整的页面分为三个部分：结构（html）、表现（css）和行为（javascript）。为了使它们成为可维护的干净整洁的代码，我们要尽可能的将它们分离开来。

严格地保证结构、表现、行为三者分离，并尽量使三者之间没有太多的交互和联系。就是说，尽量在文档和模板中只包含结构性的 html；而将所有表现代码，移入样式表中；将所有动作行为，移入脚本之中。在此之外，为使得它们之间的联系尽可能的小，在文档和模板中也尽量少地引入样式和脚本文件。

清晰的分层意味着：

- 不使用超过一到两张样式表（style.css，index.css）
- 尽量合并脚本（将所有效果都写在 main.js 中）
- 不使用内嵌样式（`<style>.no-good {}</style>`）
- 不使用行内样式（`<hr style="border-top: 5px solid black">`）
- 不使用内嵌脚本（`<script>alert('no good')</script>`）
- 不使用表现元素（`<b>`，`<u>`，`<center>`，`<font>`）

### html 内容至上 ###

不要让非内容信息污染了你的 html。现在貌似有一种倾向：通过 html 来解决设计问题，这是显然是不对的。html 就应该只关注内容。

html 标签的目的，就是为了不断地展示内容信息：

- 不要引入一些特定的 html 结构来解决一些视觉设计问题
- 不要将 `img` 元素当做专门用来做视觉设计的元素

以下例子展示了误将 html 用来解决设计问题的这两种情况：

**不推荐**

``` html
<!-- We should not introduce an additional element just to solve a design problem  -->
<span class="text-box">
	<span class="square"></span>
	See the square next to me?
</span>
```

``` css
.text-box > .square {
	display: inline-block;
	width: 1rem;
	height: 1rem;
	background-color: red;
}
```

**推荐**

``` html
<!-- That's clean markup! -->
<span class="text-box">
	See the square next to me?
</span>
```

``` css
/* We use a :before pseudo element to solve the design problem of placing a colored square in front of the text content */
.text-box:before {
	content: "";
	display: inline-block;
	width: 1rem;
	height: 1rem;
	background-color: red;
}
```

图片和 svg 图形能被引入到 html 中的唯一理由是它们呈现出了与内容相关的一些信息。

**不推荐**

``` html
<!-- Content images should never be used for design elements!  -->
<span class="text-box">
	<img src="square.svg" alt="Square" />
	See the square next to me?
</span>
```

**推荐**

``` html
<!-- That's clean markup! -->
<span class="text-box">
	See the square next to me?
</span>
```

``` css
/* We use a :before pseudo element with a background image to solve the problem */
.text-box:before {
	content: "";
	display: inline-block;
	width: 1rem;
	height: 1rem;
	background: url(square.svg) no-repeat;
	background-size: 100%;
}
```

### type 属性 ###

省略样式表与脚本上的 `type` 属性。鉴于 html5 中以上两者默认的 `type` 值就是 `text/css` 和 `text/javascript`，所以 `type` 属性一般是可以忽略掉的。甚至在老旧版本的浏览器中这么做也是安全可靠的。

### 可用性 ###

如果 html5 语义化标签使用得当，许多可用性问题已经引刃而解。aria 规则在一些语义化的元素上可为其添上默认的可用性角色属性，使用得当的话已使网站的可用性大部分成立。假如你使用 `nav`，`aside`，`main`，`footer` 等元素，aria 规则会在其上应用一些关联的默认值。更多细节可参考 [aria specification](http://rawgit.com/w3c/aria-in-html/master/index.html#recommendations-table)

另外一些角色属性则能够用来呈现更多可用性情景（`role="tab"`）。

### tab index 在可用性上的运用 ###

检查文档中的 tab 切换顺序并传值给元素上的 `tabindex`，这可以依据元素的重要性来重新排列其 tab 切换顺序。你可以设置 `tabindex="-1"` 在任何元素上来禁用其 tab 切换。

当你在一个默认不可聚焦的元素上增加了功能，你应该总是为其加上 `tabindex` 属性使其变为可聚焦状态，而且这也会激活其 css 的伪类 `:focus`。选择合适的 `tabindex` 值，或是直接使用 `tabindex="0"` 将元素们组织成同一 tab 顺序水平，并强制干预其自然阅读顺序。

### 微格式在 seo 和可用性上的运用 ###

如果 seo 和可用性环境条件允许的话，建议考虑采用微格式。微格式是通过在元素标签上申明一系列特定数据来达成特定语义的方法。

谷歌、微软和雅虎对如何使用这些额外的数据一定程度上的达成一致，如果正确的使用，这将给搜索引擎优化带来巨大的好处。

你可以访问 [schema.org](http://schema.org/) 获得更多内容细节。

看一个电影网站的简单例子：

**不带微格式**

``` html
<div>
	<h1>Avatar</h1>
	<span>Director: James Cameron (born August 16, 1954)</span>
	<span>Science fiction</span>
	<a href="../movies/avatar-theatrical-trailer.html">Trailer</a>
</div>
```

**带有微格式**

``` html
<div itemscope itemtype ="http://schema.org/Movie">
	<h1 itemprop="name">Avatar</h1>
	<div itemprop="director" itemscope itemtype="http://schema.org/Person">
	Director: <span itemprop="name">James Cameron</span> (born <span itemprop="birthDate">August 16, 1954)</span>
	</div>
	<span itemprop="genre">Science fiction</span>
	<a href="../movies/avatar-theatrical-trailer.html" itemprop="trailer">Trailer</a>
</div>
```

### id 和锚点 ###

通常一个比较好的做法是将页面内所有的头部标题元素都加上 id. 这样做，页面 url 的 hash 中带上对应的 id 名称，即形成描点，方便跳转至对应元素所处位置。

打个比方，当你在浏览器中输入 `http://your-site.com/about#best-practices`，浏览器将定位至以下 h3 上。

``` html
<h3 id="best-practices">Best practices</h3>
```

### html 引号 ###

使用双引号（""）而不是单引号（''）。

## 系列文章 ##

- [前端编码规范——一般规范](/2015/10/front-end-code-specification-general.html)
- [前端编码规范——html 规范](/2015/10/front-end-code-specification-html.html)
- [前端编码规范——css 规范](/2015/10/front-end-code-specification-css.html)
- [前端编码规范——javascript 规范](/2015/10/front-end-code-specification-javascript.html)
- [前端编码规范——jquery 规范](/2015/10/front-end-code-specification-jquery.html)
- [前端编码规范——注释规范](/2015/10/front-end-code-specification-comment.html)

## 注 ##

原文：[Web Styleguide - Style guide to harmonize HTML, Javascript and CSS / Sass coding style](https://github.com/gionkunz/chartist-js/blob/develop/CODINGSTYLE.md)

本文转载自：[http://www.css88.com/archives/5364](http://www.css88.com/archives/5364)，略有修改。