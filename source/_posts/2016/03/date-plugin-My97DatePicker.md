title: 日期控件 My97DatePicker
date: 2016-03-23 09:51:52
categories: javascript
keywords: javascript, My97DatePicker, datepicker, 日期控件, 日期插件
tags: [javascript, My97DatePicker, datepicker, 日期控件, 日期插件]
---

以前做的平台项目，其中有用到日期选择，相对于 [jqueryui](http://jqueryui.com/) 的 [datepicker](http://jqueryui.com/datepicker/) 我更喜欢 [My97DatePicker](http://www.my97.net/dp/demo/index.htm)。
<!--more-->

## 理由 ##

1. 体积小，相对于 [jqueryui](http://jqueryui.com/) 的 [datepicker](http://jqueryui.com/datepicker/) 的百来 K，[My97DatePicker](http://www.my97.net/dp/demo/index.htm) 只有 50K 不到；
2. [My97DatePicker](http://www.my97.net/dp/demo/index.htm) 是用原生 js 编写的，能够用在任何环境下；
3. [My97DatePicker](http://www.my97.net/dp/demo/index.htm) 功能非常强大全面，能够满足使用者的绝大部分需求。

## 如何使用 ##

首先需要引用日期控件库：

``` html
<script src="My97DatePicker/WdatePicker.js"></script>
```

然后调用 WdatePicker 方法：

``` html
<input id="date" type="text" onclick="WdatePicker()">
```

## 浏览器兼容 ##

ie 6.0+，firefox 2.0+，chrome，opera 9.5+，safari 3.0+

## 文档说明及下载 ##

[点击这里查看具体配置及文档说明](http://www.my97.net/dp/demo/index.htm)

[点击这里下载 My97DatePicker](http://www.my97.net/dp/down.asp)