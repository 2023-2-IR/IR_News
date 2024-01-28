const HotDao = require('../dao/hot.dao');

async function addHot(req) {
    try {
        if(!req) {
            return {
                "Message" : "add hot news data nothing",
                "Status" : 406
            }
        }
        const addHotNews_data = await HotDao.addHotNews(req);
        for (const element of addHotNews_data) {
            await HotDao.addHotNewsData(element.pnews_id);
        }
        return {
            "Message" : "add hot news success",
            "Status" : 200,
            "Data" : addHotNews_data
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
        var getHotNews = [];
        for (const element of getHotId) {
            var data = await HotDao.getHotNews(element.pnews_id);
            getHotNews.push(data);
        }
        console.log(getHotNews);
        return {
            "Message" : "get hot list success",
            "Status" : 200,
            "Data" : getHotNews
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