'use strict';
var express = require('express');
var app = express();

var port = process.env.PORT || 80;
var randomNumber = parseFloat((Math.random() * 100)).toFixed(2);

app.get("/", function(req, res, next) {
  res.set('Content-Type', 'text/plain');
  res.send("Hello World! " + String(randomNumber));
});

app.listen(port);
