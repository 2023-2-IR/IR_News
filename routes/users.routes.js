var express = require('express');
var router = express.Router();
const UsersController = require('../controller/users.controller');

router.post('/create', UsersController.createUser);
router.get('/', UsersController.getUser);

module.exports = router;