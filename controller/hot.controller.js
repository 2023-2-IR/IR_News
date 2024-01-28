const HotService = require('../service/hot.service');

async function addHot(req, res, next) {
    try {
        const addHot_req = req.body;
        console.log(addHot_req);
        const addHot_data = await HotService.addHot(addHot_req);
        return res.json(addHot_data);
    } catch(err) {
        console.log("add hot news controller err");
    }
}
async function getHot(req, res, next) {
    try {
        const getHot_req = req.query;
        console.log(getHot_req);
        const getHot_data = await HotService.getHot(getHot_req);
        return res.json(getHot_data);
    } catch(err) {
        console.log("get hot list controller err");
    }
}

module.exports = {
    addHot, getHot
}