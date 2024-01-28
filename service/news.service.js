const NewsDao = require('../dao/news.dao');

async function getBkList() {
    try {
        const getBkList_data = await NewsDao.getBkList();
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
        const getCtgList_data = await NewsDao.getCtgList();
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
        const getCtg_clip = await NewsDao.getCtgClip(req);
        var data = [];
        for(const element of getCtg_data) {
            data.push(element);
        }
        for(const element of getCtg_clip) {
            if(element.clip_id) {
                data.push(element);
            }
        }
        return {
            "Message" : "get category success",
            "Status" : 200,
            "Data" : data
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