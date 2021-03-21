const express = require("express");
const router = express.Router();
const passport = require("passport");
const User = require('../models/user');
const Bid = require('../models/bid');
// const Crop = require('../models/comment');
// const Farmer = require('../models/campground');
// const Refill = require('../models/comment');
// const Transaction = require('../models/campground');
// const middleware = require("../middleware");
// const { isLoggedIn, checkUserComment, isAdmin } = middleware;
const mongoose = require("mongoose");
// mongoose.connect('mongodb://localhost/wholesalers');
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

router.post("/seebids/:id" /*isLoggedIn()*/, function (req, res) {
    const myId = req.params.id;
    let myBid = null;
    Bid.findById(myId).then(bid => {
        if (!bid)
            console.log("Not Found");
        else
            myBid = bid;
    }).catch(err => {
        console.log("error");
    });
    User.create(req.body.name, function (err, user) {
        if (err)
            console.log(err);
        else {
            user.username = req.user.username;
            user.email = req.user.email;
            user.address = req.user.address;
            user.save();
            myBid.offersBy.push(user, {amount: req.body.bidAmt});
        }
    });
    res.render("seebids", {bids: bids});
});

module.exports = router;