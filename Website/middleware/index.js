const User = require('../models/user');
// const Bid = require('../models/campground');
// const Crop = require('../models/comment');
// const Farmer = require('../models/campground');
// const Refill = require('../models/comment');
// const Transaction = require('../models/campground');

module.exports = {
    isLoggedIn: function(req, res, next){
        if(req.isAuthenticated()){
            return next();
        }
        req.flash('error', 'You must be signed in to do that!');
        res.redirect('/login');
    },
    checkUserRefill: function(req, res, next){
        Refill.findById(req.params.id, function(err, foundRefill){
            if(err || !foundRefill){
                console.log(err);
                req.flash('error', 'Sorry, this refill request does not exist!');
                res.redirect('/dashboard');
            } else if(foundRefill.author.id.equals(req.user._id)){
                req.refill = foundRefill;
                next();
            } else {
                req.flash('error', 'You don\'t have permission to do that!');
                res.redirect('/dashboard' + req.params.id);
            }
        });
    },
    checkUserComment: function(req, res, next){
        Comment.findById(req.params.commentId, function(err, foundComment){
            if(err || !foundComment){
                console.log(err);
                req.flash('error', 'Sorry, that comment does not exist!');
                res.redirect('/campgrounds');
            } else if(foundComment.author.id.equals(req.user._id) || req.user.isAdmin){
                req.comment = foundComment;
                next();
            } else {
                req.flash('error', 'You don\'t have permission to do that!');
                res.redirect('/campgrounds/' + req.params.id);
            }
        });
    },
};
