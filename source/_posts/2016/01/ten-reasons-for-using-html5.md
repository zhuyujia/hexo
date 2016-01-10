title: 使用 html5 的十大原因
date: 2016-01-02 14:48:20
categories: html
description: 你难道还没有考虑使用 html5？ 当然我猜想你可能有自己的原因：它现在还没有被广泛的支持，在 ie 中不好使，或者你就是喜欢写比较严格的 xhtml 代码。html5 是 web 开发世界的一次重大的改变，事实上不管你是否喜欢，它都是代表着未来趋势。其实 html5 并不难理解和使用。我们这里能列出许多原因为什么现在要开始使用 html5。
keywords: html, html5
tags: [html, html5]
---

你难道还没有考虑使用 html5？ 当然我猜想你可能有自己的原因：它现在还没有被广泛的支持，在 ie 中不好使，或者你就是喜欢写比较严格的 xhtml 代码。html5 是 web 开发世界的一次重大的改变，事实上不管你是否喜欢，它都是代表着未来趋势。其实 html5 并不难理解和使用。我们这里能列出许多原因为什么现在要开始使用 html5。

目前有很多的文章介绍使用 html5 并且介绍了使用它的优势和好处，没错，这篇文章也类似。随着更多这样的文章，以及 apple 的支持，adobe 围绕 html5 的产品开发，以及移动 flash 的死亡，如此多网站的支持，我想对那些仍旧没有或者不想接受它的人说一些话。我认为主要得原因是，它看起来像一个神秘的东西。很多感觉它像喷气背包或者飞行汽车。一个未经验证的非凡想法但是并不实际。但是事实上现在已近非常的实际了。

为了解密 html5 并且帮助顽固的开发设计人员，我这里写了列出了使用 html5 的几大原因，希望对大家有帮助！

## 第十大原因：易用性 ##

两个原因使得使用 html5 创建网站更加简单：语义性和 aria。新的 html 标签像 `header`，`footer`，`nav`，`section`，`aside` 等等，使得阅读者更加容易去访问内容。在以前即使你定义了 `class` 或者 `id` 你的阅读者也没有办法去了解给出的 `div` 究竟是什么。使用新的语义学的定义标签，你可以更好的了解 html 文档，并且创建一个更好的使用体验。

aria 是一个 w3c 的标准主要用来对 html 文章中的元素指定“角色”，通过角色属性来创建重要的页面地形例如 `header`，`footer`，`navigation` 或者 `aritcle` 很有必要。这一点曾经被忽略掉了并且没有被广泛使用，因为事实上并不验证。然而 html5 将会验证这样属性。同时，html5 将会内建这些角色并且无法不覆盖。更多的 html5 和 aria 讨论，请大家查看这里。

## 第九大原因：视频和音频支持 ##

忘了 flash 和其它第三方应用吧，让你的视频和音频通过 html5 标签 `video` 和 `audio` 来访问资源。正确播放媒体一直都是一个非常可怕的事情，你需要使用 `embed` 和 `object` 标签，并且为了它们能正确播放必须赋予一大堆的参数。你的媒体标签将会非常复杂，大堆得令人迷惑的代码。而 html5 视频和音频标签基本将他们视为图片：`<video src=""/>`。但是其它参数例如宽度和高度或者自动播放呢？不必担心，只需要像其它 html 标签一样定义：`<video src="url" width="640px" height="380px" autoplay/>`。

实际上这个过程非常简单，然而我们的老浏览器可能并不喜欢我们的 html5，你需要添加更多代码来让他们正确工作。但是这个代码还是比 `embed` 和 `object` 来的简单的多。

``` html
<video poster="myvideo.jpg" controls>
    <source src="myvideo.m4v" type="video/mp4" />
    <source src="myvideo.ogg" type="video/ogg" />
    <embed src="/to/my/video/player"></embed>
</video>
```

## 第八大原因：doctype ##

``` html
<!doctype html>
```

没错，就是 `doctype`，没有更多内容了。是不是非常简单？不需要拷贝粘贴一堆无法理解的代码，也没有多余的 `head` 标签。最大的好消息在于，除了简单，它能在每一个浏览器中正常工作即使是名声狼藉的 ie6。

## 第七大原因：更清晰的代码 ##

如果你对于简单，优雅，容易阅读的代码有所偏好的话，html5 绝对是一个为你量身定做的东西。html5 允许你写出简单清晰富于描述的代码。符合语义学的代码允许你分开样式和内容。看看这个典型的简单拥有导航的 header 代码：

``` html
<div id="header">
    <h1>Header Text</h1>
    <div id="nav">
        <ul>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
        </ul>
    </div>
</div>
```

是不是很简单？但是使用 html5 后会使得代码更加简单并且富有含义：

``` html
<header>
    <h1>Header Text</h1>
    <nav>
        <ul>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
        </ul>
    </nav>
</header>
```

使用 html5 你可以通过使用语义行的 `header` 标签描述内容来最后解决你的 `div` 及 `class` 定义问题。以前你需要大量的使用 `div` 来定义每一个页面内容区域，但是使用新的 `section`，`article`，`header`，`footer`，`aside` 和 `nav` 标签，需要你让你的代码更加清晰易于阅读。

