title: 绝对定位的元素在 ie6 下不显示
date: 2016-02-17 10:50:24
categories: css
description: 只有当绝对定位元素的邻近浮动元素的宽度大于父层宽度减 3 时（即如果父层宽度是 300px，浮动层的宽度大于 297px），该绝对定位元素在 ie6 下面会隐藏。
keywords: css, ie6, 绝对定位, absolute, 3px, ie6bug, bug
tags: [css, ie6, 绝对定位, absolute, 3px, ie6bug, bug]
---

## 问题描述 ##

在 ie6 中如果一个浮动元素与绝对定位元素相邻的话，在某些情况下绝对定位元素将会消失。

## 产生原因 ##

只有当绝对定位元素的邻近浮动元素的宽度大于父层宽度减 3 时（即如果父层宽度是 300px，浮动元素的宽度大于 297px），该绝对定位元素在 ie6 下面会隐藏。

### html 代码 ###

``` html
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>绝对定位的元素在ie6下不显示</title>
</head>
<body>
    <div class="w">
        <div class="fl">浮动元素</div>
        <div class="pa">绝对定位元素</div>
    </div>
</body>
</html>
```

### css 代码 ###

``` css
.w{border:3px solid #000;color:#fff;height:200px;position:relative;width:300px;}
.pa{background:orange;height:100px;position:absolute;right:10px;top:10px;width:100px;}
.fl{background:gray;float:left;height:100px;width:100%;}
```

### ie6 浏览器效果 ###

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/02/3.png)

### 其他浏览器效果 ###

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/02/4.png)

## 解决方法 ##

1、调整浮动元素的宽度，即宽度小于或等于父层宽度减 3；

2、在浮动元素与绝对定位元素之间添加一个空的 div（<span style="color:red;">推荐</span>）。

还是以上面的实例为参考：

``` html
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>绝对定位的元素在ie6下不显示</title>
</head>
<body>
    <div class="w">
        <div class="fl">浮动元素</div>
        <div></div>
        <div class="pa">绝对定位元素</div>
    </div>
</body>
</html>
```

### ie6 浏览器和其他浏览器效果 ###

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/02/4.png)