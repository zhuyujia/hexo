title: javascript 变量命名规则
date: 2015-10-14 11:19:29
categories: 规范
keywords: 前端, 规范, 前端规范, javascript, jquery, 变量命名, 匈牙利命名, 驼峰式命名, 帕斯卡命名
tags: [前端规范, 规范, javascript, 变量命名]
---

javascript 有三大经典的变量命名法：匈牙利命名法，驼峰式命名法和帕斯卡命名法。今天主要介绍下这三种命名方式。
<!--more-->

## 匈牙利命名法 ##

### 语法 ###

> 变量名 = 类型 + 对象描述

- 类型指变量的类型
- 对象描述指对象名字全称或名字的一部分，要求有明确含义，命名要容易记忆容易理解。

通过在变量名前面添加相应小写字母的符号标示作为前缀，标示出变量的类型，前缀后面是一个或多个单词组合，单词描述了变量的用途。如果是 jquery 对象，则用 `$` 作为变量名的前缀。

### 提示 ###

虽然 javascript 变量表面上没有类型，但是 javascript 内部还是会为变量赋予相应的类型。

匈牙利命名法是一位微软程序员发明的，多数的 c，c++ 程序都使用此命名法。

### 类型 ###

| javascript 变量命名类型 | 变量命名前缀 |
| --- | --- |
| array 数组 | a |
| boolean 布尔值 | b |
| float 浮点数 | l |
| function 函数 | fn |
| int 整型 | i |
| object 对象 | o |
| regular 正则 | r |
| string 字符串 | s |

### 示例 ###

``` javascript
var aName = [1, 2, 3];	//array 数组
var oBtn = document.getElementById('btn');	//object 对象
function fnName(){};	//function 函数
var iCount = 0;	//int 整型
var sName = "zhuyujia";	//string 字符串
```

## 驼峰式命名法 ##

### 语法 ###

变量名或函数名是由一个或多个单词连结在一起，**其中第一个单词以小写字母开始，后面的所有单词的首字母都采用大写字母**，这样的变量名看上去就像骆驼峰一样此起彼伏，故得名。

### 示例 ###

``` javascript
var myName = "zhuyujia";
var formSubmit = document.getElementById("submit");
function timeCount(){}
```

## 帕斯卡命名法 ##

### 语法 ###

和驼峰式命名法类似，只不过第一个单词的首字母需要大写。

### 示例 ###

``` javascript
var MyName = "zhuyujia";
var FormSubmit = document.getElementById("submit");
function TimeCount(){}
```

## 参考文献 ##

> [http://www.wangyingran.com/archives/550.html](http://www.wangyingran.com/archives/550.html)
> [http://www.cnblogs.com/hare/p/3467851.html](http://www.cnblogs.com/hare/p/3467851.html)
> [http://www.51texiao.cn/javascriptjiaocheng/2015/0721/6961.html](http://www.51texiao.cn/javascriptjiaocheng/2015/0721/6961.html)