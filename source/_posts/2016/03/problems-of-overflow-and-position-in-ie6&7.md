title: ie6 和 ie7 下 position 与 overflow 的问题
date: 2016-03-08 09:59:29
categories: css
keywords: css, ie6, position, ie7, relative, overflow
tags: [css, ie6, position, ie7, relative, overflow]
---

前几天做的项目中碰到这样一个问题，在 ie6 和 ie7 下，给父元素设置 overflow:hidden 不起作用无法隐藏，后来发现是子元素中有设置 position:relative，如果子元素删除 position:relative，那么父元素的 overflow:hidden 可以隐藏，具体代码及效果如下：
<!--more-->

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
    <style>
    *{margin:0;padding:0;}
    .w{width:480px;margin:50px auto;}
    .w ul{width:100%;overflow:hidden;height:144px;border:1px solid #f00;}
    .w li{position:relative;height:36px;width:108px;border:1px solid #d1d1d1;line-height:36px;text-align:center;float:left;display:inline;margin:0 10px 10px 0;}
    </style>
</head>
<body>
    <div class="w">
        <ul>
            <li>111111111</li>
            <li>222222222</li>
            <li>333333333</li>
            <li>444444444</li>
            <li>555555555</li>
            <li>666666666</li>
            <li>777777777</li>
            <li>888888888</li>
            <li>999999999</li>
            <li>000000000</li>
            <li>111111111</li>
            <li>222222222</li>
            <li>333333333</li>
            <li>444444444</li>
            <li>555555555</li>
            <li>666666666</li>
            <li>777777777</li>
            <li>888888888</li>
            <li>999999999</li>
            <li>000000000</li>
        </ul>
    </div>
</body>
</html>
```

ie6 和 ie7 下效果：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/03/1.png)

**解决方法：**给父元素设置 position:relative。