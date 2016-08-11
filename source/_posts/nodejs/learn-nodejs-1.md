title: 初识 NodeJS（一）
date: 2016-08-11 09:50:34
categories: nodejs
keywords: nodejs, node, javascript
tags: [nodejs, node, javascript]
description: 记录学习 nodejs 的点点滴滴。
---

## 构建一个基础的 http 服务器

需要引用 http 模块，http 模块是 node.js 的内置模块。

``` javascript
var http = require('http');

http.createServer(function(request, response) {
    console.log('Request received...');
    response.writeHead({'Content-type': 'text/plain'});
    response.write('Hello node.js');
    response.end();
}).listen(8888);
console.log('server start...');
```

保存以上代码为 server.js，打开终端（可以是 cmd）通过 node 运行 server.js，当然前提是先要进入 server.js 所在的目录。

``` bash
node server
```

浏览器打开 http://localhost:8888/ 可以看到页面上显示 Hello node.js 。

切换到终端，可以看到输出了一些东西：

``` bash
server start...
Request received...
Request received...
```

请注意，当我们在服务器访问网页时，我们的服务器可能会输出两次 `Request received...`。那是因为大部分服务器都会在你访问 http://localhost:8888/ 时尝试读取 http://localhost:8888/favicon.ico

## 进阶 - 模块

编写稍大一点的程序时一般都会将代码模块化。在 nodejs 中，一般将代码合理拆分到不同的 js 文件中，每一个文件就是一个模块，而文件名称就是模块名。

那么如何把 server.js 封装成模块？很简单，看下面代码：

``` javascript
var http = require('http');

function start() {
    function onRequest(request, response) {
        console.log('request received...');
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

以上代码就是将 server.js 封装为模块了，并且*导出* start 方法。

`exports` 是当前模块的导出对象，用于导出当前模块的公有方法和属性。

## 引用模块，并调用模块的方法

其实在 server.js 中，就已经学会了如何引用模块以及使用模块的方法：

``` javascript
var http = require('http');    // 引用 http 模块

http.createServer();    // 调用 http 模块的方法
```

`require` 函数用于在当前模块中加载和使用别的模块，传入一个模块名，返回一个模块导出对象（`exports`）。模块名可使用相对路径（以 `./` 开头），或者是绝对路径（以 `/` 或 `c:` 之类的盘符开头）。另外，模块名中的 `.js` 扩展名可以省略。

新建主文件 index.js 文件（与 server.js 同级），在 index.js 中启动 http 服务器：

``` javascript
var server = require('./server');

server.start();
```

在终端启动服务：

``` bash
node index
```

浏览器打开 http://localhost:8888/ 可以看到页面上显示 Hello node.js，OK，和之前一样。

这样构建一个基础的 http 服务器就完成了。