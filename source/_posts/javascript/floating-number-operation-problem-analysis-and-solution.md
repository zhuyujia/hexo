title: 浮点数运算问题分析及解决方法
date: 2016-03-21 09:36:55
categories: javascript
keywords: javascript, 浮点数, 浮点数运算
tags: [javascript, 浮点数, 浮点数运算]
description: 在 js 中只有一种数字类型 Number，而且在 js 中所有的数字都是以 IEEE-754 标准格式表示的。浮点数的精度问题并不是 js 特有的，因为有些小数以二进制表示位数是无穷的，比如 1.1，其程序实际上无法真正的表示 1.1，而只能做到一定程度上的准确（1.09999999999999999），这是无法避免的精度丢失。
---

## 问题 ##

在用 js 进行小数四则运算时发现了一个重大问题，比如：

``` javascript
console.log(0.7 * 0.8);	//0.5599999999999999
```

## 分析 ##

在 js 中只有一种数字类型 Number，而且在 js 中所有的数字都是以 IEEE-754 标准格式表示的。浮点数的精度问题并不是 js 特有的，因为有些小数以二进制表示位数是无穷的，比如 1.1，其程序实际上无法真正的表示 1.1，而只能做到一定程度上的准确（1.09999999999999999），这是无法避免的精度丢失。

通过控制台，我们可以得到一些测试数据：

``` javascript
1 - 0.9 == 0.1	//false
1 - 0.8 == 0.2	//false
1 - 0.7 == 0.3	//false
1 - 0.6 == 0.4	//true
```

## 解决方法 ##

那么该如何避免这类问题呢？解决的方法有很多，比较常用的是将浮点数转化成整数再做运算。

``` javascript
//除法函数，用来得到精确的除法结果
//说明：javascript 的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。
//调用：accDiv(arg1,arg2)
//返回值：arg1 除以 arg2 的精确结果
function accDiv(arg1,arg2){
    var t1 = 0,t2 = 0,r1,r2;
    try{t1 = arg1.toString().split('.')[1].length}catch(e){}
    try{t2 = arg2.toString().split('.')[1].length}catch(e){}
    with(Math){
        r1 = Number(arg1.toString().replace('.',''));
        r2 = Number(arg2.toString().replace('.',''));
        return (r1 / r2) * pow(10,t2 - t1);
    }
}
//给 Number 类型增加一个 div 方法，调用起来更加方便。
Number.prototype.div = function (arg){
    return accDiv(this, arg);
};
//乘法函数，用来得到精确的乘法结果
//说明：javascript 的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果。
//调用：accMul(arg1,arg2)
//返回值：arg1 乘以 arg2 的精确结果
function accMul(arg1,arg2)
{
    var m = 0,s1 = arg1.toString(),s2 = arg2.toString();
    try{m += s1.split('.')[1].length}catch(e){}
    try{m += s2.split('.')[1].length}catch(e){}
    return Number(s1.replace('.',''))*Number(s2.replace('.','')) / Math.pow(10,m);
}
//给 Number 类型增加一个 mul 方法，调用起来更加方便。
Number.prototype.mul = function (arg){
    return accMul(arg, this);
};
//加法函数，用来得到精确的加法结果
//说明：javascript 的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。
//调用：accAdd(arg1,arg2)
//返回值：arg1 加上 arg2 的精确结果
function accAdd(arg1,arg2){
    var r1,r2,m;
    try{r1 = arg1.toString().split('.')[1].length}catch(e){r1 = 0}
    try{r2 = arg2.toString().split('.')[1].length}catch(e){r2 = 0}
    m = Math.pow(10,Math.max(r1,r2));
    return (arg1 * m + arg2 * m) / m;
}
//给 Number 类型增加一个 add 方法，调用起来更加方便。
Number.prototype.add = function (arg){
    return accAdd(arg,this);
}
//减法函数
function accSub(arg1,arg2){
    var r1,r2,m,n;
    try{r1 = arg1.toString().split('.')[1].length}catch(e){r1 = 0}
    try{r2 = arg2.toString().split('.')[1].length}catch(e){r2 = 0}
    m = Math.pow(10,Math.max(r1,r2));
    //动态控制精度长度
    n = (r1 >= r2) ? r1 : r2;
    return ((arg2 * m - arg1 * m) / m).toFixed(n);
}
///给 Number 类增加一个 sub 方法，调用起来更加方便
Number.prototype.sub = function (arg){
    return accSub(arg,this);
}
```

这样如果你要计算 0.7 * 0.8，只需 `(0.7).mul(0.8)`，调用 `mul` 方法就可以得到准确的结果了。

## 总结 ##

1. 尽量不要用 js 进行复杂的运算，特别是浮点数的运算。
2. 如果一定要进行浮点数运算，先将浮点数转化为整型，再运算。