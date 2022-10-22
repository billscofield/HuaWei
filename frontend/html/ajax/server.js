const express = require('express')

const app = express()
app.use(express.static(__dirname + '/src'))

// express 中使用post的请求体方法要加载这个
// 使用中间件解析 urlencoded 编码形式的请求体参数
// app.use(express.urlencoded({ extended: true }))

// 解析 json 编码格式的请求
app.use(express.json())

// 响应 get 请求之 query
app.get('/test_get', (request, response) => {
    console.log("someone is requiring /test_get")
    console.log("query 参数是: ", request.query)
    response.send('hello test_get!!')
})

// 响应 get 请求之 query
app.get('/test_get_json', (request, response) => {
    console.log("someone is requiring /test_get")
    console.log("query 参数是: ", request.query)
    const person = {name:'bob',age:22}
    response.send(JSON.stringify(person))
})

// 响应 get 请求之 params
app.get('/test_get/:name/:age', (request, response) => {
    console.log("someone is requiring /test_get/:name/:age ")
    console.log("params 参数是: ", request.params)
    response.send('hello test_get!! params')
})


// 响应 post 请求之 query
/*
app.post('/test_post', (request, response) => {
    console.log("someone is requiring /test_post")
    console.log("post 参数是: ", request.query)
    response.send('hello_test_post')
})
*/

// 响应 post 请求 之 params
app.post('/test_post/:name/:age', (request, response) => {
    console.log("someone is requiring /test_post")
    console.log("post 参数是: ", request.params)
    response.send('hello_test_post')
})

// 响应 post 请求 之 请求体 body
app.post('/test_post', (request, response) => {
    console.log("someone is requiring body of /test_post")
    console.log("post 参数是: ", request.body)
    response.send('hello_test_post')
})

app.listen(8080, (err) => {
    if (!err) {
        console.log("server is ok");
        console.log('http://127.0.0.1/ajax01.html')
        console.log('http://127.0.0.1/ajax02.html')
        console.log('http://127.0.0.1/ajax03.html')
        console.log('http://127.0.0.1/ajax04.html')
    }

})