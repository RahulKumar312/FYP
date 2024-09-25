const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const bookingSchema = new Schema({
    uid:{
        type:String,
    },
    sid:{
        type:String,
    },
    sverid:{
        type:String,
    },
    date:{
        type:String,
    },
    notes:{
        type:String,
    },
    status:{
        type:String,
    },
    lat:{
        type:String,
    },
    lon:{
        type:String,
    },
});

const bookingModel = db.model('booking',bookingSchema);
module.exports = bookingModel;