## 第六大原因：更聪明的存储 ##

html5 中最酷的特性就是本地存储。有一点像比较老的技术 cookie 和客户端数据库的融合。它比 cookie 更好用因为支持多个 windows 存储，它拥有更好的安全和性能，即使浏览器关闭后也可以保存。

因为它是个客户端的数据库，你不用担心用户删除任何 cookie，并且所有主流浏览器都支持。

本地存储对于很多情况来说都不错，它是 html5 工具中一个不需要第三方插件实现的。能够保存数据到用户的浏览器中意味你可以简单的创建一些应用特性例如：保存用户信息，缓存数据，加载用户上一次的应用状态。

更多关于本地存储**[请点此了解](http://zhuyujia.github.io/2015/12/html5-local-storage.html)**。

## 第五大原因：更好的互动 ##

我们都喜欢更好的互动，我们都喜欢对于用户有反馈的动态网站，用户可以享受互动的过程。输入 `canvas`，html5 的画图标签允许你做更多的互动和动画，就像我们使用 flash 达到的效果。

除了 `canvas`，html5 同样也拥有很多 api 允许你创建更加好的用户体验并且更加动态的 web 应用程序。这里有一个列表：

- Drag and Drop (DnD)
- Offline storage database
- Browser history management
- document editing
- Timed media playback

## 第四大原因：游戏开发 ##

没错， 你可以使用 html5 的 `canvas` 开发游戏。html5 提供了一个非常伟大的，移动友好的方式去开发有趣互动的游戏。如果你开发 flash 游戏，你就会喜欢上 html5 的游戏开发。

*Script-tutorials* 目前提供了 4 个部分的 html5 游戏开发教程，这里看看他们开发的有趣游戏：

- [HTML5 Gaming Development Lesson One](https://www.script-tutorials.com/html5-game-development-lesson-1/)
- [HTML5 Gaming Development Lesson Two](https://www.script-tutorials.com/html5-game-development-lesson-2/)
- [HTML5 Gaming Development Lesson Three](https://www.script-tutorials.com/html5-game-development-lesson-3/)
- [HTML5 Gaming Development Lesson Four](https://www.script-tutorials.com/html5-game-development-lesson-4/)

## 第三大原因： 遗留及其跨浏览器支持 ##

你的现代流行浏览器都支持 html5（chrome，firefox，safari，ie9 和 opera），并且创建了 html5 doctype 这样所有的浏览器，即使非常老非常令人厌恶浏览器像 ie6 都可以使用。但是因为老的浏览器能够识别 doctype 并不意味它可以处理 html5 标签和功能。幸运的是，html5 已经使得开发更加简单了，支持更多浏览器，这样老的 ie 浏览器可以通过添加 js 代码来使用新的元素：

``` html
<!--[if lt IE 9]>
<script src="html5shiv.js"></script>
<![endif]-->
```

具体内容**[点此了解详情](http://zhuyujia.github.io/2015/12/let-ie-support-html5-tags.html)**。

## 第二大原因： 移动，移动还是移动 ##

你可以称之为“直觉”，但是我认为移动技术将会变得更加的流行。我知道，这里有些非常疯狂的猜测，有些可能你也想到了 – mobile 是一个时尚！移动设备将占领世界。更多的接受移动设备将会增长的非常迅速，这意味着更多的用户会选择使用移动设备访问网站或者 web 应用。html5 是最移动化的开发工具。随着 adobe 宣布放弃移动 flash 开发，你将会考虑使用 html5 来开发 webapp 应用。

当手机浏览器完全支持 html5 那么开发移动项目将会和设计更小的触摸显示一样简单。这里有很多的 `meta` 标签允许你优化移动：

- viewport：允许你定义 `viewport` 宽度和缩放设置；
- 全屏浏览器：ios 指定的数值允许 apple 设备全屏模式显示；
- Home screen icons：就像桌面收藏，这些图标可以用来添加收藏到 ios 和 android 移动设备的首页。

## 第一大原因： 它是未来，开始用吧！ ##

最大的原因今天你就开始使用 html5 是因为它是未来，不要掉队了！html5 不会往每个方向发展，但是更多的元素已经被很多公司采用，并且开始着手开发。html5 其实更像 html，它不是一个新的技术需要你重新学习！如果你开发 xhtml strict 的话你现在就已经在开发 html5 了。为什么不更完整的享受 html5 的功能呢？

你实际上没有任何借口不接受 html5。事实上我唯一一个原因使用 html5 是因为它书写代码简单清晰。其它的特性其实我也没有真正使用。你可以考虑现在开始使用 html5 书写代码，它能帮助你改变书写代码的方式及其设计方式。开始用 html5 代码编写 web 应用吧，说不定下一个移动应用或者游戏应用就是用 html5 开发的！

> 英文原文：[Top 10 Reasons to Use HTML5 Right Now](http://tympanus.net/codrops/2011/11/24/top-10-reasons-to-use-html5-right-now/)  
> 转载地址：[使用 html5 的十大原因 - 月光博客](http://www.williamlong.info/archives/3024.html)