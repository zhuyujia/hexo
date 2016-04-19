title: 利用小数解析差异解决浏览器兼容性问题
date: 2016-01-18 09:31:25
categories: css
description:
keywords: css, css hack, 浏览器, 兼容, 浏览器兼容, 小数
tags: [css, css hack, 浏览器, 兼容, 浏览器兼容, 小数]
---

通常我们写 css 的时候写的数字都是整数，如 `font-size:12px; margin:20px;` 那么看到标题可能有人会问，css 属性值可以有小数点么？如果是小数那会显示成什么样子？和整数有什么区别？
<!--more-->

首先我们先看个例子，通过例子来观察下小数在各个浏览器的差异。

**Html：**

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>小数点在各个浏览器中的差异</title>
    <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
    <div class="demo">
        <p class="font15-9">这段文字的大小是15.9像素。</p>
        <p class="font16">这段文字的大小是16像素。</p>
        <p class="font14-4">这段文字的大小是14.4像素。</p>
        <p class="font14">这段文字的大小是14像素。</p>
    </div>
</body>
</html>
```

**Css：**

``` scss
@charset "utf-8";
@import "core/config";
@import "core/reset";

.demo {
    margin:50px;
    font-family:SimSun;
    p {
        height:30px;
        margin:20px;
    }
    .font15-9 {
        font-size:15.9px;
    }
    .font16 {
        font-size:16px;
    }
    .font14-4 {
        font-size:14.4px;
    }
    .font14 {
        font-size:14px;
    }
}
```

**结论：**

我们可以看出在 chrome/firefox/ie8-11 下小数会通过四舍五入的方式转成整数，而 ie6/ie7 会对小数进行下限取整转成整数。通过这一特性我们在某些情况下，用小数来替代 css hack。譬如：

**Html：**

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>小数点在各个浏览器中的差异</title>
    <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
    <div class="demo">
        <div class="black">
            <div class="red"></div>
            <p>在 ie6/ie7 下红色块离黑色块没有外边距，而其他的浏览器则有 1px 外边距。一般我们是写 css hack，如 margin:1px;*margin:0; 但是我们现在可以通过小数来解决啦。</p>
        </div>
    </div>
</body>
</html>
```

**Css：**

``` scss
@charset "utf-8";
@import "core/config";
@import "core/reset";
@import "core/common";

.demo {
    margin:50px;
    font-size:30px;
    font-family:SimSun;
    .black {
        overflow:hidden;
        width:500px;
        height:500px;
        @include center-block;
        background-color:#000;
        color:#fff;
    }
    .red {
        width:100px;
        height:100px;
        margin:1.1px;
        background-color:#f00;
    }
}
```

不仅仅缩短的代码的长度，还去掉了 css hack。

**总结：**

虽说这个小数解决一些兼容性问题很神奇，但是它的缺点也很明显，就是适用范围，只能解决<span style="color:red;">相差 1 像素</span>的浏览器差异，<span style="color:red;">而且只能解决 ie6/ie7 下 1 像素的差异</span>。

测试浏览器：chrome/firefox/ie6-11

> 参考资料：[鲜为人知的一个解决兼容性问题的利器——小数](http://www.zhangxinxu.com/wordpress/2009/09/%E9%B2%9C%E4%B8%BA%E4%BA%BA%E7%9F%A5%E7%9A%84%E4%B8%80%E4%B8%AA%E8%A7%A3%E5%86%B3%E5%85%BC%E5%AE%B9%E6%80%A7%E9%97%AE%E9%A2%98%E7%9A%84%E5%88%A9%E5%99%A8%E2%80%94%E2%80%94%E5%B0%8F%E6%95%B0/)