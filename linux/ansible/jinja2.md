# Jinja2

1. 文件后缀: .j2, 也可以没有后缀

2. 三种定界符号:
    1. 注释     {# 注释内容}
    2. 变量引用 {{ var }}
    3. 逻辑表达 {% %}



## 条件表达

1. 判断

    {% if %}
    ...
    {% endif %}


    {# 如果定义了 idc 变量,则输出 #}
    {% if idc is defined %}
    {{ idc }}
    {% endif %}

2. 循环

{% for %}
...
{% endfor %}


{# 列出 webs 这个组中的所有主机 #}
{% for host in groups['webs']}
{{ host }}
{% endfor %}


不能有 break 和 continue

    {% for host in groups['web'] if host !='1.1.1.1'}
    {{ host }}
    {% endfor %}
