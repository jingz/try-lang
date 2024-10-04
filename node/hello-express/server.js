var express = require("express");
var app = express();

app.get('/hello.txt', function(req, res) {
    var body = 'Hello World!';
    res.setHeader('Content-Type', 'text/plain');
    res.setHeader('Content-Length', Buffer.byteLength(body));
    console.log("query", req.query)
    console.log("params", req.params)
    res.end(body);
});

app.get('/test', function(req, res) {
    var test = 'test';
    res.end(test);
});

console.log(__dirname)

app.listen(4000);
console.log('Listen to port 4000');
