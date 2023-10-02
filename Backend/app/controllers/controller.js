const db = require("../models");
const Account = db.accounts;
const Item = db.items;
const Task = db.tasks;

// get all accounts
exports.findAllAccounts = (req, res) => {
    Account.find()
        .then(data => {
            res.status(200).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error occurred while retrieving accounts."
            });
        });
};

// get account by username
exports.findAccountByUsername = (req, res) => {
    const username = req.params.username;

    Account.findOne({ where: { username: username } })
        .then(data => {
            if (data) {
                res.status(200).send(data);
            } else {
                res.status(404).send({
                    message: `Cannot find account with username=${username}.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error retrieving account with username=" + username
            });
        });
};

// get account by username + pwd
exports.findAccountByUsernameAndPassword = (req, res) => {
    const username = req.params.username;
    const password = req.params.password;

    Account.findOne({ where: { username: username, password: password } })
        .then(data => {
            if (data) {
                res.status(200).send(data);
            } else {
                res.status(404).send({
                    message: `Cannot find account with username=${username} and password=${password}.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error retrieving account with username=" + username + " and password=" + password
            });
        });
};

// post account
exports.createAccount = (req, res) => {
    // Validate request
    if (!req.body.username) {
        res.status(400).send({
            message: "Content cannot be empty!"
        });
        return;
    }

    // Create an Account
    const account = {
        username: req.body.username,
        password: req.body.password,
        nickname: req.body.nickname
    };

    // Save Account in the database
    Account.create(account)
        .then(data => {
            res.status(201).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "An error occurred while creating the account."
            });
        });
};

// update account
exports.updateAccount = (req, res) => {
    const username = req.params.username;

    Account.findOneAndUpdate({ where: { username: username } }, req.body)
        .then(data => {
            if (data) {
                res.status(201).send({
                    message: "Account was updated successfully."
                });
            } else {
                res.status(404).send({
                    message: `Cannot update account with username=${username}. User was not found.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error updating account with username=" + username
            });
        });
};

// delete account
exports.deleteAccount = (req, res) => {
    const username = req.params.username;

    Account.findOneAndDelete({ where: { username: username } })
        .then(data => {
            if (data) {
                res.status(200).send({
                    message: "Account was deleted successfully."
                });
            } else {
                res.status(404).send({
                    message: `Cannot delete account with username=${username}. User was not found.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error deleting account with username=" + username
            });
        });
};

// get all items
exports.findAllItems = (req, res) => {
    Item.find()
        .then(data => {
            res.status(200).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error occurred while retrieving items."
            });
        });
};

// get item by name
exports.findItemByItemName = (req, res) => {
    const item_name = req.params.item_name;

    Item.findOne({ where: { item_name: item_name } })
        .then(data => {
            if (data) {
                res.status(200).send(data);
            } else {
                res.status(404).send({
                    message: `Cannot find item with item_name=${item_name}.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error retrieving item with item_name=" + item_name
            });
        });
};

// post item
exports.createItem = (req, res) => {
    // Validate request
    if (!req.body.item_name) {
        res.status(400).send({
            message: "Content cannot be empty!"
        });
        return;
    }

    // Create an Item
    const item = {
        item_name: req.body.item_name,
        item_price: req.body.item_price
    };

    // Save Item in the database
    Item.create(item)
        .then(data => {
            res.status(201).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "An error occurred while creating the item."
            });
        });
};

// update item
exports.updateItem = (req, res) => {
    const item_name = req.params.item_name;

    Item.findOneAndUpdate({ where: { item_name: item_name } }, req.body)
        .then(data => {
            if (data) {
                res.status(201).send({
                    message: "Item was updated successfully."
                });
            } else {
                res.status(404).send({
                    message: `Cannot update item with item_name=${item_name}. Item was not found.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error updating item with item_name=" + item_name
            });
        });
};

// delete item
exports.deleteItem = (req, res) => {
    const item_name = req.params.item_name;

    Item.findOneAndDelete({ where: { item_name: item_name } })
        .then(data => {
            if (data) {
                res.status(200).send({
                    message: "Item was deleted successfully."
                });
            } else {
                res.status(404).send({
                    message: `Cannot delete item with item_name=${item_name}. Item was not found.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error deleting item with item_name=" + item_name
            });
        });
};

// get all tasks
exports.findAllTasks = (req, res) => {
    Task.find()
        .then(data => {
            res.status(200).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error occurred while retrieving tasks."
            });
        });
};

// get task by name
exports.findTaskByTaskName = (req, res) => {
    const task_name = req.params.task_name;

    Task.findOne({ where: { task_name: task_name } })
        .then(data => {
            if (data) {
                res.status(200).send(data);
            } else {
                res.status(404).send({
                    message: `Cannot find task with task_name=${task_name}.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error retrieving task with task_name=" + task_name
            });
        });
};

// post task
exports.createTask = (req, res) => {
    // Validate request
    if (!req.body.task_name) {
        res.status(400).send({
            message: "Content cannot be empty!"
        });
        return;
    }

    // Create a Task
    const task = {
        task_name: req.body.task_name,
        task_description: req.body.task_description
    };

    // Save Task in the database
    Task.create(task)
        .then(data => {
            res.status(201).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "An error occurred while creating the task."
            });
        });
};

// update task
exports.updateTask = (req, res) => {
    const task_name = req.params.task_name;

    Task.findOneAndUpdate({ where: { task_name: task_name } }, req.body)
        .then(data => {
            if (data) {
                res.status(201).send({
                    message: "Task was updated successfully."
                });
            } else {
                res.status(404).send({
                    message: `Cannot update task with task_name=${task_name}. Task was not found.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error updating task with task_name=" + task_name
            });
        });
};

// delete task
exports.deleteTask = (req, res) => {
    const task_name = req.params.task_name;

    Task.findOneAndDelete({ where: { task_name: task_name } })
        .then(data => {
            if (data) {
                res.status(200).send({
                    message: "Task was deleted successfully."
                });
            } else {
                res.status(404).send({
                    message: `Cannot delete task with task_name=${task_name}. Task was not found.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Error deleting task with task_name=" + task_name
            });
        });
};
