var express = require('express');
var router = express.Router();
var path = require('path');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render(path.join(__dirname, '..', 'views', 'index.ejs'), { title: 'Data Visualization Tool' });
});

module.exports = router;
