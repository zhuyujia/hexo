title: 固定宽度文字换行
date: 2016-01-19 10:28:38
categories: css
keywords: css, display, inline-block, white-space, nowrap
tags: [css, display, inline-block, white-space, nowrap]
---

如题：在固定宽度的块级元素中，里面的内容最后一词组在宽度不够的情况下没有换行，如何让它换到下一行？
<!--more-->

首先给出问题，截图如下：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/01/3.png)

**Html**

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>固定宽度文字换行</title>
    <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
    <div class="demo">
        <a href="#">测试</a>
        <a href="#">测试</a>
        <a href="#">测测试试</a>
        <a href="#">测试</a>
        <a href="#">测试</a>
        <a href="#">测测试试</a>
        <a href="#">测试</a>
    </div>
</body>
</html>
```

**Css**

``` scss
@charset "utf-8";
@import "E:/zSass/_config.scss";
@import "E:/zSass/_reset.scss";
@import "E:/zSass/_common.scss";

a {
    color:#00f;
}
.demo {
    overflow:hidden;
    width:100px;
    margin-top:50px;
    @include center-block();
    padding:5px;
    border:1px solid #000;
    background-color:#aaa;
    font-family:SimSun;
    line-height:20px;
}
```

我们可以看出第一行和第二行由于宽度不够导致词组断开了，解决这个问题有两种方法。

**方法一：**`display:inline-block;`

**Css**

``` scss
@charset "utf-8";
@import "E:/zSass/_config.scss";
@import "E:/zSass/_reset.scss";
@import "E:/zSass/_common.scss";

a {
    color:#00f;
}
.demo {
    overflow:hidden;
    width:100px;
    margin-top:50px;
    @include center-block();
    padding:5px;
    border:1px solid #000;
    background-color:#aaa;
    font-family:SimSun;
    line-height:20px;
    a {
        @include inline-block();
    }
}
```

**方法二：**`float:left;white-space:nowrap;`

**Css**

``` scss
@charset "utf-8";
@import "E:/zSass/_config.scss";
@import "E:/zSass/_reset.scss";
@import "E:/zSass/_common.scss";

a {
    color:#00f;
}
.demo {
    overflow:hidden;
    width:100px;
    margin-top:50px;
    @include center-block();
    padding:5px;
    border:1px solid #000;
    background-color:#aaa;
    font-family:SimSun;
    line-height:20px;
    a {
        @include float();
        margin-right:5px;
        white-space:nowrap;
    }
}
```

测试浏览器：chrome/firefox/ie6-11