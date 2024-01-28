const CategoryService = require('../service/category.service');

async function addCg(req, res, next) {
    try {
        const addCg_req = req.body;
        console.log(addCg_req);
        const addCg_data = await CategoryService.addCg(addCg_req);
        return res.json(addCg_data);
    } catch(err) {
        console.log("add category controller err");
    }
}
async function getCg(req, res, next) {
    try {
        const getCg_req = req.query;
        console.log(getCg_req);
        const getCg_data = await CategoryService.getCg(getCg_req);
        return res.json(getCg_data);
    } catch(err) {
        console.log("get category controller err");
    }
}
async function editCg(req, res, next) {
    try {
        const editCg_req = req.body;
        console.log(editCg_req);
        const editCg_data = await CategoryService.editCg(editCg_req);
        return res.json(editCg_data);
    } catch(err) {
        console.log("edit category controller err");
    }
}

module.exports = {
    addCg, getCg, editCg
}