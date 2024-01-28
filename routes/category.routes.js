var express = require('express');
var router = express.Router();
const CategoryController = require('../controller/category.controller');

router.put('/add', CategoryController.addCg);
router.get('/', CategoryController.getCg);
router.put('/edit', CategoryController.editCg);

module.exports = router;