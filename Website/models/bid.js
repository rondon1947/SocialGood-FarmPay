const mongoose = require("mongoose");

const bidSchema = new mongoose.Schema({
    madeBy: {
        username: {
            type: String,
        },
        address: {
            type: String,
        },
        email: {
            type: String,
        },
    },
    crop: {
        cropName: {
            type: String,
        },
        cropMSP: {
            type: Number,
        }
    },
    quantity: {
        type: Number,
    },
    pricePerUnit: {
        type: Number,
    },
    offersBy: [
        {
            bidder: {
                type: mongoose.Schema.Types.ObjectId,
                ref: "User",
            },
            amount: Number,
        },
    ],
    acceptedBy: {
        username: {
            type: String,
        },
        address: {
            type: String,
        },
        email: {
            type: String,
        },
    },
});


module.exports = mongoose.model("Bid", bidSchema);