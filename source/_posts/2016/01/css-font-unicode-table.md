title: css 中文字体 unicode 对照表
date: 2016-01-14 10:02:20
categories: css
keywords: css, 字体, unicode
tags: [css, 字体, unicode]
---

css 字体名可以使用 2 种 unicode 格式，以“微软雅黑”为例：`&#x5FAE;&#x8F6F;&#x96C5;&#x9ED1;` 和 `\5FAE\8F6F\96C5\9ED1`。

另外注意：繁体中文字体名，在简体中文系统中是不能被识别的。
<!--more-->

常用字体参考如下：

| 中文名 | 英文名 | unicode | unicode2 |
| --- | --- | --- | --- |
| 宋体 |	SimSun | \5B8B\4F53 | &#x5B8B;&#x4F53; |
| 黑体 |	SimHei | \9ED1\4F53 | &#x9ED1;&#x4F53; |
| 新宋体 | NSimSun | \65B0\5B8B\4F53 | &#x65B0;&#x5B8B;&#x4F53; |
| 楷体 |	KaiTi | \6977\4F53 | &#x6977;&#x4F53; |
| 微软正黑体 | Microsoft JhengHei | \5FAE\x8F6F\6B63\9ED1\4F53 | &#x5FAE;&#x8F6F;&#x6B63;&#x9ED1;&#x4F53; |
| 微软雅黑 |	Microsoft YaHei | \5FAE\8F6F\96C5\9ED1 | &#x5FAE;&#x8F6F;&#x96C5;&#x9ED1; |

更多字体[点此查看](http://hotoo.googlecode.com/svn/trunk/labs/css/css-fonts.html)。