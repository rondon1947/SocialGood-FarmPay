var mongoose = require("mongoose");
var Farmer = require("./models/farmer");
var Bid = require("./models/bid");
var Crop = require("./models/crop");

var cropData = [
    {
        cropName: 'Wheat',
        cropMSP: 11.00,
    },
    {
        cropName: 'Rice',
        cropMSP: 10.00,
    },
    {
        cropName: 'Sugarcane',
        cropMSP: 8.00,
    },
    {
        cropName: 'Rice',
        cropMSP: 10.00,
    }
];

var bidData = [
    {
        crop: cropData[0],
        quantity: 180.00,
        pricePerUnit: 12.00,
        createdAt: Date.now(),
    },
    {
        crop: cropData[1],
        quantity: 580.00,
        pricePerUnit: 14.00,
        createdAt: Date.now(),
    },
    {
        crop: cropData[2],
        quantity: 320.00,
        pricePerUnit: 15.00,
        createdAt: Date.now(),
    },
    {
        crop: cropData[3],
        quantity: 1690.00,
        pricePerUnit: 11.00,
        createdAt: Date.now(),
    },
];

var farmerData = [
    {
        userName: 'Burpinder Singh',
        email: 'punjab.kisaan@gmail.com',
        address: 'Patiala',
    },
    {
        userName: 'Ramlal Singh',
        email: 'bihar.kisaan@gmail.com',
        address: 'Nawada',
    },
];

function seedDB() {
    var count = 0;
    Bid.remove({}, function (err) {
        if (err) {
            console.log(err);
        }
        bidData.forEach(function (seed) {
            Bid.create(seed, function (err, bid) {
                if (err) {
                    console.log(err)
                } else {
                    if (count < 2)
                        bid.madeBy = farmerData[0];
                    else
                        bid.madeBy = farmerData[1];
                }
            });
        });
    });
}

module.exports = seedDB;
