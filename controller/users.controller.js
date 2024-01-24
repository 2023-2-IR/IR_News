const UsersService = require('../service/users.service');

async function createUser(req, res, next) {
    try {
        const createUser_req = req.body;
        console.log(createUser_req);
        const createUser_data = await UsersService.createUser(createUser_req);
        return res.json(createUser_data);
    } catch(err) {
        console.log("createUser controller err");
    }
}

async function getUser(req, res, next) {
    try {
        const getUser_req = req.query;
        console.log(getUser_req);
        const getUser_data = await UsersService.getUser(getUser_req);
        return res.json(getUser_data)
    } catch(err) {
        console.log("getUser controller err");
    }
}

module.exports = {
    getUser, createUser
}