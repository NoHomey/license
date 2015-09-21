var html = require('html');
var router = (require('express')).Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.send(html('index'));
});

module.exports = router;
