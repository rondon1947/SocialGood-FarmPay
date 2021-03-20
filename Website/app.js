require("express-session");
const express = require("express"),
    app = express(),
    bodyParser = require("body-parser"),
    mongoose = require("mongoose"),
    passport = require("passport"),
    cookieParser = require("cookie-parser"),
    LocalStrategy = require("passport-local"),
    flash = require("connect-flash"),
    methodOverride = require("method-override");

const dotenvLoad = require('dotenv-load');
dotenvLoad();

require("../Website/db/conn");

app.get("/", function (req, res) {
    //  res.sendFile(__dirname +"/home.html");
    res.render("index.ejs");
});

app.get("/login", function (req, res) {
    res.render("login.ejs");
});

app.get("/register", function (req, res) {
    res.render("register.ejs");
})

app.get("/stocks", function (req, res) {
    res.render("stocks.ejs");
})

app.get("/seebids", function (req, res) {
    res.render("seebids.ejs");
});

app.get("/previousdeals", function (req, res) {
    res.render("previous_trans.ejs");
});

app.get("/shop", function (req, res) {
    res.render("shop_page.ejs");
});

app.post("/register", async function (req, res) {

    try {
        const username = req.body.name;
        const email = req.body.email;
        const password = req.body.password;

        const registerUser = new User({
            name: username,
            email: email,
            password: password
        })

        const registered = await registerUser.save();
        res.status(201).render("index.ejs");

    } catch (error) {
        res.status(400).send(error);
    }

})

app.post("/dashboard", async function (req, res) {

    try {
        const email = req.body.email;
        const password = req.body.password;

        const user_email = await User.findOne({email: email});

        if (user_email.password === password) {
            res.status(201).render("dashboard.ejs", {username: user_email.name});

        } else {
            res.send("user email or password invalid");
        }

    } catch (error) {
        res.status(400).send(error);
    }

})

mongoose.Promise = global.Promise;

const databaseUri = process.env.DATABASEURL || 'mongodb://localhost/yelp_camp';

mongoose.connect(databaseUri, {useNewUrlParser: true, useUnifiedTopology: true})
    .then(() => console.log(`Database connected`))
    .catch(err => console.log(`Database connection error: ${err.message}`));

app.use(bodyParser.urlencoded({extended: true}));
app.set("view engine", "ejs");
app.use(express.static(__dirname + "/public"));
app.use(methodOverride('_method'));
app.use(cookieParser('secret'));
app.locals.moment = require('moment');
// seedDB(); //seed the database

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

const port = process.env.PORT || 3000;
app.listen(port, function () {
    console.log("Farming Toolkit Server Has Started!");
});