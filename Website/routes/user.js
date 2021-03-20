const express = require("express");
const router = express.Router();
const passport = require("passport");
const User = require('../models/user');
// const Bid = require('../models/campground');
// const Crop = require('../models/comment');
// const Farmer = require('../models/campground');
// const Refill = require('../models/comment');
// const Transaction = require('../models/campground');
const mongoose = require("mongoose");
mongoose.connect('mongodb://localhost/wholesalers');
var bids = null;
var connection = mongoose.connection;
connection.on('error', console.error.bind(console, 'connection error:'));
connection.once('open', function () {
    connection.db.collection("bids", function (err, collection) {
        collection.find({}).toArray(function (err, data) {
            bids = data;
        })
    });
});

router.get("/", function (req, res) {
    res.render("dashboard");
});

router.get("/seebids", function (req, res) {
    res.render("seebids", {bids: bids});
});

module.exports = router;