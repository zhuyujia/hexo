title: csshover 解决 ie6 下 hover 兼容问题
date: 2016-03-28 10:20:43
categories: javascript
keywords: ie6, javascript, hover
tags: [ie6, javascript, hover]
---

在 ie6 下只有 a 标签支持 `:hover` 伪类，其它都不支持，很是让人头疼。不过可以通过 **csshover.htc** 可以解决 ie6 的 hover 兼容问题。

**csshover.htc** 利用 javascript 脚本来给元素的样式定义，如果检测到 hover 定义，就给元素设置 `onmouseover` 和 `onmouseout` 事件，以此来实现 hover 的效果。
<!--more-->

## 代码 ##

``` javascript
<attach event="ondocumentready" handler="parseStylesheets"/>
<script language="JScript">
var currentSheet, doc = window.document, activators = {
    onhover:{on:'onmouseover', off:'onmouseout'},
    onactive:{on:'onmousedown', off:'onmouseup'}
};
function parseStylesheets(){
    var sheets = doc.styleSheets, l = sheets.length;
    for(var i = 0; i < l; i++){
       parseStylesheet(sheets[i]);
    };
};
function parseStylesheet(sheet){
    if(sheet.imports){
        try{
            var imports = sheet.imports, l = imports.length;
            for(var i = 0; i < l; i++){
                parseStylesheet(sheet.imports[i]);
            };
        }catch(securityException){};
    };

    try{
        var rules = (currentSheet = sheet).rules, l = rules.length;
        for(var j = 0; j < l; j++){
            parseCSSRule(rules[j]);
        };
    }catch(securityException){};
};
function parseCSSRule(rule){
    var select = rule.selectorText, style = rule.style.cssText;
    if(!(/(^|\s)(([^a]([^ ]+)?)|(a([^#.][^ ]+)+)):(hover|active)/i).test(select) || !style) return;

    var pseudo = select.replace(/[^:]+:([a-z-]+).*/i, 'on$1');
    var newSelect = select.replace(/(\.([a-z0-9_-]+):[a-z]+)|(:[a-z]+)/gi, '.$2' + pseudo);
    var className = (/\.([a-z0-9_-]*on(hover|active))/i).exec(newSelect)[1];
    var affected = select.replace(/:hover.*$/, '');
    var elements = getElementsBySelect(affected);

    currentSheet.addRule(newSelect, style);
    for(var i = 0; i < elements.length; i++){
        new HoverElement(elements[i], className, activators[pseudo]);
    };
};
function HoverElement(node, className, events){
    if(!node.hovers) node.hovers = {};
    if(node.hovers[className]) return;
    node.hovers[className] = true;
    node.attachEvent(events.on, function(){
        node.className += ' ' + className;
    });
    node.attachEvent(events.off, function(){
        node.className = node.className.replace(new RegExp('\\s+'+className, 'g'),'');
    });
};
function getElementsBySelect(rule){
    var parts, nodes = [doc];
    parts = rule.split(' ');
    for(var i = 0; i < parts.length; i++){
        nodes = getSelectedNodes(parts[i], nodes);
    };
    return nodes;
};
function getSelectedNodes(select, elements){
    var result, node, nodes = [];
    var classname = (/\.([a-z0-9_-]+)/i).exec(select);
    var identify = (/\#([a-z0-9_-]+)/i).exec(select);
    var tagName = select.replace(/(\.|\#|\:)[a-z0-9_-]+/i, '');
    for(var i = 0; i < elements.length; i++){
        result = tagName ? elements[i].all.tags(tagName) : elements[i].all; 
        for(var j = 0; j < result.length; j++){
            node = result[j];
            if((identify && node.id != identify[1]) || (classname && !(new RegExp('\\b' + classname[1] + '\\b').exec(node.className)))) continue;
            nodes[nodes.length] = node;
        };
    };
    return nodes;
};
</script>
```

## 如何引用 ##

``` css
body {
    behavior:url(csshover.htc);
}
```

需要注意的是引用 htc 的路径问题：不管你是在 css 文件里面引用 htc 文件，还是 html 里面引用 htc 文件，都是以 html 文件去找 htc 的路径。