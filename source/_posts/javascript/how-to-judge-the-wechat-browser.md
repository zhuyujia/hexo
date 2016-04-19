title: 如何判断微信浏览器
date: 2016-03-22 10:51:34
categories: javascript
keywords: javascript, 微信, 微信浏览器, userAgent
tags: [javascript, 微信, 微信浏览器, userAgent]
---

以前接到个需求，需求是这样的：用户扫一扫二维码会产生一个链接，该链接会向后端发送个请求，返回一个 apk 的下载地址，用户点击下载按钮可以下载此 apk。然后就发生了问题，经过测试，发现用微信扫一扫打开的页面点击下载按钮下载不了 apk，后百度之，原来是微信内置浏览器屏蔽了下载链接，后面和需求方沟通，需求改为如果用户是用微信内置浏览器打开的，则提示用户换一个浏览器打开页面，否则下载不了 apk。那么该如何判断用户是否是用微信浏览器呢？
<!--more-->

我们知道 js 可以通过 `window.navigator.userAgent` 来获取浏览器的相关信息，比如：Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36，那么我们也可以通过该方法来获取微信内置浏览器的相关信息：Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11d201 MicroMessenger/5.3。我们可以根据关键字 `MicroMessenger` 来判断是否是微信内置的浏览器。

``` javascript
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}
```

将下面的 demo 传到服务器上，然后生成二维码扫一扫：

``` html
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>判断是否是微信内置浏览器</title>
</head>
<body>
    <h1>如果用微信浏览器打开可以看到下面的文字</h1>
    <p></p>
</body>
</html>
<script type="text/javascript">
window.onload = function(){
    if(isWeiXin()){
        var p = document.getElementsByTagName('p');
        p[0].innerHTML = window.navigator.userAgent;
    }
}
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}
</script>
```