const mongoose = require("mongoose");

const transactionSchema = new mongoose.Schema({
    doneBy: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
    },
    doneWith: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
    },
    doneOn: {
        type: Date,
        default: Date.now
    },
    cropName: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Crop"
    },
    pricePerUnit: {
        type: Number,
    },
});

const Transaction = new mongoose.model("Transaction", transactionSchema);

module.exports = Transaction;