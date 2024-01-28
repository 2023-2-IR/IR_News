const NewsService = require('../service/news.service');

async function getBkList(req, res, next) {
    try {
        // const today = new Date();
        // var year = today.getFullYear();
        // var month = ('0' + (today.getMonth() + 1)).slice(-2);
        // var day = ('0' + today.getDate()).slice(-2);
        // var hours = ('0' + today.getHours()).slice(-2); 
        // var minutes = ('0' + today.getMinutes()).slice(-2);
        // var seconds = ('0' + today.getSeconds()).slice(-2);
        // var getBkList_req = year + '-' + month  + '-' + day + " " + hours + ':' + minutes  + ':' + seconds; 
        // console.log(getBkList_req);
        const getBkList_data = await NewsService.getBkList();
        return res.json(getBkList_data);
    } catch(err) {
        console.log("get breaking list controller err");
    }
}
async function getBk(req, res, next) {
    try {
        const getBk_req = req.query;
        console.log(getBk_req);
        const getBk_data = await NewsService.getBk(getBk_req);
        return res.json(getBk_data);
    } catch(err) {
        console.log("get breaking controller err");
    }
}
async function getCtgList(req, res, next) {
    try {
        const getCtgList_data = await NewsService.getCtgList();
        return res.json(getCtgList_data);
    } catch(err) {
        console.log("get category list controller err");
    }
}
async function getCtg(req, res, next) {
    try {
        const getCtg_req = req.query;
        console.log(getCtg_req);
        const getCtg_data = await NewsService.getCtg(getCtg_req);
        return res.json(getCtg_data);
    } catch(err) {
        console.log("get category controller err");
    }
}

module.exports = {
    getBkList, getBk, getCtgList, getCtg
}