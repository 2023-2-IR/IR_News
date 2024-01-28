const db = require('../config/db');
const logger = require('../config/logger');

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
    getCg, editCg
}