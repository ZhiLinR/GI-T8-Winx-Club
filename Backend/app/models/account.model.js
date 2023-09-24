module.exports = (mongoose) => {
    const accounts = mongoose.model(
        "accounts",
        mongoose.Schema({
            username: {
                type: String,
                required: true,
            },
            password: {
                type: String,
                required: true,
            },
            nickname: {
                type: String,
                required: true,
            },
            balance: {
                type: Number,
                min: 0,
                default: 0,
            },
            items: [{ item_name: String, item_count: Number }],
        })
    );

    return accounts;
};