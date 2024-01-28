const db = require('../config/db');
const logger = require('../config/logger');

async function addCg(req) {  //category table 숫자로 하는거 어떻게... 수정해야하나?
    return new Promise((resolve, reject) => {
        var queryData = `insert into user (category) values ('${req.category}')
        where user_id = ${req.user_id}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [user, category]' +
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}
async function getCg(req) {
    return new Promise((resolve, reject) => {
        var queryData = `select category from user where user_id = ${req.user_id}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [user, category]' +
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}
async function editCg(req) {
    return new Promise((resolve, reject) => {
        var queryData = `update user set category = '${req.category}' where user_id = ${req.user_id}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [user, category]' +
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
    addCg, getCg, editCg
}