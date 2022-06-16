

const express = require('express')

const app = express();

// 在 express 中处理 携带 body 的 post 请求需要使用的中间件
// 使用中间件，解析 urlencoded 编码的
app.use(express.urlencoded({extended:true}))

// 处理 json 形式的请求体数据 要使用的中间件
app.use(express.json())

app.use(express.static(__dirname+'/src/'))

// 响应 get 请求 接收 query 参数
app.get('/test_get',(request,response)=>{
    console.log("someone is requesting /test_get")
    // three.html
    console.log("query 参数是:",request.query);
    response.send("test_get")
})


// 响应 get 请求 接收 params 参数
//params 参数
//:站位符号
app.get('/test_get2/:name/:age',(request,response)=>{
    console.log("someone is requesting /test_get2")
    // three.html
    console.log("params 参数是:",request.params);
    response.send("test_get2")
})

// 响应 不带参数 get 请求， 返回 json
app.get('/test_get3',(request,response)=>{
    console.log("someone is requesting /test_get3")
    const person = {name:'zhangsan',age:19};
    response.send(JSON.stringify(person));      // 保险起见
})

app.get('/get_person',(request,response)=>{
    console.log("someone is requesting /get_person")
    const person = {name:'zhangsan',age:19};
    response.send(JSON.stringify(person));      // 保险起见
})


// 响应 不带参数 post 请求， 
app.post('/test_post',(request,response)=>{
    console.log("someone is requesting /test_post")
    response.send("test_post")
})

// 响应 带query参数 post 请求， 
app.post('/test_post2',(request,response)=>{
    console.log("someone is requesting /test_post:",request.query)
    response.send("test_post")
})


// 响应 带 params 参数 post 请求， 
app.post('/test_post2/:name/:age',(request,response)=>{
    console.log("someone is requesting /test_post:",request.params)
    response.send("test_post")
})


// 响应 带 body 参数 post 请求， 
app.post('/test_post3',(request,response)=>{
    console.log("someone is requesting /test_post3:",request.body)
    response.send("test_post3")
})




app.listen(8080,(err)=>{
    if(!err){
        console.log("ajax 请求服务器开启成功");
    }
})
