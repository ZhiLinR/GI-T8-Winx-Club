const mongoose = require("mongoose");
mongoose.Promise = global.Promise;

const db = {};
db.mongoose = mongoose;
db.url = process.env.DBCONN;
db.accounts = require("./account.model.js")(mongoose);
db.items = require("./item.model.js")(mongoose);
db.tasks = require("./task.model.js")(mongoose);

module.exports = db;