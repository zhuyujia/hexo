title: ie6 中 li 插入图片后有空隙
date: 2016-01-25 14:35:22
categories: css
keywords: css, ie6, vertical-align, display
tags: [css, ie6, vertical-align, display]
---

ie6 中 `li` 插入图片后下方有空隙 bug，这是 ie6 的经典 bug。解决方法有很多，今天我整理了下，共 5 种，给大家分享下。
<!--more-->

## Demo ##

**html**

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>demo</title>
    <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
    <ul>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
        <li><img src="images/cat.jpg"/></li>
    </ul>
</body>
</html>
```

**Css**

``` scss
@charset "utf-8";
@import "E:/my_project/zSass/base";

ul {
    width:774px;
    @include center-block;
    li {
        @include float;
        width:162px;
        height:162px;
        margin:0 10px 10px 0;
        background-color:#f00;
    }
}
```

我们可以看到在 ie6 下 `li` 中图片下方有大约 1~2px 的空隙，即使我们给 `li` 宽高和图片一样也没用，如图所示：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/01/4.png)

## 产生原因 ##

我们知道，在写代码的时候，为了代码的整洁以及可读性，我们通常会进行类似 `tab` 缩进和 `enter` 换行，而这个问题就是**回车换行**所造成的，回车的时候会自动产生一个回车符，在 ie6 下会解析回车符，其他浏览器不会解析回车符，而回车符也算是字符的一种，也会有大小及行高之类的，所以在 ie6 下就会造成上述 bug。

## 解决方法 ##

**第一种方法：**最简单，最方便也最暴力的就是什么也不需要做，只需要压缩 html 代码就可以了，当然对于 html 代码的可读性以及可维护性就不那么友好了。

**第二种方法：**由于回车符是 `li` 之间产生的，又是字符，那么我们可以改变其字符大小就行了，代码如下：

``` css
ul {
	font-size:0;
}
```

**第三种方法：**给 `li` 添加 `overflow:hidden;`。

**第四种方法：**设置 `img` 为 `display:block;`。

**第五种方法：**设置 `img` 为 `vertical-align:top/middle/bottom;`

测试浏览器：chrome/firefox/ie6-11