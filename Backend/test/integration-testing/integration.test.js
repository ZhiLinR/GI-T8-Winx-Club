const db = require("../../app/models");
const Controller = require("../../app/controllers/controller");

describe("Account API", () => {
    beforeAll(async () => {
        await db.mongoose
            .set("strictQuery", true)
            .connect(db.url, {
                useNewUrlParser: true,
                useUnifiedTopology: true,
            })
            .catch((err) => {
                console.log("Cannot connect to the database!", err);
                process.exit();
            });

        await db.accounts.insertMany(accounts);
    });

    // run before each test
    afterAll(async () => {
        await db.accounts.deleteMany({});
        await db.mongoose.disconnect();
    });

    it("should get account by username", async () => {
        const result = await Controller.findAccountByUsername("/accounts/:username");
        expect(result).toMatchObject(accounts[0]);
    })
})