const HotDao = require('../dao/category.dao');

async function addHot(req) {
    try {
        if(!req) {
            return {
                "Message" : "add hot news data nothing",
                "Status" : 406
            }
        }
        const addHotBk_data = await HotDao.addHotBk(req);
        const addHotNews_data = await HotDao.addHotNews(req);

        // 두 친구를 비교하여 hits가 높은 순서대로...
        // 보고 그대로 하면 되니까 안어렵자나!!

        return {
            "Message" : "add hot news success",
            "Status" : 200,
            "Data" : addHot_data
        }
    } catch(err) {
        return {
            "Message" : "add hot news service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}
async function getHot(req) {
    try {
        if(!req) {
            return {
                "Message" : "get hot list data nothing",
                "Status" : 406
            }
        }
        const getHotId = await HotDao.getHotId(req);
        //반복문 돌려서 해야 할 듯 pnews id가 있으면 그거 돌리고 bk id가 있으면 그거 돌리고
        // const getHotBk = await HotDao.getHotBk(id);
        // const getHotNews = await HotDao.getHotNews(id);
        return {
            "Message" : "get hot list success",
            "Status" : 200,
            "Data" : getHot_data
        }
    } catch(err) {
        return {
            "Message" : "get hot list service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}

module.exports = {
    addHot, getHot
}