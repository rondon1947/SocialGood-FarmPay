const mongoose = require("mongoose");

const stockRefillSchema = new mongoose.Schema({
    madeBy: {
        id: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "User",
            required: true,
        },
        name: String,
    },
    crop: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Crop",
        required: true,
    },
    quantity: {
        type: Number,
        required: true,
    },
    pricePerUnit: {
        type: Number,
        required: true
    },
    createdAt: {
        type: Date,
        default: Date.now,
    },
    acceptedBy: {
        id: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "User",
            required: true,
        },
        name: String,
    },
});

const StockRefill = new mongoose.model("StockRefill", stockRefillSchema);

module.exports = StockRefill;