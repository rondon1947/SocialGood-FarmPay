const express = require("express");
const router = express.Router();
const passport = require("passport");
const User = require('../models/comment');
const Bid = require('../models/campground');
const Crop = require('../models/comment');
const Farmer = require('../models/campground');
const Refill = require('../models/comment');
const Transaction = require('../models/campground');

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
    const newUser = new User({name: req.body.name}, {email: req.body.email}, {address: req.body.address});
    if (req.body.adminCode === process.env.ADMIN_CODE) {
        newUser.isAdmin = true;
    }
    User.register(newUser, req.body.password, function (err, user) {
        if (err) {
            console.log(err);
            return res.render("register", {error: err.message});
        }
        passport.authenticate("local")(req, res, function () {
            req.flash("success", "Successfully Signed Up! Welcome to YelpCamp! Nice to meet you " + req.body.username);
            res.redirect("/campgrounds");
        });
    });
});


//show login form
router.get("/login", function(req, res){
    res.render("login", {page: 'login'});
});

//handling login logic
router.post("/login", passport.authenticate("local",
    {
        successRedirect: "/dashboard",
        failureRedirect: "/login",
        failureFlash: true,
        successFlash: 'Welcome to Farming Toolkit!'
    }), function(req, res){
});

router.get("/logout", function(req, res){
    req.logout();
    req.flash("success", "See you later!");
    res.redirect("/index");
});


module.exports = router;