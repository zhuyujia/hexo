title: 复制剪贴板功能——ZeroClipboard
date: 2016-03-09 14:43:31
categories: javascript
keywords: javascript, ZeroClipboard, 复制, clipboardData, clearData, getData, setData
tags: [javascript, ZeroClipboard, 复制, clipboardData, clearData, getData, setData]
---

复制剪贴板功能分为两部分：ie 浏览器和非 ie 浏览器，ie 浏览器可以使用 clipboardData 对象，而非 ie 浏览器则利用 flash 与 js 的结合来实现，即 ZeroClipboard.js。
<!--more-->

## clipboardData 对象 ##

clipboardData 对象只有 ie 浏览器认识，该对象有 3 个方法：`clearData`，`getData` 和 `setData`。

| **方法** | **描述** |
| --- | --- |
| clearData | 通过 dataTransfer 或 clipboardData 对象从剪贴板删除一种或多种数据格式。 |
| getData | 通过 dataTransfer 或 clipboardData 对象从剪贴板获取指定格式的数据。 |
| setData | 以指定格式给 dataTransfer 或 clipboardData 对象赋予数据。 |

## ZeroClipboard.js ##

对于非 ie 浏览器我们可以使用 ZeroClipboard.js。[点击下载源码](http://7xn4vv.com1.z0.glb.clouddn.com/static/upload/2016/03/ZeroClipboard.zip)。

### 实现原理 ###

利用透明的 flash 覆盖在复制按钮上，点击 flash，将复制内容传入到 flash 中，再通过 flash 把传入的内容写到剪贴板上。

### 使用方法 ###

首先需要把 flash 和 js 放到同一目录下，然后引用 js。如果 flash 和 js 不在同一目录，可以通过 `ZeroClipboard.setMoviePath('Flash路径');` 来设置 flash 路径，或者修改源码中的 `moviePath`。

``` javascript
// 使用方法：clipboard({txt: '复制内容', btn: 'btnId', parent: 'parentId', callback: function(){alert('复制成功');}});
function clipboard(opts) {
	var clip = new ZeroClipboard.Client(); // 新建一个对象
    clip.setHandCursor(true);
    clip.setText(opts.txt); // 设置要复制的文本。
    clip.addEventListener('mouseUp', function() {
        if (opts.callback) {
            opts.callback();
        }
    });
	// 注册一个 button，参数为 id。点击这个 button 就会复制。
    //这个 button 不一定是 input 按钮，也可以是其他 DOM 元素。
    clip.glue(opts.btn, opts.parent);
}
```

### 参数说明 ###

- txt：需要复制的文本内容
- btn：需要绑定复制功能的元素 id
- parent：复制按钮（DOM 元素）所在的父层的 id，如果没有该 id，默认为 body
- callback：复制成功后回调函数

## 综上所述 ##

``` javascript
// 使用方法：clipboard({txt: '复制内容', btn: 'btnId', parent: 'parentId', callback: function(){alert('复制成功');}});
function clipboard(opts) {
    if (window.clipboardData) {
        var oBtn = document.getElementById(opts.btn);
        oBtn.onclick = function() {
            window.clipboardData.setData('text', opts.txt);
            if (opts.callback) {
                opts.callback();
            }
        }
    } else {
        var clip = new ZeroClipboard.Client();
        clip.setHandCursor(true);
        clip.setText(opts.txt);
        clip.addEventListener('mouseUp', function() {
            if (opts.callback) {
                opts.callback();
            }
        });
        clip.glue(opts.btn, opts.parent);
    }
}
```