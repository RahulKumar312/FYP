const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const serviceSchema = new Schema({
    number:{
        type:String,
    },
    title:{
        type:String,  
    },
    des:{
        type:String,
    },
    duration:{
        type:String,
    },
    price:{
        type:String,
    },
    frequency:{
        type:String,
    },
    servantcat:{
        type:String,
    },
});

const serviceModel = db.model('serviceSchema',serviceSchema);
module.exports = serviceModel;