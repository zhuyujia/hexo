title: 单选框和复选框与文本垂直对齐
date: 2016-01-15 10:41:31
categories: css
description:
keywords: css, checkbox, radio, vertical-align, input, 垂直居中
tags: [css, checkbox, radio, vertical-align, input, 垂直居中]
---

现在的网站一般字体大小都是 12px，在 12px 下单选框和复选框与文本垂直居中对不齐，解决方法有很多，下面我整理最常用的 3 种。
<!--more-->

**html 结构：**

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>radio-and-checkbox-and-text-vertical-align</title>
    <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
    <div class="demo">
        <h2>单选框</h2>
        <p><input type="radio" name="radio" id="radio1" class="input1"/><label for="radio1">解决方法一</label></p>
        <p><input type="radio" name="radio" id="radio2" class="input2"/><label for="radio2">解决方法二</label></p>
        <p><input type="radio" name="radio" id="radio3" class="input3"/><label for="radio3">解决方法三</label></p>
        <h2>复选框</h2>
        <p><input type="checkbox" name="checkbox" id="checkbox1" class="input1"/><label for="checkbox1">解决方法一</label></p>
        <p><input type="checkbox" name="checkbox" id="checkbox2" class="input2"/><label for="checkbox2">解决方法二</label></p>
        <p><input type="checkbox" name="checkbox" id="checkbox3" class="input3"/><label for="checkbox3">解决方法三</label></p>
    </div>
</body>
</html>
```

**scss：**

``` scss
@charset "utf-8";
@import "core/config";
@import "core/reset";

.demo {
    margin:50px;
    font-size:12px;
    font-family:SimSun;
    h2 {
        font-size:20px;
    }
    p {
        margin:20px;
        input {
            margin-right:5px;
        }
        .input1 {
            height:13px;
            margin-top:0;
            vertical-align:text-top;
        }
        .input2 {
            margin-top:-2px;
            vertical-align:middle;
        }
        .input3 {
            vertical-align:-3px;
        }
    }
}
```

测试浏览器：chrome，firefox，ie7-10

> 原文地址：[复选框单选框与文字对齐问题的研究与解决](http://www.zhangxinxu.com/wordpress/2009/08/%E5%A4%8D%E9%80%89%E6%A1%86%E6%88%96%E5%8D%95%E9%80%89%E6%A1%86%E4%B8%8E%E6%96%87%E5%AD%97%E5%AF%B9%E9%BD%90%E7%9A%84%E9%97%AE%E9%A2%98%E7%9A%84%E6%B7%B1%E5%85%A5%E7%A0%94%E7%A9%B6%E4%B8%8E%E4%B8%80/)