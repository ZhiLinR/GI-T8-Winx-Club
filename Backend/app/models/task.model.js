module.exports = (mongoose) => {
    const tasks = mongoose.model(
        "tasks",
        mongoose.Schema({
            task_name: {
                type: String,
                required: true,
            },
            task_description: {
                type: String,
                required: true,
            }
        })
    );

    return tasks;
};