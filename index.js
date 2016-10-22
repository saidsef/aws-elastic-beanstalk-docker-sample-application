'use strict';
var express = require('express');
var fs = require("fs");
var app = express();

var port = process.env.PORT || 80;
var randomNumber = parseFloat((Math.random() * 100)).toFixed(2);

app.get("*", function(req, res, next) {
  var buildID = fs.readFileSync("build_id.txt", "utf-8").trim();
  res.json({ "message": "Hello World!", "random number": parseInt(String(randomNumber),10), "version": buildID });
});

app.listen(port);
