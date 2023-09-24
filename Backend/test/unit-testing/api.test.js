var express = require('express'); // (npm install --save express)
var request = require('supertest');

function createApp() {
    app = express();

    var router = express.Router();
    router.route('/').get(function (req, res) {
        return res.json({ "message": "Welcome to our game." });
    });

    app.use(router);

    return app;
}

describe('GET accounts', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            done();
        });
    });

    it('response 200', function (done) {
        request(app)
            .get('/api/accounts')
            .expect(200, done());
    });

});

describe('GET account by username', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/accounts')
                .set('Content-Type', 'application/json')
                .send({ username: "yun", password: "12345", nickname: "yun" });
        });
        done();
    });

    it('reponse 200', function (done) {
        request(app)
            .get('/api/accounts/yun')
            .expect(200, done());
    });

});

describe('GET account by username and password', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/accounts')
                .set('Content-Type', 'application/json')
                .send({ username: "yun", password: "12345", nickname: "yun" });
        });
        done();
    });

    it('reponse 200', function (done) {
        request(app)
            .get('/api/accounts/yun/12345')
            .expect(200, done());
    });

});

describe('POST account', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
        });
        done();
    });

    it('response 201', function (done) {
        request(app)
            .post('/api/accounts')
            .set('Content-Type', 'application/json')
            .send({ username: "yun", password: "12345", nickname: "yun" })
            .expect(201, done());
    });

});

describe('PUT account', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/accounts')
                .set('Content-Type', 'application/json')
                .send({ username: "yun", password: "12345", nickname: "yun" });
            done();
        });
    });

    it('response 200', function (done) {
        request(app)
            .put('/api/accounts/yun')
            .set('Content-Type', 'application/json')
            .send({ username: "yun", password: "12345", nickname: "soe" })
            .expect(200, done());
    });

});

describe('DELETE account', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/accounts')
                .set('Content-Type', 'application/json')
                .send({ username: "yun", password: "12345", nickname: "yun" });
            done();
        });
    });

    it('response 200', function (done) {
        request(app)
            .delete('/api/accounts/yun')
            .expect(200, done());
    });

});

describe('GET items', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            done();
        });
    });

    it('response 200', function (done) {
        request(app)
            .get('/api/items')
            .expect(200, done());
    });

});

describe('GET item by item_name', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/items')
                .set('Content-Type', 'application/json')
                .send({ item_name: "table", item_price: 150 });
        });
        done();
    });

    it('reponse 200', function (done) {
        request(app)
            .get('/api/items/table')
            .expect(200, done());
    });

});

describe('POST item', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
        });
        done();
    });

    it('response 201', function (done) {
        request(app)
            .post('/api/items')
            .set('Content-Type', 'application/json')
            .send({ item_name: "table", item_price: 150 })
            .expect(201, done());
    });

});

describe('PUT item', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/items')
                .set('Content-Type', 'application/json')
                .send({ item_name: "table", item_price: 150 });
            done();
        });
    });

    it('response 200', function (done) {
        request(app)
            .put('/api/accounts/yun')
            .set('Content-Type', 'application/json')
            .send({ item_name: "table", item_price: 100 })
            .expect(200, done());
    });

});

describe('DELETE item', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/items')
                .set('Content-Type', 'application/json')
                .send({ item_name: "table", item_price: 150 });
            done();
        });
    });

    it('response 200', function (done) {
        request(app)
            .delete('/api/items/table')
            .expect(200, done());
    });

});

describe('GET tasks', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            done();
        });
    });

    it('response 200', function (done) {
        request(app)
            .get('/api/tasks')
            .expect(200, done());
    });

});

describe('GET task by task_name', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/tasks')
                .set('Content-Type', 'application/json')
                .send({ task_name: "close tap", task_description: "Close the tap please!" });
        });
        done();
    });

    it('reponse 200', function (done) {
        request(app)
            .get('/api/tasks/close tap')
            .expect(200, done());
    });

});

describe('POST task', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
        });
        done();
    });

    it('response 201', function (done) {
        request(app)
            .post('/api/tasks')
            .set('Content-Type', 'application/json')
            .send({ task_name: "close tap", task_description: "Close the tap please!" })
            .expect(201, done());
    });

});

describe('PUT task', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/tasks')
                .set('Content-Type', 'application/json')
                .send({ task_name: "close tap", task_description: "Close the tap please!" });
            done();
        });
    });

    it('response 200', function (done) {
        request(app)
            .put('/api/tasks/close tap')
            .set('Content-Type', 'application/json')
            .send({ task_name: "close tap", task_description: "Close the tap!" })
            .expect(200, done());
    });

});

describe('DELETE task', function () {
    var app;

    // Called once before any of the tests in this block begin.
    before(function (done) {
        app = createApp();
        app.listen(function (err) {
            if (err) { return done(err); }
            request(app)
                .post('/api/tasks')
                .set('Content-Type', 'application/json')
                .send({ task_name: "close tap", task_description: "Close the tap!" });
            done();
        });
    });

    it('response 200', function (done) {
        request(app)
            .delete('/api/tasks/close tap')
            .expect(200, done());
    });

});
