const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

var corsOptions = {
    origin: '*'
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(express.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

const db = require("./app/models");

db.mongoose
    .set("strictQuery", true)
    .connect(db.url, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    })
    .then(() => {
        console.log("Connected to the database in server.js!");
    })
    .catch((err) => {
        console.log("Cannot connect to the database in server.js!", err);
        process.exit();
    });

// simple route
app.get('/', (req, res) => {
    res.json({ message: 'Welcome to our game.' });
});

require('./app/routes/routes.js')(app);

// set port, listen for requests
const PORT = process.env.NODE_LOCAL_PORT_TABLE || 8080;
app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server is running on port ${PORT}.`);
});
