title: 如何解决 ajax 请求成功后新开窗口被拦截
date: 2016-03-31 10:50:45
categories: jquery
keywords: jquery, javascript, ajax, window.open, open
tags: [jquery, javascript, ajax, window.open, open]
---

## 问题 ##

前面开发项目时碰到一个问题，ajax 异步请求成功后需要新开窗口打开 url，使用的是 `window.open()` 方法，但是很可惜被浏览器给拦截了，怎么解决这个问题呢？

## 分析 ##

浏览器之所以拦截新开窗口是因为该操作并不是用户主动触发的，所以它认为这是不安全的就拦截了（不过如果是 _self 的话就不会有这个限制），即使 ajax 回调函数中模拟执行 `click` 或者 `submit` 等用户行为（`trigger('click')`），浏览器也会认为不是由用户主动触发的，因此不能被安全执行，所以被拦截。
<!--more-->

## 解决方法 ##

1、将 ajax 异步改为同步，即 `async:false`。

2、将新开窗口指向为一个对象，然后修改对象的 url。

``` javascript
$('.task').bind('click',function(){
    var w = window.open();
    $.ajax({
        type: 'POST',
        url: '/surveyTask',
        dataType: 'json',
        error: function(){
            w.close();
        },
        success: function(res){
            w.location = res.url;
        }
    });
});
```

最后需要说明的是：网上的动态添加 `form` 新开窗口的方法，并不适合 ajax 请求，至少我这边测试了下仍然被浏览器所拦截。

> 参考资料：[弹窗解决最终奥义，人类再再也无法阻止弹窗了！](http://levi.yii.so/archives/3453)