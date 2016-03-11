title: 如何添加到浏览器收藏夹
date: 2016-03-11 10:57:51
categories: javascript
keywords: javascript, addFavorite, favorite, 收藏本站
tags: [javascript, addFavorite, favorite, 收藏本站]
---

原生 javascript，兼容所有的浏览器（ie，chrome，firefox），值得收藏。
<!--more-->

``` javascript
function addFavorite(obj, opts){
    var _t, _u;
    if (typeof opts === 'object') {
		_t = opts.title || document.title;
        _u = opts.url || window.location.href;
    } else {
        _t = document.title;
        _u = window.location.href;
    }
    try {
        window.external.addFavorite(_u, _t);
    } catch (e) {
        if (window.sidebar) {
            obj.href = _u;
            obj.title = _t;
            obj.rel = 'sidebar';
        } else {
            alert('抱歉，您所使用的浏览器无法完成此操作。\n\n请使用 Ctrl + D 将本页加入收藏夹！');
        }
    }
}
```

**参数说明**

- 第一个参数必须，指代触发函数的上下文，一般用 `this`
- 第二个参数是对象（可选），收藏夹的标题和链接，默认为当前页面的标题和链接 `{title: 'your_title', url: 'your_url'}`

**使用方法**

``` html
<a href="javascript:;" onclick="addFavorite(this);">点击收藏本站</a>
```

**最后**

网上那些收藏本站的代码，经测试发现在 firefox 下面有问题，`addPanel` 这个方法在 firefox24 以后就没有了，解决方法是给 `a` 标签添加 `rel='sidebar'`，同时给 `href` 和 `title` 赋值。