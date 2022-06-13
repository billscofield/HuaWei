

链式调用
读写合一
易扩展插件


window.jQuery = window.$ = jQuery;

jQuery = function(selector, context){
    return new jQuery.fn.init( selector, context  );
}
