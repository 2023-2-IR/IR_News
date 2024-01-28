var express = require('express');
var router = express.Router();
const NewsController = require('../controller/news.controller');

router.get('/breakinglist', NewsController.getBkList);
router.get('/breaking', NewsController.getBk);
router.get('/ctglist', NewsController.getCtgList);
router.get('/ctg', NewsController.getCtg);

module.exports = router;