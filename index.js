'use strict';

const express = require('express');
const fs = require("fs");

const app = express();
const PORT = process.env.PORT || 80;

app.get("*", function(req, res, next) {
  let randomNumber = parseInt(String(parseFloat((Math.random() * 100)).toFixed(2)),10);
  let buildID = fs.readFileSync("build_id.txt", "utf-8").trim();
  res.json({ "message": "Hello World!, Welcome to my world.", "random number": randomNumber, "build": buildID });
});

app.listen(PORT);
