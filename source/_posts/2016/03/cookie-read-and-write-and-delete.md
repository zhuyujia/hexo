title: cookie 的读写与删除
date: 2016-03-29 14:48:58
categories: javascript
keywords: javascript, cookie
tags: [javascript, cookie]
---

## 什么是 cookie ##

cookie 就是页面用来保存信息，比如自动登录、记住用户名等等。

## cookie 的特点 ##

1. 同个网站中所有的页面共享一套 cookie
2. cookie 有数量、大小限制
3. cookie 有过期时间

<!--more-->

## 代码 ##

``` javascript
function cookie(name, value, opts) {
    if (typeof value !== 'undefined') {
        var expires = '';
        opts = opts || {};
        if (value === null) {
            value = '';
            opts.expires = -1;
        }
        if (opts.expires) {
            var date = new Date();
            date.setTime(date.getTime() + (opts.expires * 60 * 60 * 1000));
            expires = '; expires=' + date.toGMTString();
        }
        var path = opts.path ? '; path=' + opts.path : '';
        var domain = opts.domain ? '; domain=' + opts.domain : '';
        var secure = opts.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else {
        var cookies;
        if (document.cookie && document.cookie !== '') {
            cookies = document.cookie.match(new RegExp('(^| )' + name + '=([^;]*)(;|$)'));
            if (cookies) {
                return cookies[2];
            } else {
                return null;
            }
        }
    }
}
```

### 参数说明 ###

- name：读取/写入/删除 cookie 的名称
- value：需要设置 cookie 的值
- opts：其他参数，有效期 expires 单位小时，路径 path，域名 domain，安全性 secure
- 返回值：有 cookie 就返回 cookie 的值，没有返回 null

### 使用方法 ###

#### 写入 cookie ####

``` javascript
cookie('name', 'zhuyujia');
cookie('age', 29, {expires: 1});
```

#### 读取 cookie ####

``` javascript
cookie('name');	//'zhuyujia'
cookie('age');	//29
```

#### 删除 cookie ####

只需要设置 cookie 的值为 null，就可以删除相应的 cookie 了。

``` javascript
cookie('name', null);
cookie('age', null);
```