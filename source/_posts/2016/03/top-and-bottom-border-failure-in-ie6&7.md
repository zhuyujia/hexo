title: a:hover 设置上下边框在 ie6 和 ie7 下失效
date: 2016-03-07 10:31:34
categories: css
description: 前段时间在写样式的时候发现了这个问题，虽然当时就解决了这个 bug 不过还是记录下，以免再次出现这样的问题。通过 demo 我们可以发现，在 ie6 和 ie7 浏览器中，鼠标移上去上下边框不显示只有左右边框显示，而其他浏览器都是正常显示，为什么呢？因为 a 标签在 ie6 和 ie7 中 hasLayout 属性为 false，至于何为 hasLayout？请谷歌或者百度，这里我就不多说了。
keywords: ie6, bug, ie, ie7, haslayout, zoom
tags: [ie6, bug, ie, ie7, haslayout, zoom]
---

前段时间在写样式的时候发现了这个问题，虽然当时就解决了这个 bug 不过还是记录下，以免再次出现这样的问题。

demo 代码：

``` html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>a:hover 设置上下边框在 ie6 和 ie7 下失效</title>
    <style>
    a{text-decoration:none;}
    a:hover{color:#f00;border:2px solid orange;}
    </style>
</head>
<body>
    <a href="javascript:;">a:hover 设置上下边框在 ie6 和 ie7 下失效</a>
</body>
</html>
```

通过 demo 我们可以发现，在 ie6 和 ie7 浏览器中，鼠标移上去上下边框不显示只有左右边框显示，而其他浏览器都是正常显示，为什么呢？因为 a 标签在 ie6 和 ie7 中 `hasLayout` 属性为 false，至于何为 `hasLayout`？请谷歌或者百度，这里我就不多说了。

既然知道了是 `hasLayout` 的问题，那么只需要设置 `hasLayout` 就行了，设置的方法有很多，下面就列出常用的 2 种方法：

``` css
a:hover{position:relative;}

a:hover{zoom:1;}
```

最后说明下：ie 下 80% 的 bug 都是由于元素没有 `hasLayout` 所造成的，所以如果在 ie 下碰到难以解释的问题，第一件事情要做的就是给该元素添加 `hasLayout`。