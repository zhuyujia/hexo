title: html5 本地存储——localStorage 和 sessionStorage
date: 2015-12-31 10:59:46
categories: javascript
description: 最近一直在学习 html5，为了后期的项目进行知识储备。html5 相对于 html4 新增加了一些有趣的标签、属性和方法，今天主要介绍下 html5 的本地存储。
keywords: html, html5, javascript, localStorage, sessionStorage
tags: [html, html5, javascript, localStorage, sessionStorage]
---

最近一直在学习 html5，为了后期的项目进行知识储备。html5 相对于 html4 新增加了一些有趣的标签、属性和方法，今天主要介绍下 html5 的本地存储。

## 在客户端存储数据 ##

html5 提供了两种在客户端存储数据的新方法：

- localStorage 没有时间限制的数据存储
- sessionStorage 针对 session 的数据存储，一旦窗口关闭就没有了

两个方法用法完全一样，下面就以 `localStorage` 为例。

## 为什么要用本地存储 ##

早期我们都是使用 `cookie` 来完成的，但是 `cookie` 不适合大量的数据存储，也就是说它太小，只有 4k 的样子，而且速度慢效率低。

## 使用方法 ##

那么我们该如何添加数据呢？很简单，就像给对象添加属性一样：

``` javascript
localStorage.pageLoadCount = 1;
```

可以通过浏览器的控制台来查看是否有存储数据，如图所示：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2015/12/1.png)

同样读取和修改数据也很方便：

``` javascript
console.log(localStorage.pageLoadCount);    //读取
localStorage.pageLoadCount = 10;            //修改
console.log(localStorage.pageLoadCount);    //读取
```

以下是结果：

![](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2015/12/2.png)

当然 `localStorage` 本身自带一些方法及属性，具体如下：

``` javascript
localStorage.clear();                       //清除所有的存储数据
localStorage.getItem('pageLoadCount');      //读取存储数据，返回值 "10"，等同于 localStorage.pageLoadCount
localStorage.key(0);                        //获取存储数据的 key，返回值 "pageLoadCount"
localStorage.length;                        //获取存储数据的长度
localStorage.removeItem('pageLoadCount');   //删除特定的存储数据
localStorage.setItem('name','Jack');        //新增加一个存储数据，等同于 localStorage.name = 'Jack';
```

**需要注意的是：**读取存储数据的时候，返回的是字符串，无论之前存的是什么，最后读取的都是字符串，所以读取的时候需要进行类型转换。

最后附上 `localStorage` 应用的 demo：

``` html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>localStorage</title>
</head>
<body>
    <p id="p"></p>
</body>
</html>
<script>
window.onload = function(){
    if(!localStorage.pageLoadCount) localStorage.pageLoadCount = 0;
    localStorage.pageLoadCount = parseInt(localStorage.pageLoadCount) + 1;
    document.getElementById('p').innerHTML = '浏览次数：' + localStorage.pageLoadCount + ' 次。';
}
</script>
```

## 参考资料 ##

[HTML 5 Web 存储](http://www.w3school.com.cn/html5/html_5_webstorage.asp)

[HTML5 LocalStorage 本地存储](http://www.cnblogs.com/xiaowei0705/archive/2011/04/19/2021372.html)