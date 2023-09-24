module.exports = (mongoose) => {
    const items = mongoose.model(
        "items",
        mongoose.Schema({
            item_name: {
                type: String,
                required: true,
            },
            item_price: {
                type: Number,
                required: true,
            }
        })
    );

    return items;
};