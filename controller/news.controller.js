const NewsService = require('../service/news.service');

async function getBkList(req, res, next) {
    try {
        const getBkList_req = req.query;
        console.log(getBkList_req);
        const getBkList_data = await NewsService.getBkList(getBkList_req);
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
        const getCtgList_req = req.query;
        console.log(getCtgList_req);
        const getCtgList_data = await NewsService.getCtgList(getCtgList_req);
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