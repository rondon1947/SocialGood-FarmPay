const mongoose = require("mongoose");
const passportLocalMongoose = require("passport-local-mongoose");

const userSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
        unique: true,
    },
    address: {
        type: String,
        required: true,
    },
    stocks: [
        {
            crop: {
                type: mongoose.Schema.Types.ObjectId,
                ref: "Crop",
            },
            quantity: Number,
        },
    ],
    // bidsAccepted: [
    //     {
    //         type: mongoose.Schema.Types.ObjectId,
    //         ref: "Bid",
    //     },
    // ],
    // refillsRequested: [
    //     {
    //         type: mongoose.Schema.Types.ObjectId,
    //         ref: "StockRefill",
    //     },
    // ],
    // refillsAccepted: [
    //     {
    //         type: mongoose.Schema.Types.ObjectId,
    //         ref: "StockRefill",
    //     },
    // ],
    // transactions: [
    //     {
    //         type: mongoose.Schema.Types.ObjectId,
    //         ref: "Transaction",
    //     },
    // ],
});

userSchema.plugin(passportLocalMongoose)

module.exports = mongoose.model("User", userSchema);