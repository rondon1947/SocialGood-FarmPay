const mongoose = require("mongoose");

const cropSchema = new mongoose.Schema({
    cropName: {
        type: String,
        required: true,
        unique: true
    },
    cropMSP: {
        type: Number,
        required: true,
    }
});

const Crop = new mongoose.model("Crop", cropSchema);

module.exports = Crop;