/* eslint-disable unicorn/prefer-module */

const express = require('express');
const cors = require('cors');
const path = require('node:path');
const fs = require('node:fs');

const app = express();

const PORT = '/tmp/nginx.socket'; // process.env.PORT || 8080

app.use(function (req, res, next) {
  req.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Origin', '*');
  req.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept'
  );
  res.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept'
  );
  req.header(
    'Access-Control-Allow-Methods',
    'POST, GET, OPTIONS, PUT, PATCH, DELETE'
  );
  res.header(
    'Access-Control-Allow-Methods',
    'POST, GET, OPTIONS, PUT, PATCH, DELETE'
  );
  next();
});

app.use(cors());

app.use(express.static(path.join(__dirname, '..', 'build')));

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname, '..', 'build', 'index.html'));
});
app.get('/cart', function (req, res) {
  res.sendFile(path.join(__dirname, '..', 'build', 'index.html'));
});
app.get('/cart/*', function (req, res) {
  res.sendFile(path.join(__dirname, '..', 'build', 'index.html'));
});
app.get('/product', function (req, res) {
  res.sendFile(path.join(__dirname, '..', 'build', 'index.html'));
});
app.get('/product/*', function (req, res) {
  res.sendFile(path.join(__dirname, '..', 'build', 'index.html'));
});
app.get('/products', function (req, res) {
  res.sendFile(path.join(__dirname, '..', 'build', 'index.html'));
});
app.get('/products/*', function (req, res) {
  res.sendFile(path.join(__dirname, '..', 'build', 'index.html'));
});

const server = app.listen(PORT, (error) => {
  if (error) {
    throw error;
  }

  fs.openSync('/tmp/app-initialized', 'w');

  const address = server.address().address;
  const port = server.address().port;

  console.log(
    `
    >>>
    >>> Server is Running...
    >>> Address: [${address}]
    >>> Port: [${port}]
    >>>
    `
  );
});
