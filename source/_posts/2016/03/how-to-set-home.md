title: 如何设置为首页——setHome
date: 2016-03-16 17:25:32
categories: javascript
keywords: javascript, 设为首页, 设置首页, 代码, 首页
tags: [javascript, 设为首页, 设置首页, 代码, 首页]
---

``` javascript
function setHome(obj, url) {
    try {
        obj.style.behavior = 'url(#default#homepage)';
        obj.setHomePage(url);
    } catch (e) {
        if (window.netscape) {
            try {
                window.netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
            } catch (error) {
                alert('抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车\n\n然后将[signed.applets.codebase_principal_support]的值设置为true，双击即可。');
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage', url);
        } else {
            alert('抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【' + url + '】设置为首页。');
        }
    }
}
```
<!--more-->

**参数说明**

- obj：指代触发函数的上下文，一般用 `this`
- url：设置为首页的地址

**使用方法**

``` html
<a href="javascript:;" onclick="setHome(this,window.location.href);">设为首页</a>
```