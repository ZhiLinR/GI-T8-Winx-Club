module.exports = app => {
    const controller = require("../controllers/controller.js");

    var router = require("express").Router();

    // get all accounts
    router.get("/accounts", controller.findAllAccounts);

    // get account by username
    router.get("/accounts/:username", controller.findAccountByUsername);

    // get account by username + pwd
    router.get("/accounts/:username/:password", controller.findAccountByUsernameAndPassword);

    // post account
    router.post("/accounts", controller.createAccount);

    // update account
    router.put("/accounts/:username", controller.updateAccount);

    // delete account
    router.delete("/accounts/:username", controller.deleteAccount);

    // get all items
    router.get("/items", controller.findAllItems);

    // get item by name
    router.get("/items/:item_name", controller.findItemByItemName);

    // post item
    router.post("/items", controller.createItem);

    // update item
    router.put("/items/:item_name", controller.updateItem);

    // delete item
    router.delete("/items/:item_name", controller.deleteItem);

    // get all tasks
    router.get("/tasks", controller.findAllTasks);

    // get task by name
    router.get("/tasks/:task_name", controller.findTaskByTaskName);

    // post task
    router.post("/tasks", controller.createTask);

    // update task
    router.put("/tasks/:task_name", controller.updateTask);

    // delete task
    router.delete("/tasks/:task_name", controller.deleteTask);

    app.use('/api', router);
};