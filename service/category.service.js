const CategoryDao = require('../dao/category.dao');

async function addCg(req) {
    try {
        if(!req) {
            return {
                "Message" : "add category data nothing",
                "Status" : 406
            }
        }
        const addCg_data = await CategoryDao.editCg(req);
        return {
            "Message" : "add category success",
            "Status" : 200,
            "Data" : addCg_data
        }
    } catch(err) {
        return {
            "Message" : "add category service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}
async function getCg(req) {
    try {
        if(!req) {
            return {
                "Message" : "get category data nothing",
                "Status" : 406
            }
        }
        const getCg_data = await CategoryDao.getCg(req);
        return {
            "Message" : "get category success",
            "Status" : 200,
            "Data" : getCg_data
        }
    } catch(err) {
        return {
            "Message" : "get category service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}
async function editCg(req) {
    try {
        if(!req) {
            return {
                "Message" : "edit category data nothing",
                "Status" : 406
            }
        }
        const editCg_data = await CategoryDao.editCg(req);
        return {
            "Message" : "edit category success",
            "Status" : 200,
            "Data" : editCg_data
        }
    } catch(err) {
        return {
            "Message" : "edit category service fail",
            "Status" : 400,
            "Error_Message" : err
        }
    }
}

module.exports = {
    addCg, getCg, editCg
}