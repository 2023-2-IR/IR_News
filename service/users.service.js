const UsersDao = require('../dao/users.dao');

async function createUser(req) {
    try {
        if(!req) {
            return {
                "Message" : "createUser data nothing",
                "Status" : 406
            }
        }
        const createUser_data = await UsersDao.createUser(req);
        return {
            "Message" : "createUser success",
            "Status" : 200,
            "Data" : createUser_data
        }
    } catch(err) {
        return {
            "Message" : "createUser service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}

async function getUser(getUser_req) {
    try {
        if(!getUser_req) {
            return {
                "Message" : "getUser data nothing",
                "Status" : 406
            }
        }
        const getUser_data = await UsersDao.getUser(getUser_req);
        return {
            "Message" : "getUser success",
            "Status" : 200,
            "Data" : getUser_data
        }
    } catch(err) {
        return {
            "Message" : "getUser service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}

module.exports = {
    getUser, createUser
}