title: 浅谈 inline-block
date: 2016-02-15 16:18:59
categories: css
keywords: css, inline, inline-block
tags: [css, inline, inline-block]
---

如今有很多网站都用上了 `inline-block` 属性，比如 `{display:inline-block; *display:inline; *zoom:1}`，以上 css 代码随处可见。很多人看见 `*display:inline; *zoom:1` 就下意识的认为：哦，原来 `inline-block` 这个属性 ie6/7 不支持。那么 ie6/7 真的不支持 `display:inline-block` 吗？
<!--more-->

事实上，ie 从 5.5 开始就已经支持 `display:inline-block` 了，只是支持的并不是那么完美。具体的请阅读[淘宝 ued 官方博客](http://ued.taobao.org/blog/)——一丝所写的[《inline-block 前世今生》](http://ued.taobao.org/blog/2012/08/inline-block/)。

当我们使用 `inline-block` 的时候，就会产生“空白间隙”问题。代码如下：

``` html
<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <title>inline-block</title>
    <link rel="stylesheet" href="css/base.css"/>
    <style>
    li{
        display:inline-block;
        *display:inline;
        *zoom:1;
    }
    </style>
</head>
<body>
    <ul>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
    </ul>
</body>
</html>
```

效果图如下：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/02/1.png)

我们可以看到：在 ie8、chrome、firefox、opera 以及 safari 浏览器下，两张图片之间有“空白间隙”。

但是在 ie6 和 ie7 浏览器下却正常显示，效果如下：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/02/2.png)

下面我们就来说说这个“空白间隙”是如何产生的，以及解决办法。

先来说说“空白间隙”是怎么产生的？先看下源代码：

``` html
<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <title>inline-block</title>
    <link rel="stylesheet" href="css/base.css"/>
    <style>
    li{
        display:inline-block;
        *display:inline;
        *zoom:1;
    }
    </style>
</head>
<body>
    <ul>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
    </ul>
</body>
</html>
```

从上面的代码我们很难发现产生“空白间隙”的问题。其实这个问题是我们写代码的习惯所造成的。平时我们写代码，为了使代码看上去“层级分明”，通常会在标签结束符后顺手打个回车，而回车会产生回车符，回车符相当于空白符，通常情况下，多个连续的空白符会合并成一个空白符，而产生“空白间隙”的真正原因就是这个让我们并不怎么注意的空白符。

既然我们已经知道产生问题的原因了，那么就很好解决该问题。空白符也是字符，只要是字符就会联想到字体，字体大小之类的。所以去除空白符的存在只需要设置字体大小为零就行了（`font-size:0;`）。修改已上代码：

``` html
<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <title>inline-block</title>
    <link rel="stylesheet" href="css/base.css"/>
    <style>
    ul{
        font-size:0;
    }
    li{
        display:inline-block;
        *display:inline;
        *zoom:1;
    }
    </style>
</head>
<body>
    <ul>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
    </ul>
</body>
</html>
```

可以看到在 ie8，firefox，chrome 和 opera 浏览器下已经没有问题了，但是在 safari 浏览器下还是有问题。

关于 safari 浏览器的兼容，请阅读[大漠](http://www.w3cplus.com/)写的《[如何解决inline-block元素的空白间距](http://www.w3cplus.com/css/fighting-the-space-between-inline-block-elements)》。

最后整理：

``` html
<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <title>inline-block</title>
    <link rel="stylesheet" href="css/base.css"/>
    <style>
    ul{
        font-size:0;
        letter-spacing: -8px;/*根据不同字体字号或许需要做一定的调整*/
        word-spacing: -8px;
    }
    li{
        display:inline-block;
        *display:inline;
        *zoom:1;
        letter-spacing:normal;
        word-spacing:normal;
    }
    </style>
</head>
<body>
    <ul>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
    </ul>
</body>
</html>
```

兼容浏览器：ie6，ie7，ie8，chrome，firefox，safari，opera。