const db = require('../config/db');
const logger = require('../config/logger');

async function addHotNews(req) {
    return new Promise((resolve, reject) => {
        var queryData = `SELECT pnews_id, pnews_hits as hits FROM pnews WHERE DATE_FORMAT(pnews_time, "%Y-%m-%d") = CURDATE() limit 10`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [pnews]' +
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}
async function addHotNewsData(req) {
    return new Promise((resolve, reject) => {
        var queryData = `insert into hot (pnews_id) values(${req})`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [hot]' +
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}
async function getHotId(req) {
    return new Promise((resolve, reject) => { //join 필요 오류있음
        var queryData = `select cat_id, pnews_id from hot WHERE DATE_FORMAT(pnews_time, "%Y-%m-%d") = CURDATE() limit 10`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [hot]' + 
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}
async function getHotNews(req) {
    return new Promise((resolve, reject) => {
        var queryData = `select pnews_id, pnews_title, pnews_img, pnews_hits cat_id from pnews where pnews_id = ${req.id}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [pnews]' +
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
    addHotNews,
    addHotNewsData,
    getHotId,
    getHotNews
}