const express = require("express");
const router = express.Router();
const passport = require("passport");
const User = require('../models/user');
// const Bid = require('../models/campground');
// const Crop = require('../models/comment');
// const Farmer = require('../models/campground');
// const Refill = require('../models/comment');
// const Transaction = require('../models/campground');

router.get("/", function (req, res) {
   res.render("dashboard");
});

module.exports = router;