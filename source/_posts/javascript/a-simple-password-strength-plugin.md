title: 简单的密码强度插件
date: 2016-03-24 10:39:17
categories: javascript
keywords: javascript, 密码强度, password, strength, 密码, 强度
tags: [javascript, 密码强度, password, strength, 密码, 强度]
---

之前做的通行证项目，里面的注册模块中输入密码需要显示密码强度（低中高）。当然这只是一个很简单的密码强度显示功能，不像网上那么复杂，能够满足一般的需求。

``` javascript
function PasswordStrength(passwordID,strengthID){
    var _this = this;
    _this.init(strengthID);
    document.getElementById(passwordID).onkeyup = function(){
        _this.checkStrength(this.value);
    }
}
PasswordStrength.prototype.init = function(strengthID){
    var id = document.getElementById(strengthID);
    var div = document.createElement('div');
    var strong = document.createElement('strong');
    this.oStrength = id.appendChild(div);
    this.oStrengthTxt = id.parentNode.appendChild(strong);
}
PasswordStrength.prototype.checkStrength = function (val){
    var aLvTxt = ['','低','中','高'];
    var lv = 0;
    if(val.match(/[a-z]/g)){lv++;}
    if(val.match(/[0-9]/g)){lv++;}
    if(val.match(/(.[^a-z0-9])/g)){lv++;}
    if(val.length < 6){lv=0;}
    if(lv > 3){lv=3;}
    this.oStrength.className = 'strengthLv' + lv;
    this.oStrengthTxt.innerHTML = aLvTxt[lv];
}
```
<!--more-->

## 参数说明 ##

1. 对象的第一个参数是密码输入框的 id，第二个参数是密码强度长条的 id；
2. `checkStrength` 方法中可以自定义密码强度的规则；
3. 密码强度显示低中高分别对应 3 个 css 样式（strengthLv1、strengthLv2、strengthLv3）。

## 如何使用 ##

``` html
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>密码强度</title>
    <style>
    #passStrength{height:6px;width:120px;border:1px solid #ccc;padding:2px;}
    .strengthLv1{background:red;height:6px;width:40px;}
    .strengthLv2{background:orange;height:6px;width:80px;}
    .strengthLv3{background:green;height:6px;width:120px;}
    </style>
</head>
<body>
    <input type="password" name="pass" id="pass" maxlength="16"/>
    <div class="pass-wrap">
        <em>密码强度：</em>
        <div id="passStrength"></div>
    </div>
</body>
</html>
<script src="js/passwordStrength.js"></script>
<script>
window.onload = function(){
    new PasswordStrength('pass','passStrength');
}
</script>
```

## 效果 ##

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/03/2.png)