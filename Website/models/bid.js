const mongoose = require("mongoose");

const bidSchema = new mongoose.Schema({
    madeBy: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Farmer",
        required: true,
    },
    crop: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Crop",
        required: true,
    },
    quantity: {
        type: Number,
        required: true
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
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true,
    },
});

const Bid = new mongoose.model("Bid", bidSchema);

module.exports = Bid;