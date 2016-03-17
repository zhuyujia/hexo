title: 如何获取 url 后参数的值
date: 2016-03-17 14:36:24
categories: javascript
keywords: javascript, url, location, search
tags: [javascript, url, location, search]
---

原生 javascript，兼容所有的浏览器（ie，chrome，firefox）。
<!--more-->

``` javascript
function getUrlParam(name) {
    var regExp = new RegExp('([?]|&)' + name + '=([^&]*)(&|$)');
    var result = window.location.href.match(regExp);
    if (result) {
        return decodeURIComponent(result[2]);
    } else {
        return null;
    }
}
```

**参数说明**

- name：参数名称
- 返回值：有参数返回参数的值，没有返回 null

**使用方法**

``` javascript
var name = getUrlParam('name');
```