title: 初识 NodeJS（二）
date: 2016-08-11 10:10:10
categories: nodejs
keywords: nodejs, node, javascript
tags: [nodejs, node, javascript]
---

上一节我们构建了一个基础的 http 服务器，我们可以接收 http 请求，但是我们得做点什么吧 -- 不同的 http 请求，服务器应该有不同的响应。

<!--more-->

## 路由模块

处理不同的 http 请求在我们的代码中是一个不同的部分，叫做**路由选择**。

我们要为路由提供请求的 url 和其他需要的 get 及 post 参数，随后路由根据这些数据来执行相应的代码，因此，我们需要查看 http 请求，从中提取出请求的 url 以及 get/post 参数。

我们需要的所有数据都会包含在 request 对象中，该对象作为回调函数（onRequest）的第一个参数传递。想要解析 request 对象中的数据就需要调用 **url 模块**或者 **querystring 模块**，该两个模块都是 nodejs 的内置模块。

``` javascript
var http = require('http');
var url = require('url');

function start() {
    function onRequest(request, response) {
        console.log(url.parse(request.url).pathname);
        response.writeHead({
            'Content-type': 'text/plain'
        });
        response.write('Hello node.js');
        response.end();
    }

    http.createServer(onRequest).listen(8888);
    console.log('server start...');
}

exports.start = start;
```

在浏览器中输入 http://localhost:8888/start 通过终端我们可以看到请求的 url 路径，通过 url 路径为基准映射到不同的处理程序上。现在我们可以来写路由模块（route.js）了。

``` javascript
function route(pathname) {
    console.log('route: ' + pathname);
}

exports.route = route;
```

有了路由模块，那么我们把路由和服务器整合起来，首先扩展 server.js：

``` javascript
var http = require('http');
var url = require('url');

function start(route) {
    function onRequest(request, response) {
        var pathname = url.parse(request.url).pathname;

        route(pathname);

        response.writeHead({
            'Content-type': 'text/plain'
        });
        response.write('Hello node.js');
        response.end();
    }

    http.createServer(onRequest).listen(8888);
    console.log('server start...');
}

exports.start = start;
```

扩展 index.js

``` javascript
var server = require('./server');
var route = require('./route');

server.start(route.route);
```

在终端开启服务器 `node index`，可以看到终端输出的内容正是路由模块里面的内容，说明我们的 http 服务器已经在使用路由模块了，并会将请求的路径传递给路由：

``` bash
node index
server start...
route: /start
route: /favicon.ico
```