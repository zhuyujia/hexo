title: 初识 NodeJS（三）
date: 2016-08-11 13:47:46
categories: nodejs
keywords: nodejs, node, javascript
tags: [nodejs, node, javascript]
---

上节我们将 http 服务器（server.js）和请求路由模块（route.js）整合在一起了，当然这还不够，路由，顾名思义，是指我们要针对不同的 url 有不同的处理方式。

<!--more-->

## 请求处理程序模块（requestHandlers）

``` javascript
function start() {
    console.log('Request handler "start" was called.');
}

function upload() {
    console.log('Request handler "upload" was called.');
}

exports.start = start;
exports.upload = upload;
```

下面我们需要将请求处理程序模块和路由模块相结合，修改主文件 index.js

``` javascript
var server = require('./server');
var route = require('./route');
var requestHandlers = require('./requestHandlers');

var handler = {};
handler['/'] = requestHandlers.start;
handler['/start'] = requestHandlers.start;
handler['/upload'] = requestHandlers.upload;

server.start(route.route, handler);
```

正如所见，将不同的 url 映射到相同的请求处理程序上是很容易的：只要在对象中添加一个键为 `'/'` 的属性，对应 `requestHandlers.start` 即可，这样我们就可以干净简洁地配置 `/start` 和 `/` 的请求都交由 `start` 这一处理程序处理。在完成了对象的定义后，我们把它作为额外的参数传递给服务器。

``` javascript
var http = require('http');
var url = require('url');

function start(route, handler) {
    function onRequest(request, response) {
        var pathname = url.parse(request.url).pathname;
        console.log('Request ' + pathname + ' received.');

        route(handler, pathname);

        response.writeHead(200, {
            'Content-type': 'text/plain'
        });
        response.write('Hello node.js');
        response.end();
    }

    http.createServer(onRequest).listen(8888);
    console.log('server has started.');
}

exports.start = start;
```

这样我们就在 `start()` 函数里添加了 `handler` 参数，并且把 `handler` 对象作为第一个参数传递给了 `route()` 回调函数。

``` javascript
function route(handler, pathname) {
    console.log('Route a request for ' + pathname);

    if (typeof handler[pathname] === 'function') {
        handler[pathname]();
    } else {
        console.log('No request handler found for ' + pathname);
    }
}

exports.route = route;
```

这样，我们就把服务器、路由和请求处理程序结合在一起了。现在我们启动应用程序并在浏览器中访问 `http://localhost:8888/start`，以下日志可以说明系统调用了正确的请求处理程序：

``` bash
server has started.
Request /start received.
Route a request for /start
Request handler "start" was called.
Request /favicon.ico received.
Route a request for /favicon.ico
No request handler found for /favicon.ico
```