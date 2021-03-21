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

var farmerData = [
    {
        username: 'Burpinder Singh',
        email: 'punjab.kisaan@gmail.com',
        address: 'Patiala',
    },
    {
        username: 'Ramlal Singh',
        email: 'bihar.kisaan@gmail.com',
        address: 'Nawada',
    },
    {
        username: 'Ramakrishna Malhaar',
        email: 'kerela.kisaan@gmail.com',
        address: 'Cochin',
    },
    {
        username: 'Baswaan Samant',
        email: 'assam.kisaan@gmail.com',
        address: 'Bodonagar',
    },
];

var bidData = [
    {
        crop: cropData[0],
        quantity: 180.00,
        pricePerUnit: 12.00,
        createdAt: Date.now(),
        madeBy: {
            username: farmerData[0].username,
            email: farmerData[0].email,
            address: farmerData[0].address,
        },
    },
    {
        crop: cropData[1],
        quantity: 580.00,
        pricePerUnit: 14.00,
        createdAt: Date.now(),
        madeBy: {
            username: farmerData[1].username,
            email: farmerData[1].email,
            address: farmerData[1].address,
        },
    },
    {
        crop: cropData[2],
        quantity: 320.00,
        pricePerUnit: 15.00,
        createdAt: Date.now(),
        madeBy: {
            username: farmerData[2].username,
            email: farmerData[2].email,
            address: farmerData[2].address,
        },
    },
    {
        crop: cropData[3],
        quantity: 1690.00,
        pricePerUnit: 11.00,
        createdAt: Date.now(),
        madeBy: {
            username: farmerData[3].username,
            email: farmerData[3].email,
            address: farmerData[3].address,
        },
    },
];

function seedDB() {
    Bid.remove({}, function () {
    });
    bidData.forEach(function (seed) {
        Bid.create(seed, function (err, bid) {
            if (err) {
                console.log(err)
            }
        });
    });
}

module.exports = seedDB;
