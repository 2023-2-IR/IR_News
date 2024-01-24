const db = require('../config/db');
const logger = require('../config/logger');

async function createUser(req) {
    return new Promise((resolve, reject) => {
        var queryData = `insert into user (id, pw) values ('${req.id}', '${req.pw}')`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [user]' +
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data); //가능하다면 insertId 만 반환할 수 있게 수정
        })
    })
}

async function getUser(getUser_req) {
    return new Promise((resolve, reject) => {
        var queryData = `SELECT * FROM user WHERE user_id = ${getUser_req.user_id}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [user]' + 
                    '\n \t' + queryData + 
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}

module.exports = {
    getUser, createUser
}