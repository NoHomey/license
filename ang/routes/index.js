var html = require('html');
var router = (require('express')).Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.send(html('index'));
});

router.get('/view-app.html', function(req, res, next) {
  res.send(html('view-app'));
});

router.get('/view-login.html', function(req, res, next) {
  res.send(html('view-login'));
});

router.get('/data', function(req, res, next) {
  res.send({value : ['ivo', 'aa', 'dfdfd']});
});


module.exports = router;
