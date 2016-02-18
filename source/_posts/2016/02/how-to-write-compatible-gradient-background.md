title: css 背景渐变的兼容写法
date: 2016-02-18 09:30:58
categories: css
keywords: css, css3, gradient, linear-gradient, 线性渐变, filter, 滤镜
tags: [css, css3, gradient, linear-gradient, 线性渐变, filter, 滤镜]
---

现在的页面中 css3 的效果已经很常见了，比如圆角 `border-radius`、阴影 `box-shadow`、文本阴影 `text-shadow`、线性渐变 `linear-gradient` 等等。今天主要介绍如何用 css 实现背景线性渐变，兼容低版本浏览器。
<!--more-->

## css3 linear-gradient ##

首先介绍在高版本浏览器中的写法：css3 的 `linear-gradient`

``` css
.gradient{
    background: -moz-linear-gradient(top, #000000 0%, #ffffff 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#000000), color-stop(100%,#ffffff));
    background: -webkit-linear-gradient(top, #000000 0%,#ffffff 100%);
    background: -o-linear-gradient(top, #000000 0%,#ffffff 100%);
    background: -ms-linear-gradient(top, #000000 0%,#ffffff 100%);
    background: linear-gradient(to bottom, #000000 0%,#ffffff 100%);
}
```

**说明：**`linear-gradient` 具体用法可以参考[大漠](http://www.w3cplus.com/)写的[CSS3 Gradient](http://www.w3cplus.com/content/css3-gradient)。

## ie 滤镜 filter ##

低版本浏览器可以通过<span style="color:red;">滤镜</span> `filter` 来实现线性渐变，当然只能实现简单的线性渐变，对于多重渐变实现不了。

``` css
.gradient{
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#000000', endColorstr='#ffffff',GradientType=0 );
}
```

由于 `filter` 是 ie 的私有属性，所以我们需要针对 ie9 单独处理滤镜效果：

``` css
:root {filter:none;}
```

## 总结 ##

综上所述，css 线性渐变的兼容写法如下：

``` css
.gradient{
    background: #000000;
    background: -moz-linear-gradient(top,  #000000 0%, #ffffff 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#000000), color-stop(100%,#ffffff));
    background: -webkit-linear-gradient(top,  #000000 0%,#ffffff 100%);
    background: -o-linear-gradient(top,  #000000 0%,#ffffff 100%);
    background: -ms-linear-gradient(top,  #000000 0%,#ffffff 100%);
    background: linear-gradient(to bottom,  #000000 0%,#ffffff 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#000000', endColorstr='#ffffff',GradientType=0 );
}
:root .gradient{filter:none;}
```

最后分享一个 [css 渐变生成器](http://www.colorzilla.com/gradient-editor/)。

**最后的最后**，在实际项目中，往往会碰到**圆角**和**渐变**的组合，如果使用上面的写法，那么在 ie9 下会有 bug（在 ie9 下背景色不能完全切完），解决方法是 SVG。