const mongoose = require("mongoose");

const farmerSchema = new mongoose.Schema({
    userName: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    address: {
        type: String,
        required: true,
    },
    cropsGrown: {
        crop: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Crop"
        },
        quantity: Number
    },
    bidsCreated: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Bid"
        }
    ],
    transactions: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Transaction"
        }
    ],
});

module.exports = mongoose.model("Farmer", farmerSchema);