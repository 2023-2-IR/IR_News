var express = require('express');
var router = express.Router();
const HotRouter = require('../controller/hot.controller');

router.post('/add', HotRouter.addHot); //다른 add도 있는데 괜찮겠지? 앞이 다르니까??
router.get('/list', HotRouter.getHot);

module.exports = router;