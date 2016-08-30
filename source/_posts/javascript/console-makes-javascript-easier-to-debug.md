title: console 让 js 调试更简单
date: 2016-08-23 14:34:59
categories: javascript
keywords: javascript, console
tags: [javascript, console]
---

浏览器的控制台（console）是最重要的面板，主要作用是显示网页加载过程中产生各类信息。

<!--more-->

## 显示信息 ##

``` javascript
console.log('hello world');
console.debug('debug');
console.info('信息');
console.error('错误');
console.warn('警告');
```

最常用的就是 `console.log` 了。

## 占位符 ##

`console` 对象还可以使用 printf 风格的占位符。不过只支持字符（`%s`）、整数（`%d` 或 `%i`）、浮点数（`%f`）、对象（`%o`）和 css 样式（`%c`）。

``` javascript
var person = {};
person.name = 'Jack';
person.age = 30;
console.log('%o', person);
console.log('%d年%d月%d日', 2016, 08, 23);
console.log('圆周率：%f', 3.1415926);
console.log('%c改变文本颜色', 'color:green;');
```

## 信息分组 ##

``` javascript
console.group("第一组信息");
console.log("第一组第一条");
console.log("第一组第二条");
console.groupEnd();
console.group("第二组信息");
console.log("第二组第一条");
console.log("第二组第二条");
console.groupEnd();
```

## 查看对象的信息 ##

`console.dir()` 可以显示一个对象所有的属性和方法。

``` javascript
var person = {};
person.name = 'Jack';
person.age = 30;
person.talk = function(str) {
    console.log(str);
}
console.dir(person);
```

## 显示某个节点的内容 ##

`console.dirxml()` 用来显示网页的某个节点（node）所包含的 html/xml 代码。

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>Document</title>
</head>
<body>
    <table id="table">
        <tr>
            <td>1</td>
            <td>2</td>
            <td>3</td>
        </tr>
    </table>
</body>
</html>
<script>
var oTable = document.getElementById('table');
console.log(oTable);
</script>
```

## 判断是否为真 ##

`console.assert()` 用来判断一个表达式或变量是否为真。如果结果为否，则在控制台输出一条相应信息，并且抛出一个异常。

``` javascript
console.assert(1);
console.assert(1 === 2);
```

## 追踪函数的调用轨迹 ##

`console.trace()` 用来追踪函数的调用轨迹。

``` javascript
function add(a, b) {
    console.trace();
    return a + b;
}
var x = add3(1, 1);　　
function add3(a, b) {
    return add2(a, b);
}　　
function add2(a, b) {
    return add1(a, b);
}　　
function add1(a, b) {
    return add(a, b);
}
```

运行后，会显示 `add()` 的调用轨迹，从上到下依次为 `add()`、`add1()`、`add2()`、`add3()`。

## 计时功能 ##

`console.time()` 和 `console.timeEnd()`，用来显示代码的运行时间。

``` javascript
console.time('计时器一');
for (var i = 0; i < 1000; i++) {
    for (var j = 0; j < 1000; j++) {}
}
console.timeEnd('计时器一');
```

## 性能分析 ##

性能分析（Profiler）就是分析程序各个部分的运行时间，找出瓶颈所在，使用的方法是`console.profile()`。

假定有一个函数 `Foo()`，里面调用了另外两个函数 `funcA()` 和 `funcB()`，其中 `funcA()` 调用 10 次，`funcB()` 调用 1 次。

``` javascript
function Foo() {
    for (var i = 0; i < 10; i++) {
        funcA(1000);
    }
    funcB(10000);
}

function funcA(count) {
    for (var i = 0; i < count; i++) {}
}

function funcB(count) {
    for (var i = 0; i < count; i++) {}
}
```

然后，就可以分析 `Foo()` 的运行性能了。

``` javascript
console.profile('性能分析器一');
Foo();
console.profileEnd();
```

## 参考资料 ##

- [Firebug控制台详解](http://www.ruanyifeng.com/blog/2011/03/firebug_console_tutorial.html)