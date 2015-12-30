title: button按钮的一些问题
date: 2015/12/29 20:52:51
categories: html
description: button 按钮在不设置 type 属性时，在不同的浏览器作用不一样。通过 w3school 可以发现，我们需要始终为 button 按钮规定 type 属性。Internet Explorer（经测试是 ie6 和 ie7）的默认类型是 "button"，而其他浏览器中（包括 W3C 规范）的默认值是 "submit"。
keywords: button, type, submit
tags: [button, type, submit]
---

## 问题 ##

`button` 按钮在不设置 `type` 属性时，在不同的浏览器作用不一样。举个例子：

**html：**

``` html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>button按钮的一些问题</title>
</head>
<body>
    <form action="result.php" method="post">
        <input type="text" name="txt" placeholder="随便输入点什么吧！" autocomplete="off"/>
        <button>button点击提交</button>
    </form>
</body>
</html>
```

**result.php：**

``` php
<?php echo $_POST['txt'] ?>
```

我们发现，在 ie8 以上包括 ie8 点击按钮可以正常提交表单，但是在 ie6 和 ie7 下面，点击按钮没有反应。

## 原因 ##

为什么会有差异？因为 `button` 按钮没有设置 `type` 属性，在不同的浏览器中解析 `button` 的 `type` 类型不尽相同。

通过 w3school 可以发现，我们需要始终为 `button` 按钮规定 `type` 属性。Internet Explorer（经测试是 ie6 和 ie7）的默认类型是 "button"，而其他浏览器中（包括 W3C 规范）的默认值是 "submit"。[具体内容点此了解](http://www.w3school.com.cn/tags/att_button_type.asp)。

最后我们修改下 demo：

``` html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <title>button按钮的一些问题</title>
</head>
<body>
    <form action="result.php" method="post">
        <input type="text" name="txt" placeholder="随便输入点什么吧！" autocomplete="off"/>
        <button type="button">button按钮type为button</button>
        <button type="submit">button按钮type为submit</button>
    </form>
</body>
</html>
```

## PS ##

写这篇文章的目的在于提醒自己在使用 `button` 时需要为标签指定相应的 `type` 类型。