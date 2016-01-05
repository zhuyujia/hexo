title: param 及 embed 标签相关属性详解
date: 2015-12-28 21:27:57
categories: html
keywords: html, object, param, embed, flash
tags: [html, object, param, embed, flash]
---

本文主要介绍 `param` 和 `embed` 标签中一些属性和属性值的含义以及使用方法。
<!--more-->

首先我们需要知道 `param` 和 `embed` 标签是单独出现的，而不是成对出现的，下面的代码是一般 flash 嵌套的代码：

```html
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>flash嵌套</title>
</head>
<body>
    <object width="468" height="287" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">
        <param name="movie" value="flash.swf"/>
        <param name="quality" value="high"/>
        <param name="wmode"value="transparent"/>
        <embed width="468" height="287" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" quality="high" wmode="transparent" src="flash.swf"/>
    </object>
</body>
</html>
```

**注意：**除非特别说明，否则所有属性都同时适用于 `param` 标签和 `embed` 标签，可选属性也在此列出。Internet Explorer 可以识别 `param` 标签的属性，而 Netscape 则可以识别 `embed` 标签的属性。

| 属性 | 属性值 | 说明 |
| --- | --- | --- |
| devicefont | true/false	| （可选）对于未选定“设备字体”选项的静态文本对象，指定是否仍使用设备字体进行绘制（如果操作系统提供了所需字体）。
| src | xxx.swf | 指定要加载的 swf 文件的名称。仅适用于 `embed`。
| movie | xxx.swf | 指定要加载的 swf 文件的名称。仅适用于 `param`。
| autoplay | true/false | （可选）指定应用程序是否在浏览器中加载时就开始播放。如果您的 flash 应用程序是交互式的，则可以让用户通过单击按钮或执行某些其他任务来开始播放。在这种情况下，将 play 属性设置为 false 可禁止应用程序自动开始播放。如果忽略此属性，默认值为 true。
| loop | true/false | （可选）指定 flash 内容在它到达最后一帧后是无限制重复播放还是停止。如果忽略此属性，默认值为 true。
| quality | low/medium/high/<br>autolow/autohigh/best | （可选）指定在应用程序回放期间使用的消除锯齿级别。因为消除锯齿需要更快的处理器先对 swf 文件的每一帧进行平滑处理，然后再将它们呈现到观众屏幕上，所以需要根据要优化速度还是优化外观来选择一个值：<br>low 使回放速度优先于外观，而且从不使用消除锯齿功能。<br>autolow 优先考虑速度，但是也会尽可能改善外观。回放开始时，消除锯齿功能处于关闭状态。如果 flash player 检测到处理器可以处理消除锯齿功能，就会打开该功能。<br>autohigh 在开始时是回放速度和外观两者并重，但在必要时会牺牲外观来保证回放速度。回放开始时，消除锯齿功能处于打开状态。如果实际帧频降到指定帧频之下，就会关闭消除锯齿功能以提高回放速度。使用此设置可模拟 flash 中的“消除锯齿”命令（查看>预览模式>消除锯齿）。<br>medium 会应用一些消除锯齿功能，但并不会平滑位图。该设置生成的图像品质要高于 low 设置生成的图像品质，但低于 high 设置生成的图像品质。<br>high 使外观优先于回放速度，它始终应用消除锯齿功能。如果 swf 文件不包含动画，则会对位图进行平滑处理；如果 swf 文件包含动画，则不会对位图进行平滑处理。<br>best 提供最佳的显示品质，而不考虑回放速度。对所有输出都进行消除锯齿处理，并且对所有位图都进行平滑处理。<br>如果忽略 quality 属性，其默认值为 high。
| bgcolor | 16进制 RGB 值 | （可选）指定应用程序的背景色。使用此属性来覆盖在 flash swf 文件中指定的背景色设置。此属性不影响 html 页面的背景色。
| scale | showall/noborder/exactfit/noscale | （可选）当 `width` 和 `height` 值是百分比时，定义应用程序如何放置在浏览器窗口中。<br>showall 使整个 flash 内容显示在指定区域中，且不会发生扭曲，同时保持它的原始高宽比。边框可能会出现在应用程序的两侧。<br>noborder 对 flash 内容进行缩放以填充指定区域，不会发生扭曲，它会使应用程序保持原始高宽比，但有可能会进行一些裁剪。<br>exactfit 使整个 flash 内容显示在指定区域中，但不尝试保持原始高宽比。可能会发生扭曲。<br>noscale 使整个 falsh 内容不缩放，原始比例<br>如果忽略此属性（而且 width 和 height 值是百分比），则它的默认值是 showall。
| salign | L/R/T/B/TL/TR/BL/BR | （可选）指定缩放的 flash swf 文件在由 `width` 和 `height` 设置定义的区域内的位置。有关这些条件的详细信息，请参阅 scale 属性/参数。<br>L、R、T 和 B 让应用程序分别沿着浏览器窗口的左、右、上、下边缘对齐，并根据需要裁剪其余三边。<br>TL 和 TR 让应用程序分别与浏览器窗口的左上角和右上角对齐，并根据需要裁剪底边和剩余的右侧或左侧边缘。<br>BL 和 BR 让应用程序分别与浏览器窗口的左下角和右下角对齐，并根据需要裁剪顶边和剩余的右侧或左侧边缘。<br>如果忽略此属性，flash 内容会在浏览器窗口中居中显示。
| base | 基本目录或 url | （可选）指定用于解析 flash swf 文件中的所有相对路径语句的基本目录或 url。如果 swf 文件保存在与您的其他文件不同的目录下，这个属性是非常有用。
| menu | true/false | （可选）指定当观众在浏览器中右击应用程序区域时将显示的菜单类型。<br>true 显示完整的菜单，让用户使用各种选项增强或控制回放。<br>false 显示的是一个只包含“关于 Macromedia Flash Player 6”选项和“设置”选项的菜单。<br>如果忽略此属性，默认值为 true。
| wmode | window/opaque/transparent | （可选）使您可以使用 Internet Explorer 4.0 中的透明 flash 内容、绝对定位和分层显示的功能。此标记/属性仅在带有 Flash Player ActiveX 控件的 windows 中有效。<br>window 默认值，始终位于 html 的顶层。<br>opaque 允许 flash 上层可以有网页的遮挡。<br>transparent 使 html 页的背景可以透过应用程序的所有透明部分进行显示，这样可能会降低动画性能。
| allowscriptaccess | always/never/samedomain | （可选）使用 allowscriptaccess 使 flash 应用程序可与承载它的 html 页面进行通信。<br>always 允许随时执行脚本操作。<br>never 禁止所有脚本执行操作。<br>samedomain 只有在 flash 应用程序来自与 html 页相同的域时才允许执行脚本操作。<br>如果忽略此属性，默认值为 samedomain。