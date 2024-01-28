const NewsDao = require('../dao/news.dao');

async function getBkList(req) {
    try {
        if(!req) {
            return {
                "Message" : "get breaking list data nothing",
                "Status" : 406
            }
        }
        const getBkList_data = await NewsDao.getBkList(req);
        return {
            "Message" : "get breaking list success",
            "Status" : 200,
            "Data" : getBkList_data
        }
    } catch(err) {
        return {
            "Message" : "get breaking list service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}
async function getBk(req) {
    try {
        if(!req) {
            return {
                "Message" : "get breaking list data nothing",
                "Status" : 406
            }
        }
        const getBk_data = await NewsDao.getBk(req);
        return {
            "Message" : "get breaking success",
            "Status" : 200,
            "Data" : getBk_data
        }
    } catch(err) {
        return {
            "Message" : "get breaking service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}
async function getCtgList(req) {
    try {
        if(!req) {
            return {
                "Message" : "get category list data nothing",
                "Status" : 406
            }
        }
        const getCtgList_data = await NewsDao.getCtgList(req);
        return {
            "Message" : "get category list success",
            "Status" : 200,
            "Data" : getCtgList_data
        }
    } catch(err) {
        return {
            "Message" : "get category list service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}
async function getCtg(req) {
    try {
        if(!req) {
            return {
                "Message" : "get category data nothing",
                "Status" : 406
            }
        }
        const getCtg_data = await NewsDao.getCtg(req);
        return {
            "Message" : "get category success",
            "Status" : 200,
            "Data" : getCtg_data
        }
    } catch(err) {
        return {
            "Message" : "get category service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}

module.exports = {
    getBkList, getBk, getCtgList, getCtg
}