title: 让 ie 支持 html5 标签
date: 2015-12-30 15:12:03
categories: html
keywords: html, html5, html5shiv
tags: [html, html5, html5shiv]
---

通过调用 [html5shiv.js](https://github.com/aFarkas/html5shiv) 可以使 ie6/7/8 支持 html5 标签。
<!--more-->

[html5shiv.js](https://github.com/aFarkas/html5shiv) 下载地址[点击这里](https://github.com/aFarkas/html5shiv)。

**如何引用：**

``` html
<!--[if lt IE 9]>
<script src="html5shiv.js"></script>
<![endif]-->
```

**完整 demo：**

``` html
<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
    .wrapper{width:1000px;margin-left:auto;margin-right:auto;}
    #header{height:100px;background:gray;}
    #content{height:500px;background:green;}
    #footer{height:100px;background:gray;}
    </style>
    <!--[if lt IE 9]>
    <script src="html5shiv.js"></script>
    <![endif]-->
</head>
<body>
    <div class="wrapper">
        <header id="header">header区域</header>
        <section id="content">内容区域</section>
        <footer id="footer">footer区域</footer>
    </div>
</body>
</html>
```