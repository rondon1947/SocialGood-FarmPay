require("express-session");
const express = require("express"),
    app = express(),
    bodyParser = require("body-parser"),
    mongoose = require("mongoose"),
    passport = require("passport"),
    cookieParser = require("cookie-parser"),
    LocalStrategy = require("passport-local"),
    flash = require("connect-flash"),
    methodOverride = require("method-override"),
    User = require("./models/user")

const dotenvLoad = require('dotenv-load');
dotenvLoad();

// require("../Website/db/conn");

const userRoutes = require("./routes/user"),
    indexRoutes = require("./routes/index");
const seedDB = require("./seeds");

mongoose.Promise = global.Promise;

const databaseUri = 'mongodb://localhost:27017/wholesalers';

mongoose.connect(databaseUri, {useNewUrlParser: true, useUnifiedTopology: true})
    .then(() => console.log(`Database connected`))
    .catch(err => console.log(`Database connection error: ${err.message}`));

app.use(bodyParser.urlencoded({extended: false}));
app.set("view engine", "ejs");
app.use(express.static(__dirname + "/public"));
app.use(methodOverride('_method'));
app.use(cookieParser('secret'));
app.locals.moment = require('moment');
seedDB(); //seed the database

app.use(require("express-session")({
    secret: "Jai Jawaan Jai Kisaan!",
    resave: false,
    saveUninitialized: false
}));

app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
passport.use(new LocalStrategy(User.authenticate()));
passport.serializeUser(User.serializeUser());
passport.deserializeUser(User.deserializeUser());

app.use(function (req, res, next) {
    res.locals.currentUser = req.user;
    res.locals.success = req.flash('success');
    res.locals.error = req.flash('error');
    next();
});

app.use("/", indexRoutes);
app.use("/user", userRoutes);
// app.use("/campgrounds/:id/comments", commentRoutes);

const port = process.env.PORT || 3000;
app.listen(port, function () {
    console.log("Farming Toolkit Server Has Started!");
});