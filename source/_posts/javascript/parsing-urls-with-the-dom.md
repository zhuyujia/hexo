title: 利用 a 标签自动解析 url
date: 2016-08-30 15:40:09
categories: javascript
keywords: javascript, parseUrl
tags: [javascript, parseUrl]
---

很多时候，我们有从 url 中提取域名，查询关键字，变量参数值等的需求，然而我们可以让浏览器方便地帮助我们完成这一任务而不用写正则去抓取。方法就是先创建一个 `a` 标签然后将需要解析的 url 赋值给 `a` 的 `href` 属性，然后就得到了一切我们想要的了。
<!--more-->

``` javascript
var a = document.createElement('a');
a.href = 'http://zhuyujia.github.io/?a=1&b=2';
console.log(a.host);  // zhuyujia.github.io
```

利用这一原理，稍微扩展一下，就得到了一个更加完整的解析 url 各部分的通用方法了。

``` javascript
function parseUrl(url) {
    var a = document.createElement('a');
    a.href = url;
    return {
        source: url,
        protocol: a.protocol.replace(':', ''),
        host: a.hostname,
        port: a.port,
        query: a.search,
        params: (function() {
            var ret = {},
                seg = a.search.replace(/^\?/, '').split('&'),
                len = seg.length,
                i = 0,
                s;
            for (; i < len; i++) {
                if (!seg[i]) {
                    continue;
                }
                s = seg[i].split('=');
                ret[s[0]] = s[1];
            }
            return ret;
        })(),
        file: (a.pathname.match(/\/([^\/?#]+)$/i) || [, ''])[1],
        hash: a.hash.replace('#', ''),
        path: a.pathname.replace(/^([^\/])/, '/$1'),
        relative: (a.href.match(/tps?:\/\/[^\/]+(.+)/) || [, ''])[1],
        segments: a.pathname.replace(/^\//, '').split('/')
    };
}
```