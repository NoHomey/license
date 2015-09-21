var path = require('path');
var bodyParser = require('body-parser');
var express = require('express');
var http = require('http');
var routes = require('./routes/index');
var users = require('./routes/users');
var html = require('html');
var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use('/', routes);
app.use('/users', users);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

app.use(function(err, req, res, next) {
  res.send(html('error'));
});

var server = http.createServer(app);
server.listen(process.env.PORT || 3000);
