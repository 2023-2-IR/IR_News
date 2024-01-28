const db = require('../config/db');
const logger = require('../config/logger');

async function getBkList() {
    return new Promise((resolve, reject) => {
        var queryData = `select bk_id, bk_title, bk_img, bk_time, bk_hits from breaking order by bk_hits desc`;
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
async function getBk(req) {
    return new Promise((resolve, reject) => {
        var queryData = `select bk_title, bk_img, bk_cont, bk_time, bk_word from breaking where bk_id = ${req.bk_id}`;
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
async function getCtgList() {
    return new Promise((resolve, reject) => {
        var queryData = `select pnews_id, pnews_title, pnews_img, pnews_cont, pnews_time, pnews_hits from pnews order by pnews_hits desc`;
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
async function getCtg(req) {
    return new Promise((resolve, reject) => {
        var queryData = `select pnews_title, pnews_img, pnews_cont, pnews_time, pnews_word from pnews where pnews_id = ${req.pnews_id}`;
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
async function getCtgClip(req) {
    return new Promise((resolve, reject) => {
        var queryData = `SELECT clip_id FROM clip WHERE user_id=${req.user_id} AND pnews_id=${req.pnews_id}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [clips]' +
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}
async function searchPreviousFromBk(req) {
    return new Promise((resolve, reject) => {
        var queryData = `select bk_id from breaking where bk_group = ${req.group} and bk_level = ${req.level - 1}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [braeking]' +
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}
async function searchPreviousFromPnews() {
    return new Promise((resolve, reject) => {
        var queryData = `select pnews_id from breaking where pnews_group = ${req.group} and pnews_level = ${req.level - 1}`;
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
async function searchNextFromBk(req) {
    return new Promise((resolve, reject) => {
        var queryData = `select bk_id from breaking where bk_group = ${req.group} and bk_level = ${req.level + 1}`;
        db.query(queryData, (error, db_data) => {
            if(error) {
                logger.error (
                    'DB error [braeking]' +
                    '\n \t' + queryData +
                    '\n \t' + error
                )
                reject("DB ERR");
            }
            resolve(db_data);
        })
    })
}
async function searchNextFromPnews() {
    return new Promise((resolve, reject) => {
        var queryData = `select pnews_id from breaking where pnews_group = ${req.group} and pnews_level = ${req.level + 1}`;
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
    getBkList, 
    getBk,
    getCtgList, 
    getCtg,
    getCtgClip, 
    searchPreviousFromBk, 
    searchPreviousFromPnews,
    searchNextFromBk,
    searchNextFromPnews
}