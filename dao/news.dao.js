const db = require('../config/db');
const logger = require('../config/logger');

async function getBkList(req) {  //가져와서 인기순대로 정리 해야됨
    return new Promise((resolve, reject) => {
        var queryData = `select bk_id, bk_title, bk_img, bk_time, bk_hits from breaking where bk_time >= ${req.time}`;
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
async function getBk(req) {  //clip은 스크랩 여부인데 얘 고민해보기....
    return new Promise((resolve, reject) => {
        var queryData = `select bk_title, bk_img, bk_cont, bk_time, bk_word, bk_clip from breaking where bk_id = ${req.id}`;
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
async function getCtgList(req) {  //가져와서 인기순대로 정리 해야됨
    return new Promise((resolve, reject) => {
        var queryData = `select pnews_id, pnews_title, pnews_img, pnews_cont, pnews_time, pnews_hits from pnews where pnews_time >= ${req.time}`;
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
async function getCtg(req) {  //clip은 스크랩 여부인데 이거 따로 빼야하나???
    return new Promise((resolve, reject) => {
        var queryData = `select pnews_title, pnews_img, pnews_cont, pnews_time, pnews_word, pnews_clip from pnews where pnews_id = ${req.id}`;
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
    searchPreviousFromBk, 
    searchPreviousFromPnews,
    searchNextFromBk,
    searchNextFromPnews
}