

w3.org
mdn: Mozilla Development Network

## html

what is HTML and CSS?

    https://www.w3.org/standards/webdesign/htmlcss

    https://developer.mozilla.org/zh-CN/docs/Web/HTML


    HTML is the language for describing the structure of Web pages.

    CSS is the language for describing the presentation of Web pages, including
    colors, layout, and fonts. It allows one to adapt the presentation to
    different types of devices, such as large screens, small screens, or
    printers. 


What is XHTML?

    XHTML is a variant of HTML that uses the syntax of XML, the Extensible
    Markup Language. XHTML has all the same elements (for paragraphs, etc.) as
    the HTML variant, but the syntax is slightly different. Because XHTML is an
    XML application, you can use other XML tools with it (such as XSLT, a
    language for transforming XML content)

what is WebFonts?(w3.org)

    WebFonts is a technology that enables people to use fonts on demand over
    the Web without requiring installation in the operating system.

整体: element（元素）

元素 = 起始标记(begin tag) + 结束标记(end tag) + 元素内容 + 元素属性

属性 = 属性名 + 属性值

属性:
    全局属性:所有元素都有的属性
    局部属性:某些元素特有的属性


http-equiv

    http-equiv stands for: hypertext transfer protocol equivalent and is
    equivalent to HTTP response header.

    equiv does stand for equivalent. It's equivalent to the **HTTP response
    header**. For example, these two are the same

```
<META http-equiv="content-type" content="text/html; charset=UTF-8">
Content-Type: text/html; charset=utf-8
```

    The http-equiv attribute is essentially used to simulate an HTTP response
    header. You may be asking yourself, "Why would I need http-equiv if I can
    just define a response header in my server's configuration?" Well, not
    everyone has access to their server's configuration. This can be true if
    you're using shared hosting where the hosting company makes server config
    changes on your behalf or you just don't have the credentials to access the
    server's config.

    Therefore, the http-equiv attribute can be used within a meta element to
    define certain settings that would otherwise require the use of an HTTP
    response header.

<html lang="cmn-hans">


http-equiv="X-UA-Compatible" content="IE=edge"

    X-UA-Compatible is a **document mode meta tag** that allows web authors to
    choose what version of Internet Explorer the page should be rendered as.

    x-ua-compatible If specified, the content attribute must have the value
    "IE=edge". User agents are required to ignore this pragma.  ## css

    X-UA-Compatible是自从IE8新加的一个设置，对于IE8以下的浏览器是不识别的。通过
    在meta中设置X-UA-Compatible的值，可以指定网页的兼容性模式设置

    


    标准模式页面会按照HTML，CSS的定义渲染，而在怪异模式就是浏览器为了兼容很早之
    前针对旧版本浏览器设计，并未严格遵循W3C标准而产生的一种页面渲染模式。浏览器
    基于页面中文件类型描述去渲染，如果存在一个完整的DOCTYPE则浏览器将会采用标准
    模式，如果缺失就会采用怪异模式

    在Netscape Navigator和Microsoft Internet Explorer为数不多的浏览器盛行时，他
    们对网页有不同的实现方式，那个时候的网页都是针对这两个浏览器写的。随着各种
    浏览器的兴起，加上Web标准的制定，现在的浏览器不能继续使用以前的页面了，所以
    浏览器引入了标准模式和怪异模式来解决这一问题。

    标准模式就是浏览器按照Web标准来渲染页面；为了解决浏览器还是能使用以前写的页
    面，所以怪异模式就产生了。怪异模式在不同的浏览器显示都是不一样的，因为他们
    都是按照自己的方式来渲染页面。

    我们知道了标准模式和怪异模式，可是浏览器是怎么选择模式来渲染页面的呢？我们
    经常在页面的开头看到<!DOCTYPE>声明，这是告诉浏览器选择哪个版本的HTML，对于
    渲染模式的选择，浏览器是根据DTD的声明。如果网页中有DTD标准文档的声明，那浏
    览器会按照标准模式来渲染网页；如果网页没有DTD声明或者HTML4以下的DTD声明，那
    浏览器就按照自己的方式渲染页面，页面进入怪异模式


    x-ua ????随便起的名字吗


**元素的显示效果都由 CSS 来决定**

**选择什么元素，取决于内容的含义**


[HTML5元素周期表](https://www.xuanfengge.com/funny/html5/element/)




HTML 标准中块级元素和行内元素的区别至高出现在 4.01 标准中。在 HTML5，这种区别被
一个更复杂的**内容类别 (content categories)**代替。
    ”块级“类别大致相当于 HTML5 中的**流内容 ()**类别**
    ”行内“类别相当于 HTML5 中的**措辞内容 (phrasing content)类别**
    不过除了这两个还有其他类别。


    While the "inline" category roughly corresponds to the category of **phrasing content, **

    the "block-level" category doesn't directly correspond to any HTML content category,

    but "block-level" and "inline" elements combined together correspond to the **flow content** in HTML

    There are also additional categories, e.g. **interactive content.**

https://developer.mozilla.org/zh-CN/docs/Web/HTML/Block-level_elements


行级，块级 是展示效果, 归 CSS 管理

display:block 它还是行内元素，给了它一个块盒

pre:
    white-space:pre

一般是这样
    <code>
        <pre>
            var i = 1;
        </pre>
    </code>

## 


## javascript
