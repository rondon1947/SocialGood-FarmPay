const express = require("express");
const router = express.Router();
const passport = require("passport");
const User = require('../models/user.js');
// const Bid = require('../models/campground');
// const Crop = require('../models/comment');
// const Farmer = require('../models/campground');
// const Refill = require('../models/comment');
// const Transaction = require('../models/campground');

//root route
router.get("/", function (req, res) {
    res.render("index");
});

// show register form
router.get("/register", function (req, res) {
    res.render("register", {page: 'register'});
});

//handle sign up logic
router.post("/register", function (req, res) {
    console.log(req.body);
    const username = req.body.username;
    const email = req.body.email;
    const address = req.body.address;
    const newUser = new User({username: username, email: email, address: address});
    console.log(newUser);
    User.register(newUser, req.body.password, function (err, user) {
        if (err) {
            console.log("Hmko kuch nhi aata..");
            console.log(err);
            return res.render("register", {error: err.message});
        }
        passport.authenticate("local")(req, res, function () {
            console.log("Sab sahi hai!!")
            req.flash("success", "Successfully Signed Up! Welcome to YelpCamp! Nice to meet you " + req.body.userName);
            res.render("dashboard", {username: username});
        });
    });
});


//show login form
router.get("/login", function(req, res){
    res.render("login", {page: 'login'});
});

//handling login logic
router.post("/login", passport.authenticate("local"), function (req, res){
    console.log(req.body);
    console.log("Sab theek");
    res.render("dashboard", {username: req.body.username});
});

router.get("/logout", function(req, res){
    req.logout();
    req.flash("success", "See you later!");
    res.redirect("/index");
});


module.exports = router;