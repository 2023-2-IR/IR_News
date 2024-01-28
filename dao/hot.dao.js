const db = require('../config/db');
const logger = require('../config/logger');

async function addHotBk(req) { //여기서 req.time 은 날짜까지만 나오도록 설정?? 안되면 날짜 00:00:00
    return new Promise((resolve, reject) => {
        var queryData = `select bk_id, bk_hits from breaking where bk_time >= ${req.time}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [breaking]' +
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}
async function addHotNews(req) { //여기서 req.time 은 날짜까지만 나오도록 설정?? 안되면 날짜 00:00:00
    return new Promise((resolve, reject) => {
        var queryData = `select pnews_id, pnews_hits from pnews where pnews_time >= ${req.time}`;
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
async function getHotId(req) {
    return new Promise((resolve, reject) => {
        var queryData = `select cat_id, pnews_id from hot where pnews_time >= ${req.time} limit 5`;
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
async function getHotBk(req) {
    return new Promise((resolve, reject) => {
        var queryData = `select bk_id, bk_title, bk_img, bk_hits from breaking where bk_id = ${req.id}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [breaking]' +
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
        var queryData = `select pnews_id, pnews_title, pnews_img, pnews_hits from breaking where pnews_id = ${req.id}`;
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
    addHotBk,
    addHotNews,
    getHotId,
    getHotBk,
    getHotNews
}