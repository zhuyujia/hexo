title: 初识 NodeJS（四）
date: 2016-08-11 14:17:28
categories: nodejs
keywords: nodejs, node, javascript
tags: [nodejs, node, javascript]
---

上节我们把服务器、路由和请求处理程序结合在一起了，下面就编写一个具体的 web 应用。

<!--more-->

## 上传图片的 web 应用

**服务器模块（server.js）**

``` javascript
var http = require('http');
var url = require('url');

function start(route, handler) {
    function onRequest(request, response) {
        var pathname = url.parse(request.url).pathname;
        console.log('Request ' + pathname + ' received.');
        route(handler, pathname, response, request);
    }

    http.createServer(onRequest).listen(8888);
    console.log('Server has started.');
}

exports.start = start;
```

**路由模块（route.js）**

``` javascript
function route(handler, pathname, response, request) {
    console.log('Route a request for ' + pathname);

    if (typeof handler[pathname] === 'function') {
        handler[pathname](response, request);
    } else {
        console.log('No request handler found for ' + pathname);
        response.writeHead(404, {
            'Content-Type': 'text/plain'
        });
        response.write('404 Not Found');
        response.end();
    }
}

exports.route = route;
```

**请求处理程序模块（requestHandlers.js）**

``` javascript
var querystring = require('querystring'),
    fs = require('fs'),
    formidable = require('C:/Users/ezhiyang/AppData/Roaming/npm/node_modules/formidable');  // 如果 formidable 模块是全局安装，只能绝对路径调用，如果本地安装，require(formidable)

function start(response) {
    console.log('Request handler "start" was called.');

    var body = '<html>' +
        '<head>' +
        '<meta http-equiv="Content-Type" content="text/html; ' +
        'charset=UTF-8" />' +
        '</head>' +
        '<body>' +
        '<form action="/upload" enctype="multipart/form-data" method="post">' +
        '<input type="file" name="upload">' +
        '<input type="submit" value="Upload file">' +
        '</form>' +
        '</body>' +
        '</html>';

    response.writeHead(200, {
        'Content-Type': 'text/html'
    });
    response.write(body);
    response.end();
}

function upload(response, request) {
    console.log('Request handler "upload" was called.');

    var form = new formidable.IncomingForm();
    form.uploadDir = 'tmp';
    form.parse(request, function(error, fields, files) {
        console.log('parsing done');
        fs.renameSync(files.upload.path, './tmp/test.png');
        response.writeHead(200, {
            'Content-Type': 'text/html'
        });
        response.write('Received image:<br>');
        response.write('<img src="/show">');
        response.end();
    });
}

function show(response) {
    console.log('Request handler "show" was called.');
    fs.readFile('./tmp/test.png', 'binary', function(error, file) {
        if (error) {
            response.writeHead(500, {
                'Content-Type': 'text/plain'
            });
            response.write(error + '\n');
            response.end();
        } else {
            response.writeHead(200, {
                'Content-Type': 'image/png'
            });
            response.write(file, 'binary');
            response.end();
        }
    });
}

exports.start = start;
exports.upload = upload;
exports.show = show;
```

**主文件（index.js）**

``` javascript
var server = require('./server');
var route = require('./route');
var requestHandlers = require('./requestHandlers');

var handler = {};
handler['/'] = requestHandlers.start;
handler['/start'] = requestHandlers.start;
handler['/upload'] = requestHandlers.upload;
handler['/show'] = requestHandlers.show;

server.start(route.route, handler);
```

打开终端，启动服务器 `node index`，浏览器输入 `http://localhost:8888/start`，上传图片功能就可以使用了。选择一张本地图片，将其上传到服务器，然后浏览器就会显示该图片。